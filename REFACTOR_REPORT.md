# LCLS-MLCV Website Refactor Report

Date: 2026-04-24
Branch: `refactor/simplify-website`

## Goal

Simplify the LCLS-MLCV website so it is easier to maintain while preserving the visible public site: About, Projects, Publications, Workshops/Seminars, Team, Resources, News, and detail pages for projects, talks, and news.

## What Changed

- Replaced the large al-folio configuration with a compact Jekyll config in `_config.yml`.
- Reduced Ruby dependencies to the minimum needed for Jekyll in `Gemfile`.
- Replaced the theme layout stack with focused layouts:
  - `_layouts/default.liquid`
  - `_layouts/page.liquid`
  - `_layouts/about.liquid`
  - `_layouts/projects.liquid`
  - `_layouts/talks.liquid`
  - `_layouts/post.liquid`
- Replaced large theme includes with smaller local includes for navigation, footer, cards, figures, videos, team members, news, repositories, and publications.
- Consolidated styling into `assets/css/main.scss`.
- Simplified dark mode and mobile navigation behavior in `assets/js/theme.js`.
- Replaced `jekyll-scholar` rendering with static publication data:
  - Source remains `_bibliography/papers.bib`.
  - Generated data is saved in `_data/publications.json`.
  - Generator script is `tools/bibtex_to_json.py`.
- Simplified GitHub Actions by keeping only `.github/workflows/deploy.yml`.
- Removed unused al-folio plugins, layouts, includes, Sass partials, Node/PurgeCSS files, and extra CI workflows.

## Validation So Far

- `JEKYLL_ENV=production bundle exec jekyll build` succeeds.
- Local asset validation passes: local stylesheet/image/script references in built HTML resolve under `_site`.
- Main routes were checked:
  - `/`
  - `/projects/`
  - `/publications/`
  - `/talks/`
  - `/team/`
  - `/resources/`
  - `/news/`
  - sample project and talk detail pages
- Local preview is running at `http://127.0.0.1:4001/`.

## Important Notes

- The first local server at port `4000` was sandboxed and produced broken CSS/images because WEBrick hit `Operation not permitted - sendfile`. The working preview is the unsandboxed server on port `4001`.
- Some old publication citation tags were removed from project/talk text because `jekyll-scholar` is no longer part of the build.
- Publication preview image names are normalized by `tools/bibtex_to_json.py` when the BibTeX extension differs from the actual image file.
- `.vscode/tasks.json` and `.vscode/settings.json` appeared as unrelated workspace changes during branch switching and were not intentionally part of the website refactor.

## Current Tradeoffs

- The site is much smaller and builds faster, but some al-folio niceties are intentionally gone for now: search, publication badges, automatic citation formatting, extensive icon stacks, blog pagination, notebook support, responsive image generation, and extra CI checks.
- The current look is structurally close and functional, but it is not yet a pixel-perfect match to the old al-folio site. This is expected at this checkpoint and should be tuned incrementally.

## Likely Follow-Ups

- Restore selected visual details that are still useful, one at a time.
- Decide whether publications should remain generated from BibTeX or be maintained directly as YAML/JSON.
- Add a small contributor guide explaining where to edit people, projects, news, talks, resources, and publications.
- Add a lightweight validation command or script for build plus local asset checks.
- Resolve or intentionally ignore the unrelated `.vscode` changes before committing.
