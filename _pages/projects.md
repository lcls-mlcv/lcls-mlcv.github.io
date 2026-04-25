---
layout: page
title: Projects
permalink: /projects/
nav: true
nav_order: 1
display_categories: [Computational Imaging, Automation, Data Reduction]
horizontal: false
---

<div class="projects">
  {% for category in page.display_categories %}
    <a id="{{ category | slugify }}" href="#{{ category | slugify }}">
      <h2 class="category">{{ category }}</h2>
    </a>
    {% assign categorized_projects = site.projects | where: "category", category | sort: "importance" %}
    <div class="row row-cols-1 row-cols-md-3">
      {% for project in categorized_projects %}
        {% include projects.liquid %}
      {% endfor %}
    </div>
  {% endfor %}
</div>
