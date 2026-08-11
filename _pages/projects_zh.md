---
layout: page
title: 项目
permalink: /zh/projects/
description: 音视频智能、多模态智能体、模型可靠性与大规模数据集方向的代表项目。
lang: zh
---

<div class="projects">
  {% assign category_keys = "research,benchmark" | split: "," %}
  {% assign category_titles = "研究,评测基准" | split: "," %}
  {% for category in category_keys %}
    {% assign categorized_projects = site.data.projects_zh | where: "category", category | sort: "importance" %}
    {% if categorized_projects.size > 0 %}
      <h2 class="category">{{ category_titles[forloop.index0] }}</h2>
      <div class="container">
        <div class="row portfolio-project-grid">
          {% for project in categorized_projects %}
            <div class="col mb-4 portfolio-project-column">
              <div class="card h-100 hoverable portfolio-project-card">
                <a class="project-card-main" href="{{ project.url }}">
                  <div class="project-card-image-shell">
                    <img class="project-card-image" src="{{ project.img | relative_url }}" alt="{{ project.title }} 项目缩略图" loading="lazy">
                  </div>
                  <div class="card-body">
                    <h3 class="card-title">{{ project.title }}</h3>
                    <p class="card-text">{{ project.description }}</p>
                  </div>
                </a>
                <div class="project-card-footer">
                  {% if project.github %}
                    <a class="project-card-action" href="{{ project.github }}" target="_blank" rel="noopener" aria-label="{{ project.title }} 代码仓库">
                      <i class="fa-brands fa-github" aria-hidden="true"></i><span>代码</span>
                    </a>
                  {% else %}
                    <a class="project-card-action" href="{{ project.url }}">
                      <i class="fa-solid fa-arrow-right" aria-hidden="true"></i><span>项目详情</span>
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
