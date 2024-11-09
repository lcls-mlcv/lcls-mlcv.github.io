# Customizing the website

This is a minimal guide specific to our group website. There are many more features supported by the original template that we might want to explore in the future, and you can refer to their [CUSTOMIZE.md](https://github.com/alshedivat/al-folio/blob/main/CUSTOMIZE.md) for more information.

### Key repo components

📂 \_pages/: main pages of the website
├── 📄 about.md: homepage content
├── 📄 news.md: group updates and milestones
├── 📄 posts.md: longer form technical content
├── 📄 team.md: team member information
├── 📄 projects.md: ongoing and past projects
├── 📄 publications.md: research publications
└── 📄 resources.md: links and repositories

#### About page

Consist of the homepage content. Supports a news feed, blog posts, and selected publications.

#### News page

This page reads .md files from `_news` and has timestamp on the left column. It is intended for brief updates on the group's activities and milestones (can link to posts).

This page is currently not shown on the navigation bar and only accessible from the homepage.

#### Posts page

This page reads .md files from `_posts`. It is intended for longer form content like technical write-ups (can link to projects).

Currently, it contains a selection of example posts from the original template that contain features might be of our interests, such as supporting jupyter notebook, block code, and images. There are many more features that we could explore in the future.

This page is currently not shown on the navigation bar and only accessible from the homepage.

#### Projects page

This page reads .md files from `_projects` and categorizes them as `Ongoing` or `Past`.

#### Team page

This page reads data from `_data` and `assets/img`. To modify the content (e.g. add/remove people), edit the corresponding files:
📂 \_data/:
├── 📄 members.yml: staff/employees
├── 📄 students.yml: students/interns
├── 📄 alumni.yml: past members
└── 📄 collaborators.yml: external collaborators

📂 assets/img/:
└── 📄 team_firstname_lastname.jpg: profile picture of team members

#### Publications page

This page reads references from `_bibliography/papers.bib`. You can modify entries there to:

- determine which ones are selected to be shown on the homepage.
- add preview images from `assets/img/publication_preview`.
- add `abbr` to assign labels for searching/filtering on the page.
- add `abstract`, `pdf`, and `url` to provide more information about the publication in a visually appealing way.

#### Resources page

This page currently consists of a miscellaneous collection of links (internship opportunities, previous talks, tutorials, community resources, etc.) and a section for GitHub repositories for the group. To modify the GitHub repositories, edit `_data/repositories.yml`.

### Asthetics and styling

I am still learning this, and please refer to the [original template's CUSTOMIZE.md](https://github.com/alshedivat/al-folio/blob/main/CUSTOMIZE.md) for more information.
