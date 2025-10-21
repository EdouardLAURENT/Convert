# 🔧 Guide de Dépannage - Convert

## Vérification avant de pousser

Avant chaque push, lancez le script de vérification :

```bash
./check.sh
```

Ce script vérifie :
- ✅ Tous les fichiers essentiels
- ✅ La structure des dossiers
- ✅ Les workflows GitHub Actions
- ✅ La présence de fichiers Markdown
- ✅ L'installation de Pandoc (en local)
- ✅ Le test de conversion

## Problèmes courants

### ❌ GitHub Actions échoue avec "Process completed with exit code 1"

**Causes possibles :**

1. **Pas de fichiers Markdown**
   ```bash
   # Vérifiez qu'il y a des .md
   ls -la markdown/
   
   # Si vide, ajoutez-en un
   echo "# Test" > markdown/test.md
   git add markdown/test.md
   git commit -m "Add test markdown"
   git push
   ```

2. **Template introuvable**
   ```bash
   # Vérifiez que le template existe
   ls -la .convert/templates/epitech-academy.html
   ```

3. **Permissions GitHub Actions insuffisantes**
   - Allez dans **Settings** → **Actions** → **General**
   - **Workflow permissions** : Sélectionnez **Read and write permissions**
   - Cochez **Allow GitHub Actions to create and approve pull requests**
   - Sauvegardez

4. **Erreur de syntaxe Markdown**
   - Testez localement : `./convert`
   - Vérifiez les logs d'erreur dans Actions

### ❌ GitHub Pages ne s'affiche pas

1. **Vérifiez la configuration Pages**
   - **Settings** → **Pages**
   - **Source** doit être : **GitHub Actions**

2. **Vérifiez que le HTML existe**
   ```bash
   git pull
   ls -la html/
   # Doit contenir des fichiers .html
   ```

3. **Attendez quelques minutes**
   - Le déploiement peut prendre 1-5 minutes

4. **URL correcte**
   - Format : `https://USERNAME.github.io/REPO-NAME/`
   - Exemple : `https://EdouardLAURENT.github.io/Convert/`

### ❌ Le workflow ne se déclenche pas

1. **Vérifiez les workflows sont activés**
   - **Settings** → **Actions** → **General**
   - **Actions permissions** : **Allow all actions and reusable workflows**

2. **Vérifiez les chemins modifiés**
   - Le workflow se déclenche uniquement sur :
     - Fichiers `**.md`
     - Dossiers `markdown/**` ou `sujet/**`
   
   ```bash
   # Doit déclencher le workflow
   git add markdown/test.md
   
   # Ne déclenchera PAS le workflow
   git add config.conf
   ```

3. **Forcer le déclenchement manuel**
   - Allez dans **Actions** → **Convert Markdown to HTML**
   - Cliquez **Run workflow** → **Run workflow**

### ❌ Erreur "pandoc: command not found"

**En local :**
```bash
# macOS
brew install pandoc

# Linux (Ubuntu/Debian)
sudo apt-get install pandoc

# Vérifier
pandoc --version
```

**Sur GitHub Actions :**
- Normalement installé automatiquement
- Vérifiez les logs du step "📦 Install Pandoc"

### ❌ Conflit Git après le push automatique

Le workflow commit automatiquement les HTML. Si vous modifiez aussi `html/` localement :

```bash
# Récupérer les changements distants
git pull --rebase

# Ou écraser avec votre version locale
git push --force
```

**Recommandation :** Ne modifiez JAMAIS `html/` manuellement, laissez le workflow le faire.

### ⚠️ Warning : "No changes to commit"

C'est **normal** si :
- Les `.md` n'ont pas changé
- Le HTML généré est identique

Pas besoin de corriger, ce n'est pas une erreur.

## 🧪 Tests

### Test complet en local

```bash
# 1. Vérification
./check.sh

# 2. Conversion
./convert

# 3. Vérifier le résultat
open html/index.html

# 4. Comparer avec la version GitHub
curl -s https://USERNAME.github.io/REPO/index.html > /tmp/github.html
diff html/index.html /tmp/github.html
```

### Test du workflow sans commit

```bash
# Utilisez [skip ci] dans le message de commit
git commit -m "test: modification [skip ci]"
git push
# Le workflow ne se déclenchera pas
```

### Simuler GitHub Actions en local

```bash
# Simuler l'environnement GitHub Actions
docker run --rm -v $(pwd):/workspace -w /workspace ubuntu:latest bash -c "
  apt-get update && apt-get install -y pandoc git
  chmod +x convert.sh
  ./convert.sh
  ls -la html/
"
```

## 📊 Logs utiles

### Voir les logs d'un workflow échoué

1. Allez dans **Actions**
2. Cliquez sur le workflow en échec
3. Cliquez sur le job "convert" ou "deploy"
4. Développez chaque step pour voir les détails

### Logs locaux

```bash
# Voir les logs détaillés de Pandoc
./convert 2>&1 | tee /tmp/convert.log

# Vérifier les erreurs
grep -i error /tmp/convert.log
```

## 🆘 Besoin d'aide supplémentaire ?

1. **Vérifiez les logs** dans l'onglet Actions
2. **Lancez `./check.sh`** pour diagnostiquer localement
3. **Consultez les issues** : [GitHub Issues](https://github.com/EdouardLAURENT/Convert/issues)
4. **Créez une issue** avec :
   - Le message d'erreur complet
   - Le contenu de votre `markdown/`
   - La sortie de `./check.sh`

## ✅ Checklist avant de créer un repository depuis le template

- [ ] Repository créé depuis le template
- [ ] GitHub Pages activé (Settings → Pages → GitHub Actions)
- [ ] Permissions Actions configurées (Settings → Actions → Read and write)
- [ ] Au moins un fichier `.md` dans `markdown/`
- [ ] Test local : `./check.sh` réussi
- [ ] Premier push effectué
- [ ] Workflow "Convert Markdown to HTML" réussi (Actions)
- [ ] Workflow "Deploy to GitHub Pages" réussi (Actions)
- [ ] Site accessible à `https://USERNAME.github.io/REPO/`

---

**💡 Astuce :** Gardez l'onglet Actions ouvert lors de vos push pour suivre en temps réel !
