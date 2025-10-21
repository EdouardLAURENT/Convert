#!/bin/bash

#═══════════════════════════════════════════════════════════════
# Convertisseur Markdown → HTML avec Pandoc
# Usage: 
#   ./convert.sh              # Convertit tout markdown/
#   ./convert.sh Snake-js     # Convertit seulement markdown/Snake-js/
#═══════════════════════════════════════════════════════════════

set -euo pipefail  # Mode strict : arrêt sur erreur

# Déterminer le répertoire du script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

# Charger la configuration
CONFIG_FILE="$SCRIPT_DIR/config.conf"
if [ -f "$CONFIG_FILE" ]; then
    source "$CONFIG_FILE"
else
    echo "⚠️  Fichier de configuration non trouvé: $CONFIG_FILE"
    echo "Utilisation des valeurs par défaut."
    INPUT_DIR="$PROJECT_ROOT/markdown"
    OUTPUT_DIR="$PROJECT_ROOT/html"
    TEMPLATE="$SCRIPT_DIR/templates/epitech-academy.html"
    SYNTAX_STYLE="breezedark"
    TOC_ENABLED="true"
    TOC_DEPTH="3"
fi

# S'assurer que les chemins sont absolus ou relatifs au projet
[[ "$INPUT_DIR" != /* ]] && INPUT_DIR="$PROJECT_ROOT/$INPUT_DIR"
[[ "$OUTPUT_DIR" != /* ]] && OUTPUT_DIR="$PROJECT_ROOT/$OUTPUT_DIR"
[[ "$TEMPLATE" != /* ]] && TEMPLATE="$SCRIPT_DIR/$TEMPLATE"

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

# Copier les ressources statiques d'un répertoire
copy_static_resources() {
    local dir_name="$1"
    local target_dir="$2"
    local static_dir="$PROJECT_ROOT/static/$dir_name"
    
    if [ -d "$static_dir" ]; then
        mkdir -p "$target_dir"
        cp -r "$static_dir"/* "$target_dir/" 2>/dev/null && \
            echo "✓ Ressources statiques copiées depuis static/$dir_name/"
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
    
    # Copier les ressources statiques du répertoire
    copy_static_resources "$dir_name" "$target_dir"
    
    echo ""
    echo "✅ Répertoire $dir_name converti → $target_dir/"
}

# Convertir tous les fichiers du dossier markdown/
convert_all() {
    local md_files=("$INPUT_DIR"/*.md)
    local count=0
    
    # Compter les fichiers .md directs à la racine
    for file in "${md_files[@]}"; do
        [ -f "$file" ] && ((count++))
    done
    
    # Convertir les fichiers .md à la racine de markdown/
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
        
        # Copier les ressources statiques de la racine (si elles existent)
        if [ -d "$PROJECT_ROOT/static" ] && [ "$(ls -A "$PROJECT_ROOT/static" 2>/dev/null)" ]; then
            cp -r "$PROJECT_ROOT/static"/* "$OUTPUT_DIR/" 2>/dev/null && \
                echo "✓ Ressources statiques copiées depuis static/"
        fi
    fi
    
    # Traiter récursivement tous les sous-répertoires de markdown/
    for dir in "$INPUT_DIR"/*/ ; do
        if [ -d "$dir" ]; then
            local dir_name=$(basename "$dir")
            convert_directory "$dir_name"
        fi
    done
}

# Générer le README avec les liens GitHub Pages
generate_readme() {
    local readme="$PROJECT_ROOT/README.md"
    
    echo "# Convert 📝→🌐" > "$readme"
    echo "" >> "$readme"
    echo "[![Convert Markdown](https://github.com/$GITHUB_USER/$GITHUB_REPO/actions/workflows/convert-markdown.yml/badge.svg)](https://github.com/$GITHUB_USER/$GITHUB_REPO/actions/workflows/convert-markdown.yml)" >> "$readme"
    echo "[![Deploy Pages](https://github.com/$GITHUB_USER/$GITHUB_REPO/actions/workflows/deploy-pages.yml/badge.svg)](https://github.com/$GITHUB_USER/$GITHUB_REPO/actions/workflows/deploy-pages.yml)" >> "$readme"
    echo "" >> "$readme"
    echo "**Convertisseur automatique Markdown → HTML avec déploiement GitHub Pages**" >> "$readme"
    echo "" >> "$readme"
    echo "---" >> "$readme"
    echo "" >> "$readme"
    echo "## 📚 Cours disponibles" >> "$readme"
    echo "" >> "$readme"
    
    # Parcourir tous les sous-répertoires et fichiers HTML
    local found=false
    for dir in "$OUTPUT_DIR"/*/ ; do
        if [ -d "$dir" ]; then
            local dir_name=$(basename "$dir")
            echo "### 📁 $dir_name" >> "$readme"
            echo "" >> "$readme"
            
            # Lister tous les fichiers HTML du répertoire
            for html_file in "$dir"/*.html ; do
                if [ -f "$html_file" ]; then
                    local filename=$(basename "$html_file")
                    local title="${filename%.html}"
                    local url="$GITHUB_PAGES_URL/html/$dir_name/$filename"
                    echo "- 🔗 [$title]($url)" >> "$readme"
                    found=true
                fi
            done
            echo "" >> "$readme"
        fi
    done
    
    if [ "$found" = false ]; then
        echo "_Aucun cours disponible pour le moment._" >> "$readme"
        echo "" >> "$readme"
    fi
    
    echo "---" >> "$readme"
    echo "" >> "$readme"
    echo "## 🚀 Utilisation" >> "$readme"
    echo "" >> "$readme"
    echo "1. Ajoutez vos fichiers Markdown dans \`markdown/NOM_COURS/\`" >> "$readme"
    echo "2. Ajoutez vos ressources (images, etc.) dans \`static/NOM_COURS/\`" >> "$readme"
    echo "3. Committez et pushez → La conversion se fait automatiquement via GitHub Actions" >> "$readme"
    echo "4. Les pages sont déployées sur GitHub Pages" >> "$readme"
    echo "" >> "$readme"
    echo "### Conversion locale" >> "$readme"
    echo "" >> "$readme"
    echo "\`\`\`bash" >> "$readme"
    echo "# Convertir tous les cours" >> "$readme"
    echo "./.convert/engine.sh" >> "$readme"
    echo "" >> "$readme"
    echo "# Convertir un cours spécifique" >> "$readme"
    echo "./.convert/engine.sh nom-du-cours" >> "$readme"
    echo "\`\`\`" >> "$readme"
    echo "" >> "$readme"
    echo "---" >> "$readme"
    echo "" >> "$readme"
    echo "_Généré automatiquement par Convert • $(date '+%d/%m/%Y %H:%M')_" >> "$readme"
    
    echo "✓ README.md mis à jour avec $(find "$OUTPUT_DIR" -name "*.html" | wc -l | tr -d ' ') lien(s)"
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
        # Générer le README avec les liens
        echo ""
        generate_readme
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