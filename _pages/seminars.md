---
layout: page
title: Workshops and Seminars
permalink: /talks/
nav: true
nav_order: 3
display_categories: [Past] #[Upcoming, Past]
horizontal: true
---

<div class="projects">
  {% for category in page.display_categories %}
    <a id="{{ category | slugify }}" href="#{{ category | slugify }}">
      <h2 class="category">{{ category }}</h2>
    </a>
    {% assign sorted_talks = site.talks | where: "category", category | sort: "date" | reverse %}
    <div class="row row-cols-1 row-cols-md-2">
      {% for talk in sorted_talks %}
        {% include talks_horizontal.liquid %}
      {% endfor %}
    </div>
  {% endfor %}
</div>
