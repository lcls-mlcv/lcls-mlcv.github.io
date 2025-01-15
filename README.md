# LCLS MLCV Group Website

## Basics

Hopefully everyone in the group can contribute to:

- [Add/update your own profile](#addupdate-team-profile)
- [Add/update publications](#addupdate-publications)
- [Add/update news and posts](#addupdate-news-and-posts)

After your changes are committed, it might take a minute or two to see these changes reflected.

---

Prerequisites:

- Basic familiarity with using [GitHub](https://docs.github.com/en/get-started).
- Basic knowledge of [Markdown](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet). This README.md is written as a Markdown file.
- Basic familiarity of YAML file format:
  ```yaml
  - name: Student Name
    position: Visiting Student
    email: student [at] college.edu
  ```

---

### Add/update team profile

#### 1. Add your profile picture to /assets/img/

- format: xxx size in `.jpg` or `.png`
- name your picture as `team_firstname_lastname.jpg`
- navigate to `/assets/img/` on GitHub and drag-and-drop the picture file from your desktop into the browser window.
- when prompted for **Commit changes**, change the message to "upload `YOUR FILENAME` for members.yml".

#### 2. Add your introduction to /\_data/members.yml

- navigate to `/_data/members.yml` on GitHub and click the pencil for "Edit this file". Add a new entry roughly
  matching the format of the existing ones.
- make sure the indentation is correct -- it's very sensitive for the YAML format.
- when prompted for **Commit changes**, change the message to "Update members.yml to include `YOUR NAME`".

### Add/update publications

You are expected to know how to add/edit a file on GitHub and commit with a descriptive message at this point. If not, you can reference from the [section above](#addupdate-team-profile) or ask for help.

#### 1. Get citation in BibTeX format

You can get this from [Google Scholar](https://scholar.google.com/), other platforms, or citation managers.

#### 2. Add your publication

- Add the citation in BibTeX format to `_bibliography/papers.bib`.
- You can modify specific entries, such as
  - `abbr` for a label for searching/filtering on the website
  - `preview` for a preview image
  - `url`, `pdf`, etc. for linking to the paper
  - `abstract` for displaying a small paragraph when clicked on the button `ABS`

#### 3. Add a preview image

- Add the image to `assets/img/publication_preview/`.
- Modify the `preview` field in the corresponding entry in `_bibliography/papers.bib`.

### Add/update news and posts

You are expected to know how to add/edit a file on GitHub and commit with a descriptive message at this point. If not, you can reference from the [section above](#addupdate-team-profile) or ask for help.

#### 1. Create a Markdown file containing the news or the post.

- navigate to `_posts/` or `_news/` on GitHub and click **Create new file**.
- The filename must begin with the date in YYYY-MM-DD format, followed by a brief title delimited by hyphens and then the extension `.md`.
- Learn more about the format and features supported from examples in the folders or external resources.

## Advanced

For more advanced edits, you may want to install the website locally and make other customizations. See [INSTALL.md](INSTALL.md), [CUSTOMIZE.md](CUSTOMIZE.md), and [CONTRIBUTING.md](CONTRIBUTING.md) for more information.

---

This README instruction is adapted from the [DecisionLab](https://github.com/winstonchiong/decisionlabucsf.github.io) repository.
