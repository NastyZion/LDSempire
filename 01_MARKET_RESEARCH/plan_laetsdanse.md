# Plan d'action pour laetsdanse.fr

## 1. 3 actions immédiates et gratuites pour optimiser ma fiche Google Business afin d'apparaître en premier sur 'boutique articles de danse' dans ma région

1. **Optimiser les informations NAP et les catégories** : S'assurer que le nom, l'adresse et le numéro de téléphone (NAP) soient exactement identiques à ceux présents sur le site laetsdanse.fr et sur toutes les autres citations en ligne. Choisir les catégories les plus précises et pertinentes comme "Boutique d'articles de danse", "École de danse", "Professeur de danse privée". Ajouter des attributs tels que "Cours en petit groupe", "Accessible en fauteuil roulant" si applicable.

2. **Enrichir la fiche avec du contenu régulier et engageant** : Publier chaque semaine des Google Posts (offres, nouveautés, témoignages clients, vidéos courtes de cours) incluant des mots-clés locaux comme "boutique articles de danse Paris", "chaussures de danse Paris 3". Ajouter des photos de haute qualité du studio, des tenues, des accessoires de danse et des événements pour renforcer l'attractivité et le taux de clic.

3. **Déclencher et gérer les avis clients de façon systématique** : Après chaque vente ou cours, envoyer un message poli (via WhatsApp, email ou SMS) demandant un avis sur Google, en fournissant un lien direct. Répondre rapidement à chaque avis (positif ou négatif) en remerciant le client, en rappelant la localisation et en intégrant des mots-clés locaux (ex. "Merci pour votre avis sur notre boutique de danse à Paris 11 !").

## 2. Plan de recrutement interne (simulé) : agents spécialisés pour automatiser le marketing de la boutique

- **Agent Copywriter** : Rédige les fiches produits, les descriptions de catégories, les articles de blog et les Google Posts. Optimise les textes pour le SEO local (mots-clés "boutique articles de danse", "chaussures de danse Paris") et le ton de la marque. Utilise des modèles de prompts pour générer du contenu à grande échelle sans frais.

- **Agent SEO Local** : Audit technique du site et de la fiche Google Business, recherche de mots-clés locaux, optimisation des balises title/meta description, suivi des rankings sur Google Maps et les résultats locaux. Met en place le suivi des citations NAP et surveille les erreurs de duplication.

- **Agent Community Manager** : Gère les interactions sur les réseaux sociaux (Instagram, Facebook) et les avis Google. Planifie et publie du contenu engageant, répond aux commentaires et messages privés, lance des campagnes de contenu généré par les utilisateurs (UGC) pour augmenter la preuve sociale.

- **Agent Data & Reporting** : Collecte les données de Google Analytics, Google Search Console et Insights de Google Business. Crée des tableaux de bord simples (ex. avec Google Sheets) pour suivre le trafic, les conversions et le ROI des actions gratuites. Alerte sur les variations importantes.

