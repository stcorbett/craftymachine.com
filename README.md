# craftymachine.com

The public site of **Crafty Machine LLC** — *Culture Studio — by Crafty
Machine*. Who we are, the apps of the ecosystem and the work behind them, and
how to reach us. A static site with no back end, published on GitHub Pages
at craftymachine.com.

> **Status:** scaffolded. The brief is in progress; the build scripts and
> pages come next. See `~/work/culture_studio/ecosystem_docs/apps/crafty_machine_culture_studio.md`.

## Stack

- Static HTML, written as ERB templates and rendered by a small Ruby script
- **Ruby** 3.4.13 (the ecosystem's pin) — build tooling only
- **Tailwind CSS** via the standalone binary (`tailwindcss-ruby`) — no Node
- Plain JavaScript modules, only where a page needs them
- **GitHub Pages**, custom domain `craftymachine.com`

## Architecture

**A site, not an app.** It has its own repo and shares nothing at runtime
with the hub Rails app, `culture_studio`, which holds its kickoff doc: no server, no database, no
sign-in. When the hub serves sign-in and subscriptions, this site links to it.

**Source and output are separate.** `src/` holds templates, CSS and JS;
`bin/build` renders everything into `_site/`, which is what GitHub Pages
serves. `_site/` is never committed by hand.

## Getting started

```sh
bin/dev      # builds, watches src/, serves http://localhost:4007
```

## Tests

`bin/deploy --dry-run` runs the checks without publishing: every internal
link resolves, every page has a title and description.

## Deploying

```sh
bin/deploy
```

DNS and GitHub Pages setup are one-off steps, recorded in `docs/DEPLOY.md`
when they're done.
