---
layout: page
permalink: /zh/repositories/
title: 代码仓库
description: 公开的研究实现、数据集与个人主页代码。
lang: zh
---

{% if site.data.repositories.github_users %}

## GitHub 主页

<div class="repositories d-flex flex-wrap flex-md-row flex-column justify-content-between align-items-center">
  {% for user in site.data.repositories.github_users %}
    {% include repository/repo_user.liquid username=user %}
  {% endfor %}
</div>

{% endif %}

{% if site.data.repositories.research_repos %}

## 科研与多模态人工智能

<div class="repositories repository-grid">
  {% for repo in site.data.repositories.research_repos %}
    {% include repository/repo.liquid repository=repo %}
  {% endfor %}
</div>
{% endif %}

{% if site.data.repositories.software_repos %}

## 科研软件与早期项目

<div class="repositories repository-grid">
  {% for repo in site.data.repositories.software_repos %}
    {% include repository/repo.liquid repository=repo %}
  {% endfor %}
</div>
{% endif %}

以上优先展示科研代码及较完整的公开项目。[查看 GitHub 上的全部公开仓库]({{ site.data.repositories.all_repositories_url }})。
