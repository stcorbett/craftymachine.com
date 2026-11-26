# Decisions

Choices for craftymachine.com that the kickoff doc
(`~/work/culture_studio/ecosystem_docs/apps/crafty_machine_culture_studio.md`) didn't settle,
dated, newest last, each with the reason.

---

## 2026-11-18 — A static site inside the culture_studio repo

The site has no back end, so it is not a Rails app and doesn't follow the
Rails half of `RAILS_BOOTSTRAP.md`. It keeps the rest of the house stack:
Ruby for tooling, Tailwind's standalone binary, no Node, Ruby `bin/` scripts.

It lives in `culture_studio/crafty_machine_culture_studio/` rather than its
own repo because it is the public face of the same ecosystem and changes
alongside its docs. The cost: GitHub Pages serves one site per repo, and on
GitHub's free plan only from a public repo. If `culture_studio` stays
private, `bin/deploy` publishes the built output to a separate public repo
and the source stays here. Decided before `bin/deploy` is written.

**Port 4007** for the local preview, the next free one after `civic_desk`.

**The H1 is "Culture Studio — by Crafty Machine".** Crafty Machine is the
legal entity and stays the name of record (footer, legal pages); Culture
Studio is what the company does now.

## 2026-11-20 — Its own repo after all

The site moves out of `culture_studio/crafty_machine_culture_studio/` into
this repo, `stcorbett/craftymachine.com`, which already existed and already
serves craftymachine.com from GitHub Pages (the March 2026 placeholder at its
root). That settles the open hosting question: GitHub Pages serves one site
per repo, free only from a public repo, and `culture_studio` stays private.
Publishing built output from a private repo into this one would have meant
two repos and a cross-repo push for every deploy; source and output now live
together.

The kickoff doc stays in `culture_studio/ecosystem_docs/apps/`, with every
other app's, and this repo's `CLAUDE.md` points at it. The entry above is
kept as history; where it says the site lives in `culture_studio`, this one
replaces it.

The same pattern is used for the Trellis sales page (`~/work/visittrellis.com`).

## 2026-11-20 — Build, deploy and contact

**`bin/deploy` publishes to a `gh-pages` branch.** It builds `_site/` locally,
runs the checks, and force-pushes `_site/` (with `CNAME` and `.nojekyll`) to
`gh-pages`. The first real deploy switches the Pages source from `main` `/` to
`gh-pages` `/`. Deploying is an explicit act, as with Heroku elsewhere. CI
never needs Ruby or the Tailwind binary, and `main` holds only source.
visittrellis.com copies this.

**HTTPS enforced** (turned on 2026-11-20). The certificate already covered
`craftymachine.com` and `www.craftymachine.com`, and DNS at GoDaddy was
already correct: apex A records to GitHub Pages, `www` CNAME to
`stcorbett.github.io`.

**The blog is retired.** The March 2026 post stays in this repo's history as
source material for the About page. It is not carried into the new build.

**Contact is an email link,** with copy that describes a good fit. No form,
no third party.

**No analytics.**

## 2026-11-20 — Structure, look and what the work shows

**Four pages:** Home, Work, About, Contact, as proposed in the kickoff doc §4.

**Editorial serif look.** Self-hosted serif headings, generous whitespace,
near-black on a warm off-white, one restrained accent.

**Work page shows:** all four live apps (`communities`, `www_events`,
`solver`, `bnb`) under public names; HaveMyShift and Fresh Metrix as past
products. Cycle Voice and Zee Manager are left off. Planned apps are not
shown until they launch.

**Client engagements are described, not named.** No client names or logos.
The three outcomes from the old site (bounce rate halved and conversion up
25%; an enterprise-grade product in three weeks; $0 → $120k monthly
transaction volume in three months) are confirmed accurate and are reused.

## 2026-11-25 — Publish with GitHub Actions, as visittrellis.com does

This replaces the 2026-11-20 choice of a `gh-pages` branch. visittrellis.com
was built first and publishes with a GitHub Actions Pages workflow, and the
second site copies the first. `bin/deploy` builds and checks locally, then
pushes `main`. `.github/workflows/pages.yml` rebuilds on GitHub and deploys.
What's live is always what's on `main`, a deploy can't publish uncommitted
work, and there's no branch of built files. `bin/build`, `bin/dev`,
`bin/check` and `bin/deploy` are copied from visittrellis.com, changed only
for the port (4007) and the domain. The runbook is `docs/DEPLOY.md`.

**Ruby 3.4.13**, the house pin as of 2026-11-25 (`RAILS_BOOTSTRAP.md`).

## 2026-11-25 — First content

- **Live apps, public names:** Trellis → visittrellis.com; Nightly Keep →
  app.nightlykeep.com; What Where When → whatwherewhen.lakesoffire.org;
  the word-game solver is listed with no link.
- **Past products:** HaveMyShift (founder; Techstars Boston; over 10,000
  shifts swapped) and Fresh Metrix (founder). Years are left off until
  confirmed.
- **Contact:** hello@craftymachine.com.
- **The one-line description,** in Sean's words: "a network of applications
  and businesses that support humanity."
- **Location and photo:** left off for now.
- **Deferred, to ask again:** which engagement each of the three outcomes
  came from, the hospitality and community-organizing record, what a good
  fit looks like, and a photo. Until they're answered, client work and
  outcomes are not on the site, and the Contact page doesn't describe a fit.
- **Type:** Source Serif 4 (self-hosted variable woff2, SIL OFL) with the
  system sans for labels and navigation.
