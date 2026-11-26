# crafty_machine_culture_studio

The public site of Crafty Machine LLC at **craftymachine.com** — "Culture
Studio — by Crafty Machine". Static HTML/CSS/JS, hosted on GitHub Pages. No
back end, no Rails, no database.

It has its own repo, `stcorbett/craftymachine.com`, published by GitHub
Pages. Its kickoff doc lives with the ecosystem's shared docs in
`~/work/culture_studio`, but nothing there serves it.

- **What it's for, how it should feel, what content exists:**
  `~/work/culture_studio/ecosystem_docs/apps/crafty_machine_culture_studio.md`. Read §2 before
  writing any copy.
- **Decisions** (brand, structure, hosting) as they are made:
  `docs/DECISIONS.md`, dated, newest last.
- **The old site's text**, for facts only: `docs/ARCHIVE.md`.
- **The site that is live today:** `index.html`, `styles.css`, `blog/` and
  `CNAME` at the root of this repo — a hand-written placeholder from March
  2026, served by GitHub Pages from the root of `main`. Leave them serving
  until `bin/deploy` publishes the new build; switching Pages to the new
  output is part of writing `bin/deploy`. Its blog post
  (`blog/why-bring-crafty-machine-back.html`) is source material in Sean's
  own words.
- **The sister site,** built the same way: `~/work/visittrellis.com` (the
  Trellis sales page). Whichever is built first sets the pattern for
  `bin/build`, `bin/dev` and `bin/deploy`; the other copies it.
- **House conventions:** `~/work/culture_studio/ecosystem_docs/RAILS_BOOTSTRAP.md`. The parts
  that apply here: Ruby 3.4.13, Tailwind via the standalone binary, no Node,
  bare-bones JS, Ruby `bin/` scripts, README shape, and **Git: stage, don't
  commit**. The Rails, Postgres and Heroku parts don't apply.

## Working here

- Port **4007** for the local preview (`bin/dev`). Keep it in sync with the
  port table in `RAILS_BOOTSTRAP.md`.
- Source in `src/`, built output in `_site/` (gitignored). Never hand-edit
  `_site/`.
- `bin/build` → `_site/`; `bin/dev` → build, watch, serve; `bin/deploy` →
  checks, then publish to GitHub Pages (`--dry-run` supported).
- No npm, no bundler, no framework. A page that works without JavaScript is
  the default.

**Status:** docs only (moved here from `culture_studio` on 2026-11-20). The
brief is being gathered; `src/`, `bin/` and the Gemfile are built once it's
answered.
