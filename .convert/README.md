# .convert/ - Moteur de conversion

Ce dossier contient le moteur de conversion Markdown → HTML.

## 📁 Contenu

- **`engine.sh`** : Script principal de conversion (appelé par `convert` à la racine)
- **`config.conf`** : Configuration par défaut
- **`templates/`** : Templates HTML pour la conversion

## 🔧 Personnalisation

### Modifier la configuration

Vous pouvez créer un fichier `config.conf` à la racine du projet pour surcharger les valeurs par défaut.

**Exemple** : `config.conf` à la racine
```bash
# Surcharge de la configuration
INPUT_DIR="mes-docs"
OUTPUT_DIR="site"
TEMPLATE=".convert/templates/index-template.html"
TOC_ENABLED="false"
```

### Créer un template personnalisé

1. Copiez un template existant :
   ```bash
   cp .convert/templates/epitech-academy.html .convert/templates/mon-template.html
   ```

2. Modifiez-le selon vos besoins

3. Utilisez-le dans votre configuration :
   ```bash
   TEMPLATE=".convert/templates/mon-template.html"
   ```

## ⚠️ Ne pas modifier

**Ce dossier est géré par le template Convert.**

Si vous utilisez ce repository comme template, les fichiers de `.convert/` sont automatiquement inclus.

Pour les mises à jour du moteur, consultez : https://github.com/EdouardLAURENT/Convert
