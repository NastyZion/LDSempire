# STORYBOARD TECHNIQUE
## Production Cinématographique : Casting & Setup Scrollytelling

### Étape A - Le Casting : Planche de référence (FaceID)
- Générer un portrait haute résolution du couple (Lui : 30 ans, barbe de 3 jours, athlétique. Elle : 28 ans, carré brun, élégante) en utilisant un modèle de base RealVisXL ou SDXL.
- Appliquer le skill **Character Consistency Specialist** : extraire les embeddings IP-Adapter et/ou entraîner une LoRA légère sur 5-10 vues variées du couple.
- Sauvegarder la référence comme `REFERENCE_COUPLE.jpg` et les poids associés (`faceid_embedding.bin`, `character_lora.safetensors`).
- Cette référence sera injectée dans chaque génération pour garantir l'identité faciale, la coupe de cheveux, la barbe et la silhouette.

### Étape B - Le Layout des Transitions
Nous utilisons trois compétences complémentaires :

#### 1. Character Consistency Specialist (LoRA & IP-Adapter)
- Verrouille l'apparence du couple via IP-Adapter (échelle 0.7‑0.85) et LoRA (poids 0.6‑0.9).
- Évite les dérives de phenotype lors des changements de pose ou d'éclairage.

#### 2. Motion Director (ControlNet & Optical Flow)
- Pour chaque transition, nous définissons une **trajectoire de pose** (ex : marche vers la caméra) et nous interpolons les poses clés à l'aide d'OpenPose.
- Nous générons une séquence de cartes de pose (ControlNet) qui guident le modèle tout en permettant le changement de décor.
- Optionnellement, nous calculons un flux optique dense entre deux images clés pour affiner l'interpolation et réduire les saccades.

#### 3. Prompt Architect (Cinematic Lighting)
- Chaque scène reçoit un prompt enrichi de termes cinématographiques : lentille anamorphique, grain de film 35mm, éclairage teal/orange, god rays, etc.
- Le prompt inclut également la description du décor et de l'action, mais laisse la pose être guidée par ControlNet.

#### Application aux trois transitions spécifiées :

**Transition 1 : Marche (Bar 3e) → Marche (Appartement)**
- Pose clé : marche vers la caméra, pied gauche en avant, bras légèrement oscillant.
- Extraire les poses OpenPose d'une référence de marche (peut être prise d'une vidéo ou générée une fois).
- Interpoler linéairement les keypoints entre la pose de départ (terrasse) et la pose d'arrivée (appartement) – en réalité, la pose reste identique, seul le fond change.
- Générer N images (ex : 24 pour 1 seconde à 24 fps) où le prompt passe de « Terrasses festive Paris 3e, jour, lumière dorée, lentille anamorphique » à « Intérieur d'appartement matin, lumière douce provenant d'une fenêtre, lentille anamorphique ».
- Le fond change progressivement grâce au texte du prompt, tandis que la pose reste fixée par ControlNet.
- Utiliser IP-Adapter + LoRA pour garder le couple identique.