- **Agent Growth Hacker (Vous)** : Définit les expériences rapides (A/B testing sur les Google Posts, tests d'offres limitées dans le temps), priorise les actions à fort impact faible coût, et orchestre les autres agents pour atteindre l'objectif de domination locale.

## 3. Script de veille concurrentielle (pseudo-code) pour surveiller les prix des concurrents de la boutique sans frais

```
// Objectif : Comparer les prix des articles de danse (chaussures, vêtements, accessoires) sur les sites concurrents locaux
// Contraintes : Utiliser uniquement des requêtes HTTP GET et du parsing basique (pas d'API payante)

// Liste des concurrents à surveiller (exemple)
competiteurs = [
    {nom: "Danses.com", url: "https://www.danses.com/boutique"},
    {nom: "DanceShopParis", url: "https://www.danceshopparis.fr"},
    {nom: "SuperDance", url: "https://www.superdance.fr/chaussures-de-danse"}
]

// Fonction générique de récupération et extraction de prix (à adapter selon la structure HTML de chaque site)
function getPriceFromPage(html, selectors) {
    // selectors est un objet contenant des sélecteurs CSS pour le prix et le nom de l'article
    // Retourne un tableau d'objets {article: string, price: float}
    // Ici on utilise du pseudo-code : on suppose l'existence d'une fonction parseHTML qui retourne un DOM
    dom = parseHTML(html)
    results = []
    for each selector in selectors {
        element = dom.querySelector(selector.priceSelector)
        if element != null {
            priceText = element.innerText.trim()
            // Nettoyer le texte pour en extraire le nombre (ex. "49,90 €" -> 49.90)
            price = parseFloat(priceText.replace(/[^\d,]/g, '').replace(',', '.'))
            nameElement = dom.querySelector(selector.nameSelector)
            name = nameElement ? nameElement.innerText.trim() : "Article sans nom"
            results.push({article: name, price: price})
        }
    }
    return results
}

// Config sélecteurs par concurrent (à définir après inspection rapide des pages)
selectorsMap = {
    "Danses.com": [{nameSelector: ".product-title", priceSelector: ".price"}],
    "DanceShopParis": [{nameSelector: ".h3.product-name", priceSelector: ".product-price"}],
    "SuperDance": [{nameSelector: ".item-name", priceSelector: ".cost"}]
}

// Fonction principale de veille
function veillePrix() {
    allResults = []
    for each comp in competiters {
        try {
            html = HTTP_GET(comp.url) // requête GET simple, pas de headers spécifiques
            prix = getPriceFromPage(html, selectorsMap[comp.nom])
            for each p in prix {
                p.competiteur = comp.nom
                allResults.push(p)
            }
        } catch (e) {
            log("Erreur lors de la récupération pour " + comp.nom + ": " + e)
        }
    }
    // Trier ou filtrer les résultats selon besoin (ex. même catégorie d'article)
    // On peut envoyer un résumé par email ou écrire dans un fichier CSV
    writeToFile("/home/nastyzion/MON_EMPIRE/01_MARKET_RESEARCH/veille_prix_" + dateToday() + ".csv", formatCSV(allResults))
    return allResults
}

// Exécution périodique (à mettre en cron : ex. chaque matin à 8h)
// cronjob schedule: "0 8 * * *" exécutant ce script

```

Ce pseudo-code montre comment récupérer les prix des pages produits des concurrents via des requêtes HTTP gratuites et un parsing basique du HTML. Il faut adapter les sélecteurs après une inspection rapide de chaque site (peut être faite une fois manuellement). Les résultats sont enregistrés dans un fichier CSV horodaté pour analyse ultérieure.

## 4. Stratégie bi-site (Marais/Oberkampf) pour doubler la visibilité

**Objectif** : Créer deux entités distinctes dans Google Business (ou utiliser les attributs de zones de chalandise) pour cibler spécifiquement les mots-clés de chaque quartier et augmenter la couverture locale.

### Actions :
- **Créer deux fiches Google Business** si l'activité possède réellement deux adresses (ex. studio au Marais et boutique/Oberkampf) ; sinon, utiliser une seule fiche avec deux zones de chalandise définies via les paramètres de service.
- **Optimiser chaque fiche/zone avec des mots-clés hyperlocaux** :
  - Pour le Marais : "Yoga Paris Marais", "Danse Marais", "Cours de salsa Marais", "Boutique danse Paris 4".
  - Pour Oberkampf : "Danse Oberkampf", "Yoga privé Oberkampf", "Articles de danse Paris 11", "Cours de tango Oberkampf".
- **Adapter les Google Posts** : alterner les publications ciblant chaque quartier, en incluant dans le texte et les images des références explicites au quartier (ex. photo prise devant le studio du Marais, légende "Yoga Paris Marais - Réservez votre cours").
- **Citations locales** : obtenir des mentions sur des sites web spécifiques au quartier (blogs du Marais, associations d'Oberkampf, pages de mairies d'arrondissement) avec le NAP correspondant.
- **Contenu du site** : créer deux pages dédiées (ex. laetsdanse.fr/marais, laetsdanse.fr/oberkampf) avec des témoignages locaux, des horaires spécifiques, et intégrer des mots-clés du quartier dans les titres H1/H2.

### Résultat attendu :
Apparition dans les résultats de recherche pour les requêtes géolocalisées de chaque quartier, augmentant ainsi le trafic qualifié et les chances de conversion en boutique.

## 5. Consigne de veille automatisée

Dès qu'une photo est déposée dans le dossier `/home/nastyzion/MON_EMPIRE/03_ASSETS/PHOTOS_BRUTES` :
- Déclencher automatiquement (via un script de surveillance ou un cron fréquent) la création d'un **Google Post** prêt à publier.
- Le post doit contenir :
  - La photo en question.
  - Un texte incluant un mot-clé hyperlocal prédéfini selon le contexte (ex. si la photo provient d'un événement Marais → "Yoga Paris Marais", si liée à un cours Oberkampf → "Danse Oberkampf").
  - Un appel à l'action (ex. "Réservez votre cours", "Découvrez nos nouveaux articles").
- Le post finalisé sera déplacé vers `/home/nastyzion/MON_EMPIRE/03_ASSETS/CONTENU_PRET_A_PUBLIER` pour validation ou publication directe via l'API Google Business (si disponible) ou manuellement.

Ce mécanisme permet de transformer chaque nouvel asset en opportunité de contenu frais et géolocalisé, renforçant le référencement local sans effort rédactionnel supplémentaire.