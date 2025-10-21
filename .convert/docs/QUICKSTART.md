# 🚀 Quick Start - Convert Template

## Utiliser ce template pour un nouveau projet

### 1️⃣ Créer votre repository

**Option A : Via GitHub (Recommandé)**
1. Cliquez sur le bouton vert **"Use this template"** en haut de cette page
2. Donnez un nom à votre projet (ex: "Snake-js", "Cours-Python", "Documentation-API")
3. Créez le repository

**Option B : Via GitHub CLI**
```bash
gh repo create MON_PROJET --template EdouardLAURENT/Convert --public
```

### 2️⃣ Activer GitHub Pages

Dans votre nouveau repository :
1. Allez dans **⚙️ Settings** → **📄 Pages**
2. **Source** : Sélectionnez **GitHub Actions**
3. Sauvegardez

🎉 Votre site sera disponible à : `https://VOTRE_USERNAME.github.io/MON_PROJET/`

### 3️⃣ Ajouter votre contenu

```bash
# Cloner
git clone https://github.com/VOTRE_USERNAME/MON_PROJET.git
cd MON_PROJET

# Créer votre contenu
echo "# Bienvenue" > markdown/index.md
echo "## Introduction" >> markdown/index.md

# Pousser
git add markdown/
git commit -m "Add: contenu initial"
git push
```

### 4️⃣ Magie automatique ✨

GitHub Actions va :
- 🔄 Détecter votre fichier `.md`
- 🏗️ Le convertir en HTML
- 💾 Committer le HTML généré
- 🚀 Déployer sur GitHub Pages

**Attendez 1-2 minutes**, puis visitez votre site !

## 📁 Organisation de vos fichiers

```
MON_PROJET/
├── markdown/              # ✍️ VOS FICHIERS ICI
│   ├── index.md          # Page d'accueil
│   ├── chapitre-1.md     # Vos cours
│   └── images/           # Vos images
│
├── html/                 # 🤖 Généré automatiquement
│   ├── index.html
│   └── chapitre-1.html
│
├── .convert/             # 🔧 Moteur (ne pas modifier)
│   ├── engine.sh
│   ├── config.conf
│   └── templates/
│
└── convert               # Script de conversion
```

## ⚡ Commandes rapides

```bash
# Test local (nécessite Pandoc)
./convert

# Convertir un dossier spécifique
./convert chapitre-1

# Ouvrir le résultat
open html/index.html
```

## 🎯 Cas d'usage

### Créer un cours
```bash
mkdir -p markdown/cours-javascript
echo "# JavaScript Basics" > markdown/cours-javascript/index.md
git add . && git commit -m "Add: cours JS" && git push
```

### Créer une documentation projet
```bash
echo "# API Documentation" > markdown/api-docs.md
git add . && git commit -m "Add: API docs" && git push
```

### Organiser par chapitres
```bash
mkdir -p markdown/{intro,basics,advanced}
echo "# Introduction" > markdown/intro/index.md
echo "# Basics" > markdown/basics/index.md
echo "# Advanced" > markdown/advanced/index.md
git add . && git commit -m "Add: structure cours" && git push
```

## 🔧 Personnalisation

### Modifier le template HTML
Copiez et éditez un template dans `.convert/templates/`

### Modifier la configuration
Créez un fichier `config.conf` **à la racine** :
```bash
# Activer/désactiver la table des matières
TOC_ENABLED="true"
TOC_DEPTH="3"

# Changer le template
TEMPLATE="templates/mon-template.html"

# Copie des images
COPY_IMAGES="true"
```

## 📊 Suivre les conversions

Allez dans **Actions** pour voir :
- ✅ Conversions réussies
- ⏱️ Temps de conversion
- ❌ Erreurs éventuelles

## 🆘 Besoin d'aide ?

Consultez la documentation complète : [TEMPLATE_USAGE.md](TEMPLATE_USAGE.md)

---

**🎉 Vous êtes prêt ! Commencez à créer votre contenu.**
