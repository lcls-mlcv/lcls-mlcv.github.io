---
layout: page
permalink: /team/
title: Team
description:
nav: true
nav_order: 2
---

{% for person in site.data.members %}

<!-- The paddingtop and margin-top edits allow anchors to link properly. -->
<div id = "{{person.name | replace: ' ', '-'}}" class="row" style="padding-top: 60px; margin-top: -60px;">
    <img style="float: right; width: 25%; padding-left: 20px; padding-right: 20px;" src="{{ person.image | prepend: '/assets/img/team/' | prepend: site.baseurl | prepend: site.url }}" alt="photo of {{person.name}}">
    <div>
        <h3>{{person.name}}{% if person.degrees %}, {{person.degrees}} {% endif %}</h3>
        {{person.position}} <br>
        <i class="fa fa-envelope"></i> <em>{{person.email}}</em> <br>
        {% if person.website %}
          <i class="fa fa-globe"></i> <a href= "{{person.website}}" target="_blank">{{person.website}}</a> <br>
        {% endif %}
        {% if person.github %}
          <i class="fab fa-github"></i> <a href= "https://github.com/{{person.github}}" target="_blank"> {{person.github}} </a> <br>
        {% endif %}
        {% if person.scholar %}
          <i class="ai ai-google-scholar"></i> <a href= "http://scholar.google.com/citations?user={{person.scholar}}" target="_blank"> Scholar Citations </a> <br>
        {% endif %}
        {% if person.orcid %}
          <i class="ai ai-orcid"></i> <a href="http://{{person.orcid}}" target="_blank"> {{person.orcid}}</a> <br>
        {% endif %}

    </div>
    <div class="col-sm-8">
        <p class="text-justify">{{person.description | markdownify}}</p>
    </div>

</div>
<hr>
{% endfor %}

{% if site.data.students %}

  <h2 id="students">Students</h2>
  {% for person in site.data.students %}
<div id = "{{person.name | replace: ' ', '-'}}" class="row" style="padding-top: 60px; margin-top: -60px;">
    <img style="float: right; width: 25%;  padding-left: 20px; padding-right: 20px;" src="{{ person.image | prepend: '/assets/img/team/' | prepend: site.baseurl | prepend: site.url }}" alt="photo of {{person.name}}">
    <div>
        <h3>{{person.name}}{% if person.degrees %}, {{person.degrees}} {% endif %}</h3>
        {{person.position}} <br>
        {% if person.projects %}
          Projects:
          {% for project in person.projects %}
            <a href="{{ project | prepend: '/projects/' | relative_url }}" class="btn btn-sm z-depth-0" role="button">{{ project }}</a>
          {% endfor %}
          <br>
        {% endif %}
        <i class="fa fa-envelope"></i> <em>{{person.email}}</em> <br>
        {% if person.website %}
          <i class="fa fa-globe"></i> <a href= "{{person.website}}" target="_blank">{{person.website}}</a> <br>
        {% endif %}
        {% if person.github %}
          <i class="fab fa-github"></i> <a href= "https://github.com/{{person.github}}" target="_blank"> {{person.github}} </a> <br>
        {% endif %}
        {% if person.scholar %}
          <i class="ai ai-google-scholar"></i> <a href= "http://scholar.google.com/citations?user={{person.scholar}}" target="_blank"> Scholar Citations </a> <br>
        {% endif %}
        {% if person.orcid %}
          <i class="ai ai-orcid"></i> <a href="http://{{person.orcid}}" target="_blank"> {{person.orcid}}</a> <br>
        {% endif %}

    </div>
    <div class="col-sm-8">
        <p class="text-justify">{{person.description | markdownify}}</p>
    </div>

</div>
<hr>
  {% endfor %}
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
