# Convert 📝→🌐

[![Convert Markdown](https://github.com/EdouardLAURENT/Convert/actions/workflows/convert-markdown.yml/badge.svg)](https://github.com/EdouardLAURENT/Convert/actions/workflows/convert-markdown.yml)
[![Deploy Pages](https://github.com/EdouardLAURENT/Convert/actions/workflows/deploy-pages.yml/badge.svg)](https://github.com/EdouardLAURENT/Convert/actions/workflows/deploy-pages.yml)

**Convertisseur automatique Markdown → HTML avec déploiement GitHub Pages**

---

## 📚 Cours disponibles

### 📁 snake-js

- 🔗 [Snake-js](https://EdouardLAURENT.github.io/Convert/html/snake-js/Snake-js.html)

### 📁 test-cours

- 🔗 [index](https://EdouardLAURENT.github.io/Convert/html/test-cours/index.html)

---

## 🚀 Utilisation

1. Ajoutez vos fichiers Markdown dans `markdown/NOM_COURS/`
2. Ajoutez vos ressources (images, etc.) dans `static/NOM_COURS/`
3. Committez et pushez → La conversion se fait automatiquement via GitHub Actions
4. Les pages sont déployées sur GitHub Pages

### Conversion locale

```bash
# Convertir tous les cours
./.convert/engine.sh

# Convertir un cours spécifique
./.convert/engine.sh nom-du-cours
```

---

_Généré automatiquement par Convert • 21/10/2025 11:37_
