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

## 精选代码仓库

<div class="repositories repository-grid">
  {% for repo in site.data.repositories.research_repos %}
    {% include repository/repo.liquid repository=repo %}
  {% endfor %}
</div>
{% endif %}

这里只展示由我本人 GitHub 账号维护、且与近期研究或本站直接相关的仓库。[查看 GitHub 上的全部公开仓库]({{ site.data.repositories.all_repositories_url }})。
