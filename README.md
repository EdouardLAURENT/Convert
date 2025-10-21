# Convert 📝

[![Convert Markdown](https://github.com/EdouardLAURENT/Convert/actions/workflows/convert-markdown.yml/badge.svg)](https://github.com/EdouardLAURENT/Convert/actions/workflows/convert-markdown.yml)
[![Deploy Pages](https://github.com/EdouardLAURENT/Convert/actions/workflows/deploy-pages.yml/badge.svg)](https://github.com/EdouardLAURENT/Convert/actions/workflows/deploy-pages.yml)
[![Template](https://img.shields.io/badge/template-ready-brightgreen.svg)](https://github.com/EdouardLAURENT/Convert/generate)

Convertisseur Markdown → HTML avec Pandoc et templates personnalisés + Déploiement automatique via GitHub Actions.

## 📋 Description

Convert est un outil qui transforme vos fichiers Markdown en pages HTML élégantes, en utilisant Pandoc et des templates personnalisables. Idéal pour générer de la documentation, des cours ou des tutoriels avec une mise en forme professionnelle.

**🎯 Ce repository est un template** : Utilisez-le pour créer rapidement de nouveaux projets avec conversion automatique Markdown → HTML !

## 🔧 Prérequis

### Installation de Pandoc

**macOS** (avec Homebrew) :
```bash
brew install pandoc
```

**Linux** (Ubuntu/Debian) :
```bash
sudo apt-get install pandoc
```

**Windows** :
Téléchargez l'installeur depuis [pandoc.org](https://pandoc.org/installing.html)

### Vérifier l'installation
```bash
pandoc --version
```

## 📁 Structure du projet

```
```
Convert/
├── convert                # Script de conversion (wrapper)
├── markdown/              # 📂 DOSSIER CLÉ : Vos fichiers .md source
│   └── exemple/
│       └── index.md
├── html/                  # 📂 DOSSIER CLÉ : Fichiers HTML générés
│   └── exemple/
│       └── index.html
├── .convert/              # 🔧 Moteur de conversion (ne pas modifier)
│   ├── engine.sh         # Script principal
│   ├── config.conf       # Configuration par défaut
│   └── templates/        # Templates HTML
└── sujet/                 # Dossier optionnel pour images
```
```

### 🔑 Dossiers clés

- **`markdown/`** : Placez vos fichiers Markdown source ici. L'arborescence sera reproduite dans `html/`
- **`html/`** : Dossier de sortie où seront générés vos fichiers HTML
- **`.convert/`** : Moteur de conversion (ne pas modifier, géré par le template)

## 🚀 Utilisation

### Mode 1 : Utiliser ce repository comme template 🎯

**Pour créer un nouveau projet "sujet" avec conversion automatique :**

1. **Sur GitHub**, cliquez sur "Use this template" → "Create a new repository"
2. Nommez votre projet (ex: "Snake-js", "Cours-Python")
3. Dans le nouveau repository, allez dans **Settings** → **Pages** → Source: **GitHub Actions**
4. Clonez et ajoutez vos fichiers `.md` dans `markdown/`
5. Commitez et poussez → **La conversion est automatique !** ✨

## 🆘 Besoin d'aide ?

### Avant de pousser sur GitHub
```bash
./check.sh  # Vérifie que tout est en ordre
```

### Documentation
- � **[Guide complet d'utilisation](TEMPLATE_USAGE.md)**
- 🚀 **[Quick Start](QUICKSTART.md)**
- ⚙️ **[Configuration du template](SETUP_TEMPLATE.md)**
- 🔧 **[Dépannage](TROUBLESHOOTING.md)**

Consultez la documentation complète : [TEMPLATE_USAGE.md](TEMPLATE_USAGE.md)

### Mode 2 : Conversion locale

### Convertir tous les fichiers

```bash
./convert
```

Convertit tous les fichiers `.md` du dossier `markdown/` vers `html/`

### Convertir un dossier spécifique

```bash
./convert nom-du-dossier
```

Exemple :
```bash
./convert Snake-js
```

Convertit uniquement `markdown/Snake-js/` vers `html/Snake-js/`

## ⚙️ Configuration

Le fichier `.convert/config.conf` contient la configuration par défaut.

Pour personnaliser, créez un fichier `config.conf` **à la racine** du projet :

```bash
# Dossiers
INPUT_DIR="markdown"       # Dossier source
OUTPUT_DIR="html"          # Dossier de sortie

# Template (relatif à .convert/)
TEMPLATE="templates/epitech-academy.html"

# Options
TOC_ENABLED="true"         # Table des matières
TOC_DEPTH="3"              # Profondeur (1-6)

# Images
COPY_IMAGES="true"         # Copie automatique des images
IMAGE_SOURCES="markdown sujet"
```

## ✨ Fonctionnalités

- ✅ Conversion Markdown → HTML avec Pandoc
- ✅ **Conversion automatique via GitHub Actions** 🤖
- ✅ **Déploiement automatique sur GitHub Pages** 🌐
- ✅ Templates personnalisables
- ✅ Table des matières automatique
- ✅ Coloration syntaxique avec Prism.js
- ✅ Copie automatique des images
- ✅ Préservation de l'arborescence des dossiers
- ✅ Support de multiples langages de programmation
- ✅ **Repository template prêt à l'emploi**

## 📝 Exemple de workflow

### Avec GitHub Actions (automatique) 🤖

1. **Créer un document** :
   ```bash
   echo "# Mon Projet" > markdown/mon-projet.md
   ```

2. **Commiter et pousser** :
   ```bash
   git add markdown/
   git commit -m "Add: nouveau cours"
   git push
   ```

3. **Magie** ✨ :
   - GitHub Actions convertit automatiquement en HTML
   - Le résultat est déployé sur GitHub Pages
   - Accessible à : `https://VOTRE_USERNAME.github.io/VOTRE_PROJET/`

### En local

1. **Créer un nouveau document** :
   ```bash
   mkdir -p markdown/mon-projet
   echo "# Mon Projet" > markdown/mon-projet/index.md
   ```

2. **Convertir** :
   ```bash
   ./convert mon-projet
   ```

3. **Ouvrir le résultat** :
   ```bash
   open html/mon-projet/index.html
   ```

## 🎨 Templates disponibles

Les templates sont dans `.convert/templates/` :
- `epitech-academy.html` : Template style Epitech Academy
- `index-template.html` : Template générique

Pour personnaliser, créez votre propre template dans `.convert/templates/` et référencez-le dans votre `config.conf` à la racine.

## 📄 Licence

Projet libre d'utilisation.

---

**Auteur** : Edouard LAURENT  
**Repository** : [github.com/EdouardLAURENT/Convert](https://github.com/EdouardLAURENT/Convert)