**Transition 2 : Demande en mariage (Rue) → Stress (Bulle BD)**
- Pose clé : genou à terre, main présentant la bague, regard de la femme vers le haut (joie) → puis visage de la femme montrant du stress, main tenant la tempe.
- Ici, la pose change considérablement ; nous utilisons donc deux poses clés différentes.
- Nous créons une séquence où la pose passe progressivement de la demande à une position neutre, puis à la pose de stress (en utilisant le même principe d'interpolation de keypoints).
- Le fond passe de rue de nuit à intérieur moderne.
- Dans l'image de stress, nous ajoutons explicitement au prompt : « bulle de bande dessinée géante avec texte \"STRESS\" et icônes logistique (horloge, liste, téléphone) flottant autour de la tête ».
- Le skill Prompt Architect ajoute un éclairage dramatique de nuit pour la rue et une lumière intérieure froide et stressante pour l'appartement.

**Transition 3 : Zoom dans l'écran → Rideau rose (Néon)**
- Pose clé : couple devant leurs écrans (lui sur PC, elle sur mobile), puis même pose mais attirés par un rideau qui s'ouvre.
- Nous simulons un zoom en faisant progressivement décroître la taille des écrans dans l'image tout en augmentant la visibilité du rideau en arrière-plan.
- Technique : utiliser ControlNet de profondeur (depth map) pour contrôler la distance focale ; nous commençons avec une carte de profondeur montrant les écrans proches et le rideau loin, puis nous inversons.
- Alternativement, nous pouvons générer une séquence où le prompt passe de « Lui sur PC, elle sur mobile, lumière d'écran bleu » à « Rideau rose intégrant le logo neon blanc \"Laet's Danse Studio\", lumière de scène ».
- Le skill Prompt Architect spécifie une lentille anamorphique pour un effet cinématographique, avec un léger flou de mouvement sur les écrans pendant le zoom.

### Étape C - Premier Plan de Test : Transition de 2 secondes (48 images) entre le bar et l'appartement
- **Objectif** : prouver que le raccord de mouvement est fluide et que l'identité du couple est préservée.
- **Méthode** :
  1. Utiliser la référence du couple (FaceID) générée à l'Étape A.
  2. Définir une pose de marche constante (ex : séquence de marche capturée via OpenPose sur une référence vidéo).
  3. Générer 48 images où le prompt évolue linéairement de « Terrasses festive Paris 3e, jour, amis, lumière dorée » à « Intérieur d'appartement matin, lumière douce provenant d'une fenêtre ».
  4. À chaque image, appliquer :
     - IP-Adapter (référence du couple, échelle 0.75)
     - LoRA (poids 0.8)
     - ControlNet de pose (pose de marche interpolée, poids 0.7)
     - Prompt Architect : lentille anamorphique 35mm, grain de film Kodak Portra 400, teal/orange léger.
  5. Échantillonnage : DPM++ 2M Karras, 28 étapes, CFG 7, taille 1024x1024.
  6. Après génération, mesurer la similarité des visages via CLIP ou ArcFace pour s'assurer que l'écart est inférieur à un seuil (ex : distance cosinus < 0.1).
  7. Visualiser la séquence comme un flipbook ou une vidéo à 24 fps pour vérifier la fluidité du mouvement et l'absence de saccades dans le fond ou le personnage.

- **Résultat attendu** : Une transition où le couple marche de façon naturelle vers la caméra tandis que le fond passe du bar à l'appartement sans rupture apparente dans le mouvement ou l'apparence.

### Outils et Modèles Recommandés (Zero‑Cost)
- **Base Modèle** : RealVisXL V4.0 ou SDXL 1.0 (via Hugging Face, nécessitant un token HF pour le téléchargement, mais inference possible via API gratuites comme Pollinations avec adaptations).
- **LoRA & IP‑Adapter** : entraînés localement sur quelques images de référence (utiliser kohya_ss pour l'entraînement LoRA, et le dépôt officiel IP‑Adapter).
- **ControlNet** : officiel SDXL ControlNet (pose, depth) depuis lllyasviel/ControlNet.
- **Flux Optique** : RAFT ou FlowNet2 (implémentations open‑source).
- **Interface** : ComfyUI ou scripts Python utilisant diffusers.
- **Note** : En raison des limites des API gratuites (rate limits, résolution), une production fluide de 48 images peut nécessiter un déploiement local léger (GPU modeste) ou des batches avec délais importants. La méthodologie ci‑dessus reste valide quel que soit le backend.

### Validation Finale
- Contrôler la cohérence du personnage sur toute la séquence (visage, cheveux, barbe).
- Vérifier que le mouvement de marche est continu (pas de glissement des pieds, pas de saccades dans le haut du corps).
- Confirmer que les éléments spécifiques (bulle BD, logo néon) apparaissent uniquement dans leurs images dédiées.
- Rendu final : séquence prête à être intégrée dans un scrollytelling web (ex : avec Scrollama ou Locomotive Scroll) où chaque image correspond à une étape de scroll.

--- 
*Document généré le $(date +%Y-%m-%d) dans le cadre de la mission de production cinématographique pour Laet's Danse Studio.*