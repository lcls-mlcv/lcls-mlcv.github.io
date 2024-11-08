---
layout: page
permalink: /resources/
title: Resources
nav: true
nav_order: 5
---

### Internship Opportunities

- [SLAC Summer Internship Program](https://careers.slac.stanford.edu/slac-summer-internship-program)
- [LCLS Summer Internship Program](https://lcls.slac.stanford.edu/internships)

### Presentations and Posters

- [2024 SSRL/LCLS Users' Meeting Student Poster](https://www-ssrl.slac.stanford.edu/content/ssrl-news/student-poster-awards-sponsored-bioxfel)
- [2023 SLAC Public Lecture: Capturing Molecular Motion Using Artificial Intelligence](https://www.youtube.com/watch?v=cuSC7LZHQkY)

### Documentation and Tutorials

- [LCLS User Resources](https://lcls-users.readthedocs.io)
- [LUTE Documentation](https://slac-lcls.github.io/lute)

### Community Resources

- [Reciprocal Spaceship](https://rs-station.github.io)

---

{% if site.data.repositories.github_users %}

## GitHub users

<div class="repositories d-flex flex-wrap flex-md-row flex-column justify-content-between align-items-center">
  {% for user in site.data.repositories.github_users %}
    {% include repository/repo_user.liquid username=user %}
  {% endfor %}
</div>

---

{% if site.repo_trophies.enabled %}
{% for user in site.data.repositories.github_users %}
{% if site.data.repositories.github_users.size > 1 %}

  <h4>{{ user }}</h4>
  {% endif %}
  <div class="repositories d-flex flex-wrap flex-md-row flex-column justify-content-between align-items-center">
  {% include repository/repo_trophies.liquid username=user %}
  </div>

---

{% endfor %}
{% endif %}
{% endif %}

{% if site.data.repositories.github_repos %}

## GitHub Repositories

<div class="repositories d-flex flex-wrap flex-md-row flex-column justify-content-between align-items-center">
  {% for repo in site.data.repositories.github_repos %}
    {% include repository/repo.liquid repository=repo %}
  {% endfor %}
</div>
{% endif %}
