---
layout: page
permalink: /repositories/
title: repositories
description: Open-source research implementations, datasets, and website code.
nav: true
nav_order: 4
---

{% if site.data.repositories.github_users %}

## GitHub profile

<div class="repositories d-flex flex-wrap flex-md-row flex-column justify-content-between align-items-center">
  {% for user in site.data.repositories.github_users %}
    {% include repository/repo_user.liquid username=user %}
  {% endfor %}
</div>

{% endif %}

{% if site.data.repositories.research_repos %}

## Research and multimodal AI

<div class="repositories repository-grid">
  {% for repo in site.data.repositories.research_repos %}
    {% include repository/repo.liquid repository=repo %}
  {% endfor %}
</div>
{% endif %}

{% if site.data.repositories.software_repos %}

## Scientific software and earlier work

<div class="repositories repository-grid">
  {% for repo in site.data.repositories.software_repos %}
    {% include repository/repo.liquid repository=repo %}
  {% endfor %}
</div>
{% endif %}

The lists above prioritize research code and substantial public projects. [View all public repositories on GitHub]({{ site.data.repositories.all_repositories_url }}).
