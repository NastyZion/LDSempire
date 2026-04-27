# GUIDE D'UTILISATION – MON_EMPIRE

Ce guide vous montre, étape par étape, comment exploiter les livrables de l’assistant, mettre à jour les contenus et lancer de nouvelles missions.

---

## 1. Utiliser l’audit Google Business (OPTIMISATION_GOOGLE.md)

1. Ouvrez le fichier :  
   `/home/nastyzion/MON_EMPIRE/01_MARKET_RESEARCH/OPTIMISATION_GOOGLE.md`

2. Dans la section **« PLANNING DE POSTS – 4 BROUITS PRÊTS À COPIER‑COLLER »** vous trouverez quatre blocs de texte prêts à être publiés.

3. Pour chaque post :  
   - Sélectionnez le texte compris entre les triple backticks (``` … ```).  
   - Copiez‑le (Ctrl +C).  
   - Ouvrez votre fiche Google Business (https://business.google.com).  
   - Dans le menu gauche, choisissez **Publications** → **Nouvelle publication**.  
   - Collez le texte (Ctrl + V).  
   - Remplacez les balises `[PHOTO_X]` par l’URL ou le chemin de la photo que vous souhaitez associer (voir étape 2).  
   - Cliquez sur **Publier**.

4. Répétez l’opération pour les quatre posts, en alternant les adresses (Marais / Oberkampf) afin de maintenir une présence équilibrée.

---

## 2. Ajouter de nouvelles photos pour qu’elles soient traitées par Google

1. Préparez vos images (format JPEG ou PNG, taille recommandée : 1080 × 1080 px ou 1200 × 900 px).  
2. Renommez‑les de façon descriptive, ex. `yoga-marais.jpg`, `ouverture-bal-oberkampf.jpg`.  
3. Téléversez les photos dans un dossier accessible publiquement (ex. votre hébergement web, un bucket S3 public, ou un service comme Imgur).  
4. Copiez l’URL directe de chaque image (elle doit commencer par `http://` ou `https://` et se terminer par l’extension de fichier).  
5. Dans les posts Google Business (étape 1), remplacez chaque `[PHOTO_X]` par l’URL correspondante.  
6. Publiez la mise à jour. Google indexera automatiquement la photo et l’associera à la publication.

> **Astuce** : Vous pouvez également ajouter des photos directement dans l’onglet **Photos** de votre fiche Google Business. Elles apparaîtront alors dans la galerie de l’établissement et pourront être réutilisées dans de futures publications.

---

## 3. Me demander de lancer une nouvelle mission (Marketing ou Code)

Pour déclencher une nouvelle mission, suivez ce modèle de demande :

```
[Mission] <type> : <description courte>
```

Exemples :

- **Marketing** :  
  `[Mission] Marketing : Rédiger une séquence de 5 e‑mails de bienvenue pour les nouveaux inscrits au yoga.`

- **Code** :  
  `[Mission] Code : Créer un script Python qui récupère les avis Google Business via l’API et les enregistre dans un CSV.`

### Comment l’envoyer

1. Dans cette même conversation, tapez exactement la ligne ci‑dessus (en commençant par `[Mission]`).  
2. Je reconnaîtrai la demande, vous poserai éventuellement quelques questions de clarification, puis je lancerai la tâche en utilisant les outils appropriés (write_file, exécuter du code, recherches web, etc.).  
3. Vous recevrez le livrable directement dans le chat (fichier créé, extrait de code, rapport, etc.).

---

## 4. Valider mes propositions avant qu’elles ne soient définitives

Lorsque je vous livre un résultat (fichier, code, texte, etc.) :

1. **Lire attentivement** le contenu proposé.  
2. **Vérifier les points suivants** :  
   - Conformité avec vos objectifs (ton, public cible, contraintes techniques).  
   - Absence d’erreurs factuelles ou de fautes de frappe.  
   - Pertinence des liens, images ou données fournies.  
3. Si tout convient, répondez simplement :  
   ```
   ✅ Validé
   ```  
   Je considérerai alors la tâche comme terminée et je ne modifierai plus le livrable sauf demande expresse de votre part.  
4. Si des ajustements sont nécessaires, indiquez précisément ce qui doit être changé, par exemple :  
   - « Changer le ton du post 2 en plus formel. »  
   - « Ajouter une phrase sur le parking gratuit à l’adresse du Marais. »  
   - « Corriger l’URL de la photo 3. »  
5. Je mettrai à jour le livrable en conséquence et vous demanderai une nouvelle validation.

---

### Récapitulatif rapide

| Action | Où | Comment |
|--------|----|---------|
| Utiliser les posts | `OPTIMISATION_GOOGLE.md` | Copier blocs entre ```, remplacer `[PHOTO_X]`, publier sur Google Business |
| Ajouter des photos | Où que vous hébergez vos images | Obtenir URL directe, remplacer les balises dans les posts |
| Nouvelle mission | Dans ce chat | Écrire `[Mission] <type> : <description>` |
| Validation | Après chaque livrable | Répondre `✅ Validé` ou indiquer les modifications souhaitées |

---

Bon travail, et n’hésitez pas à me solliciter pour toute amélioration ou nouvelle initiative !
