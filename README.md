# Convert 📝→🌐# Convert 📝



[![Convert Markdown](https://github.com/EdouardLAURENT/Convert/actions/workflows/convert-markdown.yml/badge.svg)](https://github.com/EdouardLAURENT/Convert/actions/workflows/convert-markdown.yml)[![Convert Markdown](https://github.com/EdouardLAURENT/Convert/actions/workflows/convert-markdown.yml/badge.svg)](https://github.com/EdouardLAURENT/Convert/actions/workflows/convert-markdown.yml)

[![Deploy Pages](https://github.com/EdouardLAURENT/Convert/actions/workflows/deploy-pages.yml/badge.svg)](https://github.com/EdouardLAURENT/Convert/actions/workflows/deploy-pages.yml)[![Deploy Pages](https://github.com/EdouardLAURENT/Convert/actions/workflows/deploy-pages.yml/badge.svg)](https://github.com/EdouardLAURENT/Convert/actions/workflows/deploy-pages.yml)

[![Template](https://img.shields.io/badge/template-ready-brightgreen.svg)](https://github.com/EdouardLAURENT/Convert/generate)[![Template](https://img.shields.io/badge/template-ready-brightgreen.svg)](https://github.com/EdouardLAURENT/Convert/generate)



**Template pour convertir automatiquement vos fichiers Markdown en site HTML via GitHub Actions.**Convertisseur Markdown → HTML avec Pandoc et templates personnalisés + Déploiement automatique via GitHub Actions.



Idéal pour de la documentation, des cours, des tutoriels ou des articles de blog.## 📋 Description



---Convert est un outil qui transforme vos fichiers Markdown en pages HTML élégantes, en utilisant Pandoc et des templates personnalisables. Idéal pour générer de la documentation, des cours ou des tutoriels avec une mise en forme professionnelle.



## 🚀 Quick Start**🎯 Ce repository est un template** : Utilisez-le pour créer rapidement de nouveaux projets avec conversion automatique Markdown → HTML !



### 1. Créer un nouveau projet## 🔧 Prérequis



Cliquez sur **[Use this template](https://github.com/EdouardLAURENT/Convert/generate)** pour créer votre repository.### Installation de Pandoc



### 2. Activer GitHub Pages**macOS** (avec Homebrew) :

```bash

Dans votre nouveau repository :brew install pandoc

- **Settings** → **Pages** → Source : **GitHub Actions**```



### 3. Ajouter votre contenu**Linux** (Ubuntu/Debian) :

```bash

```bashsudo apt-get install pandoc

git clone https://github.com/VOTRE_USERNAME/VOTRE_PROJET.git```

cd VOTRE_PROJET

**Windows** :

# Créez vos fichiers MarkdownTéléchargez l'installeur depuis [pandoc.org](https://pandoc.org/installing.html)

echo "# Mon Cours" > markdown/index.md

### Vérifier l'installation

# Poussez```bash

git add markdown/pandoc --version

git commit -m "Add: mon contenu"```

git push

```## 📁 Structure du projet



### 4. ✨ Magie automatique```

```

GitHub Actions convertit automatiquement vos `.md` en HTML et déploie sur Pages.Convert/

├── convert                # Script de conversion (wrapper)

**Votre site sera accessible à :**  ├── markdown/              # 📂 DOSSIER CLÉ : Vos fichiers .md source

`https://VOTRE_USERNAME.github.io/VOTRE_PROJET/`│   └── exemple/

│       └── index.md

---├── html/                  # 📂 DOSSIER CLÉ : Fichiers HTML générés

│   └── exemple/

## 📁 Structure│       └── index.html

├── .convert/              # 🔧 Moteur de conversion (ne pas modifier)

```│   ├── engine.sh         # Script principal

VOTRE_PROJET/│   ├── config.conf       # Configuration par défaut

├── markdown/          # 📝 AJOUTEZ VOS .md ICI│   └── templates/        # Templates HTML

│   └── index.md└── sujet/                 # Dossier optionnel pour images

├── html/              # 🌐 HTML générés automatiquement```

│   └── index.html```

└── .convert/          # 🔧 Moteur (ne pas modifier)

    ├── engine.sh### 🔑 Dossiers clés

    ├── config.conf

    ├── templates/- **`markdown/`** : Placez vos fichiers Markdown source ici. L'arborescence sera reproduite dans `html/`

    └── docs/- **`html/`** : Dossier de sortie où seront générés vos fichiers HTML

```- **`.convert/`** : Moteur de conversion (ne pas modifier, géré par le template)



**C'est tout !** Concentrez-vous sur `markdown/`, le reste est géré automatiquement.## 🚀 Utilisation



---### Mode 1 : Utiliser ce repository comme template 🎯



## ⚙️ Personnalisation (Optionnel)**Pour créer un nouveau projet "sujet" avec conversion automatique :**



Créez un fichier `config.conf` **à la racine** pour surcharger les paramètres :1. **Sur GitHub**, cliquez sur "Use this template" → "Create a new repository"

2. Nommez votre projet (ex: "Snake-js", "Cours-Python")

```bash3. Dans le nouveau repository, allez dans **Settings** → **Pages** → Source: **GitHub Actions**

# Dossiers personnalisés4. Clonez et ajoutez vos fichiers `.md` dans `markdown/`

INPUT_DIR="mes-docs"5. Commitez et poussez → **La conversion est automatique !** ✨

OUTPUT_DIR="site"

## 🆘 Besoin d'aide ?

# Template personnalisé

TEMPLATE=".convert/templates/mon-style.html"### Avant de pousser sur GitHub

```bash

# Options./check.sh  # Vérifie que tout est en ordre

TOC_ENABLED="false"        # Désactiver la table des matières```

COPY_IMAGES="true"         # Copier les images automatiquement

```### Documentation

- � **[Guide complet d'utilisation](TEMPLATE_USAGE.md)**

---- 🚀 **[Quick Start](QUICKSTART.md)**

- ⚙️ **[Configuration du template](SETUP_TEMPLATE.md)**

## 🎨 Templates disponibles- 🔧 **[Dépannage](TROUBLESHOOTING.md)**



Dans `.convert/templates/` :Consultez la documentation complète : [TEMPLATE_USAGE.md](TEMPLATE_USAGE.md)

- **epitech-academy.html** : Style Epitech Academy (par défaut)

- **index-template.html** : Template minimaliste### Mode 2 : Conversion locale



Pour créer le vôtre, copiez un template existant et référencez-le dans `config.conf`.### Convertir tous les fichiers



---```bash

./convert

## 🧪 Test en local (Optionnel)```



Si vous voulez tester avant de pousser :Convertit tous les fichiers `.md` du dossier `markdown/` vers `html/`



```bash### Convertir un dossier spécifique

# Installer Pandoc

brew install pandoc  # macOS```bash

# ou./convert nom-du-dossier

sudo apt-get install pandoc  # Linux```



# Convertir localementExemple :

./.convert/engine.sh```bash

./convert Snake-js

# Vérifier```

./check.sh

Convertit uniquement `markdown/Snake-js/` vers `html/Snake-js/`

# Ouvrir le résultat

open html/index.html## ⚙️ Configuration

```

Le fichier `.convert/config.conf` contient la configuration par défaut.

---

Pour personnaliser, créez un fichier `config.conf` **à la racine** du projet :

## 📚 Documentation complète

```bash

- **[Quick Start](.convert/docs/QUICKSTART.md)** : Guide de démarrage (5 min)# Dossiers

- **[Guide complet](.convert/docs/TEMPLATE_USAGE.md)** : Utilisation détailléeINPUT_DIR="markdown"       # Dossier source

- **[Configuration](.convert/docs/SETUP_TEMPLATE.md)** : Configuration GitHubOUTPUT_DIR="html"          # Dossier de sortie

- **[Dépannage](.convert/docs/TROUBLESHOOTING.md)** : Solutions aux problèmes

# Template (relatif à .convert/)

---TEMPLATE="templates/epitech-academy.html"



## ✨ Fonctionnalités# Options

TOC_ENABLED="true"         # Table des matières

- ✅ **Conversion automatique** : Markdown → HTML sur chaque pushTOC_DEPTH="3"              # Profondeur (1-6)

- ✅ **Déploiement automatique** : Sur GitHub Pages

- ✅ **Zero configuration** : Fonctionne directement# Images

- ✅ **Templates personnalisables** : Style Epitech Academy inclusCOPY_IMAGES="true"         # Copie automatique des images

- ✅ **Table des matières** : Générée automatiquementIMAGE_SOURCES="markdown sujet"

- ✅ **Coloration syntaxique** : Via Prism.js```

- ✅ **Images** : Copiées automatiquement

- ✅ **Multi-langages** : Support de nombreux langages## ✨ Fonctionnalités



---- ✅ Conversion Markdown → HTML avec Pandoc

- ✅ **Conversion automatique via GitHub Actions** 🤖

## 🎯 Cas d'usage- ✅ **Déploiement automatique sur GitHub Pages** 🌐

- ✅ Templates personnalisables

### Documentation de projet- ✅ Table des matières automatique

```- ✅ Coloration syntaxique avec Prism.js

markdown/- ✅ Copie automatique des images

├── getting-started.md- ✅ Préservation de l'arborescence des dossiers

├── api-reference.md- ✅ Support de multiples langages de programmation

├── examples.md- ✅ **Repository template prêt à l'emploi**

└── troubleshooting.md

```## 📝 Exemple de workflow



### Cours / Tutoriels### Avec GitHub Actions (automatique) 🤖

```

markdown/1. **Créer un document** :

├── chapitre-1/   ```bash

│   └── introduction.md   echo "# Mon Projet" > markdown/mon-projet.md

├── chapitre-2/   ```

│   └── concepts-avances.md

└── index.md2. **Commiter et pousser** :

```   ```bash

   git add markdown/

### Blog / Articles   git commit -m "Add: nouveau cours"

```   git push

markdown/   ```

├── 2025/

│   ├── 01-premier-article.md3. **Magie** ✨ :

│   └── 02-deuxieme-article.md   - GitHub Actions convertit automatiquement en HTML

└── index.md   - Le résultat est déployé sur GitHub Pages

```   - Accessible à : `https://VOTRE_USERNAME.github.io/VOTRE_PROJET/`



---### En local



## 🛠️ Maintenance1. **Créer un nouveau document** :

   ```bash

### Mettre à jour le moteur   mkdir -p markdown/mon-projet

   echo "# Mon Projet" > markdown/mon-projet/index.md

Le moteur est dans `.convert/`. Pour bénéficier des dernières mises à jour :   ```



1. Copiez les fichiers de `.convert/` depuis le template d'origine2. **Convertir** :

2. Ou créez un nouveau projet depuis le template et migrez votre contenu   ```bash

   ./convert mon-projet

### Vérifier les workflows   ```



Allez dans **Actions** pour voir l'historique des conversions :  3. **Ouvrir le résultat** :

https://github.com/VOTRE_USERNAME/VOTRE_PROJET/actions   ```bash

   open html/mon-projet/index.html

---   ```



## 💡 Commandes utiles## 🎨 Templates disponibles



```bashLes templates sont dans `.convert/templates/` :

# Vérifier le projet- `epitech-academy.html` : Template style Epitech Academy

./check.sh- `index-template.html` : Template générique



# Convertir localementPour personnaliser, créez votre propre template dans `.convert/templates/` et référencez-le dans votre `config.conf` à la racine.

./.convert/engine.sh

## 📄 Licence

# Forcer la reconstruction

git commit --allow-empty -m "rebuild" && git pushProjet libre d'utilisation.



# Nettoyer le HTML généré---

rm -rf html/* && git add html/ && git commit -m "clean" && git push

```**Auteur** : Edouard LAURENT  

**Repository** : [github.com/EdouardLAURENT/Convert](https://github.com/EdouardLAURENT/Convert)

---

## 🤝 Contribution

Ce projet est un template. Pour contribuer :

1. Fork le repository [Convert](https://github.com/EdouardLAURENT/Convert)
2. Créez une branche (`git checkout -b feature/amelioration`)
3. Committez vos changements
4. Poussez et ouvrez une Pull Request

---

## 📄 Licence

Libre d'utilisation.

---

## 🔗 Liens

- 🏠 **Repository** : [github.com/EdouardLAURENT/Convert](https://github.com/EdouardLAURENT/Convert)
- 🌐 **Demo** : [EdouardLAURENT.github.io/Convert](https://EdouardLAURENT.github.io/Convert/)
- 📖 **Documentation** : [.convert/docs/](.convert/docs/)
- 🐛 **Issues** : [github.com/EdouardLAURENT/Convert/issues](https://github.com/EdouardLAURENT/Convert/issues)

---

**Créé avec ❤️ par [Edouard LAURENT](https://github.com/EdouardLAURENT)**

**[⭐ Star ce projet](https://github.com/EdouardLAURENT/Convert) si vous le trouvez utile !**
