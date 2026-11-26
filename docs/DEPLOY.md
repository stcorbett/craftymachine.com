# Deploying craftymachine.com

How the site gets from `main` to the web, and the one-off steps to switch
the live domain from the March 2026 placeholder to this build. Each step says
whether it's done. Same pattern as `~/work/visittrellis.com/docs/DEPLOY.md`.

## How a deploy works (once set up)

```sh
bin/deploy --dry-run   # build + checks, publishes nothing
bin/deploy             # build + checks, then `git push origin main`
```

Pushing `main` runs `.github/workflows/pages.yml`: GitHub builds `_site/` on
a clean machine (Ruby from `.ruby-version`, Tailwind from the Gemfile), runs
`bin/check`, and deploys it to Pages. What's live is always what's on `main`.
`bin/deploy` refuses to push from another branch or with uncommitted changes.

---

## What's there today (checked 2026-11-25)

- **Repo** `stcorbett/craftymachine.com`, public.
- **Pages** is on: `build_type: legacy`, serving the root of `main` (the
  placeholder `index.html`, `styles.css`, `blog/`). Custom domain
  `craftymachine.com`, certificate approved for the apex and `www`,
  **HTTPS enforced** (turned on 2026-11-20).
- **DNS at GoDaddy** (`ns41/ns42.domaincontrol.com`): apex A records to
  `185.199.108–111.153`, `www` CNAME to `stcorbett.github.io`. Correct;
  nothing to change.
- **Mail:** MX is `smtp.google.com` (Google Workspace).

---

## One-off setup

### 1. Verify the domain with GitHub — *not confirmed*

Stops anyone else's Pages site claiming craftymachine.com.

1. github.com/settings/pages (account settings) → **Add a domain** →
   `craftymachine.com`.
2. GoDaddy → DNS → add a **TXT** record, name
   `_github-pages-challenge-stcorbett`, value as GitHub shows it.
3. `dig +short TXT _github-pages-challenge-stcorbett.craftymachine.com`
   returns the code → click **Verify**.

### 2. Make sure hello@craftymachine.com receives mail — *not confirmed*

The site's only way in. In Google Workspace admin, add `hello@` as an alias
of your user (or a group). Send it a test message.

### 3. Commit — *done 2026-11-25*

```sh
git diff --cached      # review
git commit
```

### 4. Switch Pages from the root of `main` to GitHub Actions — *done 2026-11-25*

```sh
gh api -X PUT repos/stcorbett/craftymachine.com/pages -f build_type=workflow
gh api repos/stcorbett/craftymachine.com/pages --jq '{build_type, cname, https_enforced}'
```

Expect `"workflow"`, `"craftymachine.com"`, `true`. The placeholder keeps
serving until the first workflow deploy replaces it. If `cname` came back
empty, set it again:
`gh api -X PUT repos/stcorbett/craftymachine.com/pages -f cname=craftymachine.com`.

### 5. First deploy — *done 2026-11-25* (run 45742481763; redirects and 404 checked)

```sh
bin/deploy
```

It pushes `main` and watches the "Publish to GitHub Pages" run. When it's
green, check:

- https://craftymachine.com shows the new site (hard-refresh).
- http://craftymachine.com and https://www.craftymachine.com redirect to
  `https://craftymachine.com/`.
- https://craftymachine.com/blog/ shows the new "That page isn't here".

### 6. Remove the placeholder — *done 2026-11-25* (staged; last in `c474a78`)

Pages no longer reads the root of `main`, so the March files are dead
weight. Keep `CNAME`.

```sh
git rm -r index.html styles.css blog
git commit -m "Remove the March 2026 placeholder"
bin/deploy
```

---

## Rolling back

A bad deploy: revert the commit and deploy again. What's live is what's on
`main`.

```sh
git revert <commit>
bin/deploy
```

Or re-run an earlier good "Publish to GitHub Pages" run from the repo's
Actions tab, which deploys that run's build without touching `main`.
