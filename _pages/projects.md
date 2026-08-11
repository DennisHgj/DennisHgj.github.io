---
layout: page
title: projects
permalink: /projects/
description: Selected research projects in audio-visual intelligence, multimodal agents, model reliability, and large-scale datasets.
nav: true
nav_order: 3
display_categories: [research, benchmark]
---

<div class="projects">
  {% for category in page.display_categories %}
    {% assign categorized_projects = site.projects | where: "category", category | sort: "importance" %}
    {% if categorized_projects.size > 0 %}
      <a id="{{ category }}" href=".#{{ category }}">
        <h2 class="category">{{ category | capitalize }}</h2>
      </a>
      <div class="container">
        <div class="row portfolio-project-grid">
          {% for project in categorized_projects %}
            <div class="col mb-4 portfolio-project-column">
              <div class="card h-100 hoverable portfolio-project-card">
                <a class="project-card-main" href="{{ project.url | relative_url }}">
                  <div class="project-card-image-shell">
                    <img
                      class="project-card-image"
                      src="{{ project.img | relative_url }}"
                      alt="{{ project.title }} project thumbnail"
                      loading="lazy"
                    >
                  </div>
                  <div class="card-body">
                    <h3 class="card-title">{{ project.title }}</h3>
                    <p class="card-text">{{ project.description }}</p>
                  </div>
                </a>
                <div class="project-card-footer">
                  {% if project.github %}
                    <a class="project-card-action" href="{{ project.github }}" target="_blank" rel="noopener" aria-label="{{ project.title }} code repository">
                      <i class="fa-brands fa-github" aria-hidden="true"></i><span>Code</span>
                    </a>
                  {% else %}
                    <a class="project-card-action" href="{{ project.url | relative_url }}">
                      <i class="fa-solid fa-arrow-right" aria-hidden="true"></i><span>Details</span>
                    </a>
                  {% endif %}
                </div>
              </div>
            </div>
          {% endfor %}
        </div>
      </div>
    {% endif %}
  {% endfor %}
</div>
