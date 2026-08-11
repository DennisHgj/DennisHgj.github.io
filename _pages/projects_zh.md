---
layout: page
title: 项目
permalink: /zh/projects/
description: 音视频智能、多模态智能体、模型可靠性与大规模数据集方向的代表项目。
lang: zh
---

<div class="projects">
  {% assign research_projects = site.data.projects_zh | where: "category", "research" | sort: "importance" %}
  <h2 class="category">研究</h2>
  <div class="container">
    <div class="row row-cols-1 row-cols-md-2">
      {% for item in research_projects %}
        {% assign project = item %}
        {% include projects_horizontal.liquid %}
      {% endfor %}
    </div>
  </div>

{% assign benchmark_projects = site.data.projects_zh | where: "category", "benchmark" | sort: "importance" %}
  <h2 class="category">评测基准</h2>
  <div class="container">
    <div class="row row-cols-1 row-cols-md-2">
      {% for item in benchmark_projects %}
        {% assign project = item %}
        {% include projects_horizontal.liquid %}
      {% endfor %}
    </div>
  </div>

{% assign engineering_projects = site.data.projects_zh | where: "category", "engineering" | sort: "importance" %}
  <h2 class="category">工程与数据</h2>
  <div class="container">
    <div class="row row-cols-1 row-cols-md-2">
      {% for item in engineering_projects %}
        {% assign project = item %}
        {% include projects_horizontal.liquid %}
      {% endfor %}
    </div>
  </div>
</div>
