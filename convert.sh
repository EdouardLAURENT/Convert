#!/bin/bash

#═══════════════════════════════════════════════════════════════
# Convertisseur Markdown → HTML avec Pandoc
# Usage: 
#   ./convert.sh              # Convertit tout markdown/
#   ./convert.sh Snake-js     # Convertit seulement markdown/Snake-js/
#═══════════════════════════════════════════════════════════════

set -euo pipefail  # Mode strict : arrêt sur erreur

# Charger la configuration
CONFIG_FILE="./config.conf"
if [ -f "$CONFIG_FILE" ]; then
    source "$CONFIG_FILE"
else
    echo "⚠️  Fichier de configuration non trouvé: $CONFIG_FILE"
    echo "Utilisation des valeurs par défaut."
    INPUT_DIR="./markdown"
    OUTPUT_DIR="./html"
    TEMPLATE="templates/epitech-academy.html"
    SYNTAX_STYLE="breezedark"
    TOC_ENABLED="true"
    TOC_DEPTH="3"
    COPY_IMAGES="true"
    IMAGE_SOURCES="markdown sujet"
fi

#═══════════════════════════════════════════════════════════════
# Fonctions
#═══════════════════════════════════════════════════════════════

# Vérifier Pandoc
check_pandoc() {
    if ! command -v pandoc &> /dev/null; then
        echo "❌ Pandoc n'est pas installé!"
        echo "Installation: brew install pandoc"
        exit 1
    fi
}

# Créer les dossiers
create_directories() {
    mkdir -p "$INPUT_DIR" "$OUTPUT_DIR"
}

# Convertir un fichier
convert_file() {
    local input="$1"
    local output="$2"
    local output_dir=$(dirname "$output")
    
    # Créer le dossier de sortie si nécessaire
    mkdir -p "$output_dir"
    
    local opts=("--template=$TEMPLATE" "--no-highlight")
    [ "$TOC_ENABLED" = "true" ] && opts+=("--toc" "--toc-depth=$TOC_DEPTH")
    
    pandoc "${opts[@]}" "$input" -o "$output" 2>/dev/null && \
        echo "✓ $(basename "$input") → $(basename "$output")" || \
        echo "✗ Erreur: $(basename "$input")"
}

# Copier les images d'un répertoire spécifique
copy_directory_images() {
    local source_dir="$1"
    local target_dir="$2"
    
    if [ -d "$source_dir/images" ]; then
        mkdir -p "$target_dir"
        cp -r "$source_dir/images" "$target_dir/" 2>/dev/null && \
            echo "✓ Images copiées depuis $source_dir/images/"
    fi
}

# Convertir un répertoire complet
convert_directory() {
    local dir_name="$1"
    local source_dir="$INPUT_DIR/$dir_name"
    local target_dir="$OUTPUT_DIR/$dir_name"
    
    if [ ! -d "$source_dir" ]; then
        echo "❌ Répertoire non trouvé: $source_dir"
        exit 1
    fi
    
    echo ""
    echo "📁 Conversion du répertoire: $dir_name"
    echo ""
    
    local md_files=("$source_dir"/*.md)
    local count=0
    
    for file in "${md_files[@]}"; do
        [ -f "$file" ] && ((count++))
    done
    
    if [ $count -eq 0 ]; then
        echo "⚠️  Aucun fichier .md dans $source_dir"
        return 0
    fi
    
    echo "📄 $count fichier(s) trouvé(s)"
    echo ""
    
    # Convertir les fichiers
    for file in "${md_files[@]}"; do
        if [ -f "$file" ]; then
            local filename=$(basename "$file")
            local output="$target_dir/${filename%.md}.html"
            convert_file "$file" "$output"
        fi
    done
    
    # Copier les images du répertoire
    [ "$COPY_IMAGES" = "true" ] && copy_directory_images "$source_dir" "$target_dir"
    
    echo ""
    echo "✅ Répertoire $dir_name converti → $target_dir/"
}

# Convertir tous les fichiers du dossier markdown/
convert_all() {
    local md_files=("$INPUT_DIR"/*.md)
    local count=0
    
    # Compter les fichiers .md directs
    for file in "${md_files[@]}"; do
        [ -f "$file" ] && ((count++))
    done
    
    if [ $count -gt 0 ]; then
        echo ""
        echo "📄 $count fichier(s) trouvé(s) dans $INPUT_DIR/"
        echo ""
        
        for file in "${md_files[@]}"; do
            if [ -f "$file" ]; then
                local filename=$(basename "$file")
                local output="$OUTPUT_DIR/${filename%.md}.html"
                convert_file "$file" "$output"
            fi
        done
    fi
    
    # Copier les images globales
    if [ "$COPY_IMAGES" = "true" ]; then
        for source_dir in $IMAGE_SOURCES; do
            if [ -d "$source_dir/images" ]; then
                cp -r "$source_dir/images" "$OUTPUT_DIR/" 2>/dev/null && \
                    echo "✓ Images copiées depuis $source_dir/"
            fi
        done
    fi
}

#═══════════════════════════════════════════════════════════════
# Main
#═══════════════════════════════════════════════════════════════

main() {
    local target_dir="${1:-}"  # Paramètre optionnel
    
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "  Convertisseur Markdown → HTML"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    
    check_pandoc
    create_directories
    
    if [ -n "$target_dir" ]; then
        # Mode répertoire spécifique
        convert_directory "$target_dir"
    else
        # Mode conversion complète
        convert_all
    fi
    
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    if [ -n "$target_dir" ]; then
        echo "✅ Terminé → Ouvrez $OUTPUT_DIR/$target_dir/"
    else
        echo "✅ Terminé → Ouvrez $OUTPUT_DIR/"
    fi
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
}

main "$@"