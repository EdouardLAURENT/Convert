#!/bin/bash

#═══════════════════════════════════════════════════════════════
# Script de vérification pré-déploiement
# Vérifie que tout est en ordre avant de pousser sur GitHub
#═══════════════════════════════════════════════════════════════

set -e

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  🔍 Vérification du projet Convert"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Couleurs
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

errors=0

# Fonction de vérification
check() {
    local test_name="$1"
    local test_command="$2"
    
    echo -n "  $test_name... "
    if eval "$test_command" &> /dev/null; then
        echo -e "${GREEN}✓${NC}"
        return 0
    else
        echo -e "${RED}✗${NC}"
        ((errors++))
        return 1
    fi
}

echo "📦 Fichiers essentiels"
check "convert.sh existe" "[ -f convert.sh ]"
check "convert.sh est exécutable" "[ -x convert.sh ]"
check "config.conf existe" "[ -f config.conf ]"
check "README.md existe" "[ -f README.md ]"
check "Templates existent" "[ -d templates ] && [ -f templates/epitech-academy.html ]"
echo ""

echo "📁 Structure des dossiers"
check "Dossier markdown/ existe" "[ -d markdown ]"
check "Dossier html/ existe" "[ -d html ]"
check "Dossier .github/workflows/ existe" "[ -d .github/workflows ]"
echo ""

echo "🤖 GitHub Actions"
check "Workflow convert-markdown.yml existe" "[ -f .github/workflows/convert-markdown.yml ]"
check "Workflow deploy-pages.yml existe" "[ -f .github/workflows/deploy-pages.yml ]"
echo ""

echo "📝 Fichiers Markdown"
md_count=$(find markdown -name "*.md" -type f 2>/dev/null | wc -l | tr -d ' ')
if [ "$md_count" -gt 0 ]; then
    echo -e "  ${GREEN}✓${NC} $md_count fichier(s) .md trouvé(s)"
    find markdown -name "*.md" -type f | while read file; do
        echo "    - $(basename "$file")"
    done
else
    echo -e "  ${YELLOW}⚠${NC}  Aucun fichier .md trouvé (ajoutez-en dans markdown/)"
fi
echo ""

echo "🔧 Test de Pandoc"
if command -v pandoc &> /dev/null; then
    version=$(pandoc --version | head -n 1)
    echo -e "  ${GREEN}✓${NC} Pandoc installé : $version"
else
    echo -e "  ${YELLOW}⚠${NC}  Pandoc non installé (normal si test en local)"
    echo "    Installation : brew install pandoc"
fi
echo ""

echo "🧪 Test de conversion"
if [ "$md_count" -gt 0 ] && command -v pandoc &> /dev/null; then
    echo "  Tentative de conversion..."
    if ./convert.sh &> /tmp/convert_test.log; then
        echo -e "  ${GREEN}✓${NC} Conversion réussie"
        html_count=$(find html -name "*.html" -type f 2>/dev/null | wc -l | tr -d ' ')
        echo "    $html_count fichier(s) HTML généré(s)"
    else
        echo -e "  ${RED}✗${NC} Échec de conversion"
        echo "    Voir les détails dans /tmp/convert_test.log"
        ((errors++))
    fi
else
    echo -e "  ${YELLOW}⊝${NC} Test de conversion ignoré (pas de .md ou pandoc absent)"
fi
echo ""

echo "🔐 Git"
check "Repository Git initialisé" "[ -d .git ]"
if git remote -v &> /dev/null; then
    remote=$(git remote get-url origin 2>/dev/null || echo "none")
    if [ "$remote" != "none" ]; then
        echo -e "  ${GREEN}✓${NC} Remote configuré : $remote"
    else
        echo -e "  ${YELLOW}⚠${NC}  Aucun remote configuré"
    fi
fi
echo ""

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
if [ $errors -eq 0 ]; then
    echo -e "${GREEN}✅ Tous les tests sont passés !${NC}"
    echo ""
    echo "🚀 Prêt pour GitHub Actions"
    echo ""
    echo "Prochaines étapes :"
    echo "  1. git add ."
    echo "  2. git commit -m 'fix: amélioration du workflow'"
    echo "  3. git push"
    exit 0
else
    echo -e "${RED}❌ $errors erreur(s) détectée(s)${NC}"
    echo ""
    echo "Corrigez les erreurs avant de pousser sur GitHub"
    exit 1
fi
