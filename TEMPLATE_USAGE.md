# Template Configuration pour Repository "Sujet"

Ce repository est un template configuré pour la conversion automatique Markdown → HTML.

## 🎯 Utilisation du template

### 1. Créer un nouveau repository depuis ce template

Sur GitHub :
- Cliquez sur "Use this template" → "Create a new repository"
- Nommez votre nouveau projet (ex: "Snake-js", "MyProject")
- Le repository sera créé avec toute la structure nécessaire

### 2. Activer GitHub Pages

Dans votre nouveau repository :
1. Allez dans **Settings** → **Pages**
2. Source: **GitHub Actions**
3. Sauvegardez

### 3. Ajouter vos fichiers Markdown

```bash
# Clonez votre nouveau repository
git clone https://github.com/VOTRE_USERNAME/VOTRE_PROJET.git
cd VOTRE_PROJET

# Ajoutez vos fichiers .md dans markdown/
echo "# Mon Cours" > markdown/index.md

# Committez et poussez
git add markdown/
git commit -m "Add: mon premier cours"
git push
```

### 4. Magie automatique ✨

GitHub Actions va :
1. 🔄 Détecter vos fichiers `.md`
2. 🏗️ Les convertir en HTML avec Pandoc
3. 💾 Committer les fichiers HTML générés
4. 🚀 Déployer sur GitHub Pages

**Votre site sera disponible à :**
`https://VOTRE_USERNAME.github.io/VOTRE_PROJET/`

## 📁 Structure du projet

```
votre-projet/
├── markdown/          # 📝 VOS FICHIERS .md ICI
│   ├── index.md
│   └── images/       # Images pour vos cours
├── html/             # 🌐 HTML générés automatiquement (ne pas éditer)
├── templates/        # 🎨 Templates HTML (personnalisables)
├── config.conf       # ⚙️ Configuration
└── .github/
    └── workflows/    # 🤖 GitHub Actions
```

## ⚙️ Configuration

Éditez `config.conf` pour personnaliser :
- Template utilisé
- Table des matières
- Copie des images
- etc.

## 🔧 Test local

Avant de pousser, testez localement :

```bash
# Installez Pandoc
brew install pandoc  # macOS
# ou
sudo apt-get install pandoc  # Linux

# Convertissez
./convert.sh

# Ouvrez le résultat
open html/index.html
```

## 🎨 Personnalisation du template

Les templates HTML sont dans `templates/` :
- `epitech-academy.html` : Style Epitech Academy
- `index-template.html` : Template générique

Modifiez-les selon vos besoins !

## 📊 Suivre les conversions

Allez dans l'onglet **Actions** de votre repository pour voir :
- ✅ Les conversions réussies
- ❌ Les erreurs éventuelles
- 📊 L'historique des builds

## 🚫 Désactiver la conversion automatique

Si vous voulez uniquement convertir localement :
1. Supprimez `.github/workflows/convert-markdown.yml`
2. Ou ajoutez `[skip ci]` dans votre message de commit

## 💡 Astuces

### Conversion manuelle via GitHub
- Allez dans **Actions** → **Convert Markdown to HTML**
- Cliquez sur "Run workflow"

### Structure avec sous-dossiers
```
markdown/
├── chapitre-1/
│   ├── index.md
│   └── images/
└── chapitre-2/
    ├── index.md
    └── images/
```

Puis convertissez un dossier spécifique :
```bash
./convert.sh chapitre-1
```

---

**🎉 Prêt à créer du contenu !**
