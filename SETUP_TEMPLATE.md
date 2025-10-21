# 🎯 Configuration du Repository Template sur GitHub

## Étapes à suivre sur GitHub.com

### 1. Activer le mode Template

1. Allez sur **https://github.com/EdouardLAURENT/Convert**
2. Cliquez sur **⚙️ Settings** (en haut à droite)
3. Dans la section **General** (première section)
4. Cochez la case **☑️ Template repository**
5. Sauvegardez

✅ Votre repository affichera maintenant un bouton vert **"Use this template"**

### 2. Activer GitHub Pages (pour tester)

1. Toujours dans **Settings**
2. Dans le menu de gauche, cliquez sur **📄 Pages**
3. Dans **Source**, sélectionnez **GitHub Actions**
4. Sauvegardez

🌐 Votre site sera disponible à : **https://EdouardLAURENT.github.io/Convert/**

### 3. Configurer les Topics (tags)

1. En haut de la page du repository
2. Cliquez sur **⚙️** (à côté de "About")
3. Ajoutez ces topics :
   - `markdown`
   - `html`
   - `pandoc`
   - `github-actions`
   - `github-pages`
   - `documentation`
   - `template`
   - `converter`
   - `education`
4. Sauvegardez

### 4. Vérifier que tout fonctionne

1. Allez dans l'onglet **Actions**
2. Vous devriez voir 2 workflows :
   - ✅ "Convert Markdown to HTML"
   - ✅ "Deploy to GitHub Pages"
3. Si un workflow échoue, cliquez dessus pour voir les logs

## 🎉 C'est fait !

Votre repository est maintenant un **template prêt à l'emploi** !

### Pour créer un nouveau projet depuis ce template :

**Option 1 : Interface GitHub**
1. Cliquez sur **"Use this template"** (bouton vert)
2. Nommez votre nouveau projet
3. Créez-le

**Option 2 : GitHub CLI**
```bash
gh repo create MON_PROJET --template EdouardLAURENT/Convert --public
cd MON_PROJET
```

## 📝 Test du workflow automatique

Pour tester que tout fonctionne :

```bash
# Modifiez le fichier markdown/index.md
echo "

## Test automatique

Ce texte a été ajouté pour tester le workflow." >> markdown/index.md

# Committez et poussez
git add markdown/index.md
git commit -m "test: workflow automatique"
git push
```

Puis :
1. Allez dans **Actions** sur GitHub
2. Vous verrez le workflow "Convert Markdown to HTML" se lancer
3. Après ~1 minute, vérifiez que `html/index.html` a été mis à jour
4. Visitez votre site GitHub Pages pour voir le résultat

## 🔧 Permissions GitHub Actions

Si le workflow échoue avec une erreur de permissions :

1. **Settings** → **Actions** → **General**
2. Dans **Workflow permissions** :
   - Sélectionnez **Read and write permissions**
   - Cochez **Allow GitHub Actions to create and approve pull requests**
3. Sauvegardez

## 🆘 Dépannage

### Le workflow ne se déclenche pas
- Vérifiez que les workflows sont activés : **Settings** → **Actions** → **Actions permissions** → **Allow all actions**

### Erreur "pandoc: command not found"
- Normal, le workflow installe Pandoc automatiquement. Vérifiez les logs du step "Install Pandoc"

### Le site Pages ne s'affiche pas
- Attendez 1-2 minutes après le déploiement
- Vérifiez que GitHub Pages est bien configuré en mode "GitHub Actions"
- L'URL est : `https://VOTRE_USERNAME.github.io/NOM_DU_REPO/`

### Le commit automatique échoue
- Vérifiez les permissions (voir ci-dessus)
- Le message de commit contient `[skip ci]` pour éviter une boucle infinie

---

**✅ Tout est configuré ! Vous pouvez maintenant utiliser Convert comme template pour tous vos projets de documentation.**
