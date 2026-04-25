# LCLS MLCV Group Website

This is the Jekyll website for the Machine Learning and Computer Vision group at LCLS.

The site has been simplified from the original al-folio setup. Most visible content is now maintained through Markdown files, YAML data files, one generated publications JSON file, and a small set of local Liquid includes/layouts.

## Quick Start

Install dependencies:

```bash
bundle install
```

Build the site:

```bash
JEKYLL_ENV=production bundle exec jekyll build
```

Preview locally:

```bash
bundle exec jekyll serve --host 127.0.0.1 --port 4001
```

Use `http://127.0.0.1:4001/` for local preview. Avoid the old port `4000` preview if it shows broken CSS/images in sandboxed environments.

## Where To Edit Content

- About page: `_pages/about.md`
- Navigation pages: `_pages/*.md`
- News: `_news/*.md`
- Projects: `_projects/*.md`
- Talks/seminars: `_talks/*.md`
- Team members: `_data/members.yml`
- Students: `_data/students.yml`
- Collaborators: `_data/collaborators.yml`
- Alumni: `_data/alumni.yml`
- GitHub repository cards: `_data/repositories.yml`
- Publications source: `_bibliography/papers.bib`
- Generated publication data: `_data/publications.json`
- Main styles: `assets/css/main.scss`
- Theme and small interactions: `assets/js/theme.js`

## Team Profiles

Add profile photos to `assets/img/team/`. The team include expects the image filename listed in the appropriate YAML data file.

Add or update people in:

- `_data/members.yml`
- `_data/students.yml`
- `_data/collaborators.yml`
- `_data/alumni.yml`

Use the existing entries as the template. Common fields include `name`, `position`, `email`, `image`, `website`, `github`, `scholar`, `orcid`, `projects`, and `projects_pi`.

## Publications

Publications are sourced from `_bibliography/papers.bib`, but the site renders `_data/publications.json`. After editing BibTeX, regenerate the JSON:

```bash
python3 tools/bibtex_to_json.py
```

Useful BibTeX fields include:

- `abbr`: category/venue label shown above the preview thumbnail
- `preview`: image filename under `assets/img/publication_preview/`
- `selected`: set to `true` to show the paper on the home page
- `abstract`: text shown by the `ABS` toggle
- `url`, `html`, `pdf`, `doi`: paper links
- `project`: optional project label

Add preview images to `assets/img/publication_preview/`. The generator will try to normalize preview image extensions when the BibTeX value and actual file extension differ.

## Project References

Project pages no longer use `jekyll-scholar` citation tags. To show a `References` section on a project page:

```yaml
related_publications: true
publication_ids:
  - shenoy2025scalable
  - shenoy2023amortized
```

Each `publication_ids` entry must match an `id` in `_data/publications.json`, which comes from the BibTeX citation key.

## News

Create news items in `_news/`. Filenames should begin with a date:

```text
YYYY-MM-DD-short-title.md
```

The home page shows news in a fixed-height scrollable block, and `/news/` shows the full list.

## Projects And Talks

Projects live in `_projects/` and use the `projects` layout. Talks live in `_talks/` and use the `talks` layout.

Common front matter fields include `title`, `description`, `img`, `importance`, `category`, and `related_publications`.

Repository cards can be embedded with:

```liquid
{% include repository/repo.liquid repository="owner/name" %}
```

## Resources And Repository Cards

The Resources page is `_pages/repositories.md`. Edit general resource links there.

The GitHub repository card grid is populated from `_data/repositories.yml`.

## Notes For Maintainers

- The active GitHub Actions workflow is `.github/workflows/deploy.yml`.
- The site intentionally avoids the old al-folio plugin stack, Node/PurgeCSS build, and `jekyll-scholar`.
- Some old documentation files may still refer to the pre-refactor al-folio setup. Prefer this README and `REFACTOR_REPORT.md` for the current structure.
