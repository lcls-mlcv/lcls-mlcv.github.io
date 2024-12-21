---
layout: page
permalink: /team/
title: Team
description:
nav: true
nav_order: 4
---

<div class="projects">
  <div class="container">
    <div class="row row-cols-1 row-cols-md-4">
    {% for person in site.data.members %}
      {% include team.liquid %}
    {% endfor %}
    </div>
  </div>
</div>

{% if site.data.students %}

  <h2 id="students">Students</h2>
  <div class="projects">
    <div class="container">
      <div class="row row-cols-1 row-cols-md-4">
        {% for person in site.data.students %}
          {% include team.liquid %}
        {% endfor %}
      </div>
    </div>
  </div>

{% endif %}

---

## Collaborators
  <div class="projects">
    <div class="container">
      <div class="row row-cols-1 row-cols-md-4">
        {% for person in site.data.collaborators %}
          {% include team.liquid %}
        {% endfor %}
      </div>
    </div>
  </div>

---

## Past Members
  <div class="projects">
    <div class="container">
      <div class="row row-cols-1 row-cols-md-4">
        {% for person in site.data.alumni %}
          {% include team.liquid %}
        {% endfor %}
      </div>
    </div>
  </div>
