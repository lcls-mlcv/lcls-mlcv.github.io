---
layout: page
permalink: /resources/
title: Resources
nav: true
nav_order: 6
---

### LCLS and Friends

- [LCLS Data Systems](https://lcls.slac.stanford.edu/depts/data-systems)
- [LCLS User Resources](https://lcls-users.readthedocs.io) and [LUTE documentation](https://slac-lcls.github.io/lute)
- Reciprocal Spaceship [GitHub](https://rs-station.github.io) and [Forum](https://discourse.rs-station.org)

### Internship Opportunities

- [SLAC Summer Internship Program](https://careers.slac.stanford.edu/slac-summer-internship-program)
- [LCLS Summer Internship Program](https://lcls.slac.stanford.edu/internships)

### Conferences and Workshops

- [SSRL/LCLS Users' Meeting](https://web.cvent.com/event/8c2bdf8d-08a1-41c5-b24e-390d039d9be2/summary)
- [West Coast Structural Biology Workshop](https://wcsbw2025.macromolecules.xyz/)
- [Machine Learning in Structural Biology](https://www.mlsb.io/)

### Seminars and Lectures
- [SSRL Photon Science Seminars](https://www-ssrl.slac.stanford.edu/content/events/photon-science-seminar-series)
- [Stanford Center for Image System Engineering Events](https://scien.stanford.edu/index.php/events/)
- [Stanford Data Science Seminars](https://datascience.stanford.edu/events/upcoming-events)

### Scientific and Engineering Background

#### Machine Learning and Computational Methods
- [CS231N Deep Learning for Computer Vision](https://cs231n.github.io/)
- [CS 279 Computational Biology](https://web.stanford.edu/class/cs279/)
- [EE367 / CS448I: Computational Imaging](https://stanford.edu/class/ee367/)
- [The Missing Semester of Your CS Education](https://missing.csail.mit.edu/)

#### Structural Methods
- *Visualizing the Invisible* by Peter Moore (ISBN: 9780199930722)
- [IUCrJ teaching pamphlets](https://www.iucr.org/education/pamphlets)
- [Movies](https://bl831.als.lbl.gov/~jamesh/movies/) for crystallography metrics by James Holton
- [The Interactive Structure Factor Tutorial](http://www.ysbl.york.ac.uk/~cowtan/sfapplet/sfintro.html)
- [Kathryn Cowtan's Picture Book of Fourier Transforms](http://www.ysbl.york.ac.uk/~cowtan/fourier/fourier.html)
- [Cryo EM lectures by Grant Jensen](https://www.youtube.com/playlist?list=PL8_xPU5epJdctoHdQjpfHmd_z9WvGxK8-)

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
