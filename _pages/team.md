---
layout: page
permalink: /team/
title: Team
description:
nav: true
nav_order: 2
---

<div class="projects">
  <div class="container">
    <div class="row row-cols-1 row-cols-md-2">
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
      <div class="row row-cols-1 row-cols-md-2">
        {% for person in site.data.students %}
          {% include team.liquid %}
        {% endfor %}
      </div>
    </div>
  </div>

{% endif %}

---

## Collaborators

{% for collaborator in site.data.collaborators %}

<div id = "{{collaborator.name | replace: ' ', '-'}}" class="row" style="padding-top: 60px; margin-top: -60px;">
    <div style="margin-left: 15px;">
        <h3>{{collaborator.name}}{% if collaborator.degrees %}, {{collaborator.degrees}} {% endif %}</h3>
        {{collaborator.position}} <br>
        {% if collaborator.website %}
          <i class="fa fa-globe"></i> <a href= "{{collaborator.website}}" target="_blank">{{collaborator.website}}</a> <br>
        {% endif %}
    </div>
</div>
<hr>
{% endfor %}

---

## Past Members

{% for alum in site.data.alumni %}

<div id = "{{alum.name | replace: ' ', '-'}}" class="row" style="padding-top: 60px; margin-top: -60px;">
    <div style="margin-left: 15px;">
        <h3>{{alum.name}}{% if alum.degrees %}, {{alum.degrees}} {% endif %}</h3>
        {% if alum.previously %}Previously: {{alum.previously}} <br>{% endif %}
        {% if alum.projects %}
          Projects:
          {% for project in alum.projects %}
            <a href="{{ project | prepend: '/projects/' | relative_url }}" class="btn btn-sm z-depth-0" role="button">{{ project }}</a>
          {% endfor %}
          <br>
        {% endif %}
        {% if alum.now %}Now: {{alum.now}} <br>{% endif %}
        {% if alum.email %}
          <i class="fa fa-envelope"></i> <em>{{alum.email}}</em> <br>
        {% endif %}
        {% if alum.website %}
          <i class="fa fa-globe"></i> <a href= "{{alum.website}}" target="_blank">{{alum.website}}</a> <br>
        {% endif %}
    </div>
</div>
<hr>
{% endfor %}
