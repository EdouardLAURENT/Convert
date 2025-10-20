# Convert 📝

Convertisseur Markdown → HTML avec Pandoc et templates personnalisés.

## 📋 Description

Convert est un outil qui transforme vos fichiers Markdown en pages HTML élégantes, en utilisant Pandoc et des templates personnalisables. Idéal pour générer de la documentation, des cours ou des tutoriels avec une mise en forme professionnelle.

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
Convert/
├── convert.sh              # Script principal de conversion
├── config.conf            # Fichier de configuration
├── markdown/              # 📂 DOSSIER CLÉ : Vos fichiers .md source
│   └── exemple/
│       └── index.md
├── html/                  # 📂 DOSSIER CLÉ : Fichiers HTML générés
│   └── exemple/
│       └── index.html
├── templates/             # Templates HTML personnalisés
│   ├── epitech-academy.html
│   ├── index-template.html
│   └── fonts/
└── sujet/                 # Dossier optionnel pour images
```

### 🔑 Dossiers clés

- **`markdown/`** : Placez vos fichiers Markdown source ici. L'arborescence sera reproduite dans `html/`
- **`html/`** : Dossier de sortie où seront générés vos fichiers HTML

## 🚀 Utilisation

### Convertir tous les fichiers

```bash
./convert.sh
```

Convertit tous les fichiers `.md` du dossier `markdown/` vers `html/`

### Convertir un dossier spécifique

```bash
./convert.sh nom-du-dossier
```

Exemple :
```bash
./convert.sh Snake-js
```

Convertit uniquement `markdown/Snake-js/` vers `html/Snake-js/`

## ⚙️ Configuration

Le fichier `config.conf` permet de personnaliser le comportement :

```bash
# Dossiers
INPUT_DIR="./markdown"     # Dossier source
OUTPUT_DIR="./html"        # Dossier de sortie

# Template
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
- ✅ Templates personnalisables
- ✅ Table des matières automatique
- ✅ Coloration syntaxique avec Prism.js
- ✅ Copie automatique des images
- ✅ Préservation de l'arborescence des dossiers
- ✅ Support de multiples langages de programmation

## 📝 Exemple de workflow

1. **Créer un nouveau document** :
   ```bash
   mkdir -p markdown/mon-projet
   echo "# Mon Projet" > markdown/mon-projet/index.md
   ```

2. **Convertir** :
   ```bash
   ./convert.sh mon-projet
   ```

3. **Ouvrir le résultat** :
   ```bash
   open html/mon-projet/index.html
   ```

## 🎨 Templates disponibles

- `epitech-academy.html` : Template style Epitech Academy
- `index-template.html` : Template générique

## 📄 Licence

Projet libre d'utilisation.

---

**Auteur** : Edouard LAURENT  
**Repository** : [github.com/EdouardLAURENT/Convert](https://github.com/EdouardLAURENT/Convert)
