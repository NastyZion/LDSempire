#!/bin/bash
# Surveillance du dossier PHOTOS_BRUTES et génération de contenus prêts à publier

WATCH_DIR="/home/nastyzion/MON_EMPIRE/03_ASSETS/PHOTOS_BRUTES"
OUT_DIR="/home/nastyzion/MON_EMPIRE/03_ASSETS/CONTENU_PRET_A_PUBLIER"
LOG_FILE="/home/nastyzion/MON_EMPIRE/03_ASSETS/surveillance_photos.log"

# Créer le dossier de sortie s'il n'existe pas
mkdir -p "$OUT_DIR"

# Fonction pour générer le contenu à partir du fichier
generate_content() {
    local filepath="$1"
    local filename="$(basename "$filepath")"
    local name="${filename%.*}"
    local ext="${filename##*.}"
    # Déterminer le contexte à partir du répertoire parent
    local parent_dir="$(basename "$(dirname "$filepath")")"
    # Mapping simple du parent_dir vers des mots-clés
    case "$parent_dir" in
        affiches-pub-yoga)
            contexte="Yoga"
            motcle="Yoga Paris"
            ;;
        affiches-pub-ouverturedebal)
            contexte="Ouverture de bal"
            motcle="Ouverture de bal Paris"
            ;;
        photos-laetitia)
            contexte="Portrait Laetitia"
            motcle="Cours particuliers danse Paris"
            ;;
        photos-studioinspire-oberkampf)
            contexte="Studio Oberkampf"
            motcle="Danse Oberkampf"
            ;;
        photos_sitelaetsdanse)
            contexte="Site web"
            motcle="Boutique articles de danse Paris"
            ;;
        logo-laetsdanse)
            contexte="Logo"
            motcle="Laets Danse logo"
            ;;
        qrcode)
            contexte="QR Code"
            motcle="Réservation Laets Danse"
            ;;
        *)
            contexte="Contenu général"
            motcle="Laets Danse"
            ;;
    esac

    # Titre SEO : utiliser le mot-clé et le nom du fichier
    local titre_seo="${motcle} - ${name}"
    # Brouillon de post : template simple
    local brouillon="🌟 Découvrez notre nouveau contenu : ${contexte} ! 🌟\n\n${motcle} adapté à vos besoins. Réservez dès maintenant votre cours ou votre article via notre site.\n\n#${contexte// /} #${motcle// /} #LaetsDanse\n\nLien : https://www.laetsdanse.fr/"

    # Écrire le fichier de sortie
    local outfile="${OUT_DIR}/${name}.txt"
    {
        echo "Titre SEO: ${titre_seo}"
        echo ""
        echo "Brouillon de post:"
        echo "${brouillon}"
    } > "$outfile"

    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Généré: $outfile" >> "$LOG_FILE"
}

# Surveillance avec inotifywait
echo "[$(date '+%Y-%m-%d %H:%M:%S')] Démarrage de la surveillance sur $WATCH_DIR" >> "$LOG_FILE"
while true; do
    # Attendre un événement de création de fichier
    inotifywait -e create --format '%w%f' "$WATCH_DIR" | while read -r newfile; do
        # Ne traiter que les fichiers (éviter les répertoires)
        if [[ -f "$newfile" ]]; then
            generate_content "$newfile"
        fi
    done
done