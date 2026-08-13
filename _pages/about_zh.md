---
layout: about
title: 首页
permalink: /zh/
lang: zh
subtitle: 香港科技大学（广州）人工智能博士研究生

profile:
  align: right
  image: prof_pic.jpg
  image_circular: true
  more_info: >
    <p>中国，广州</p>
    <p><a href="mailto:ghuang565@connect.hkust-gz.edu.cn">ghuang565@connect.hkust-gz.edu.cn</a></p>

selected_papers: false
social: true

announcements:
  enabled: false

latest_posts:
  enabled: false
---

<div class="opportunity-banner" role="note" aria-label="求职状态">
  <i class="fa-solid fa-briefcase" aria-hidden="true"></i>
  <div>
    <strong>正在寻找全职机会</strong>
    <span>目标方向：多模态人工智能研究与应用研究</span>
  </div>
</div>

我是香港科技大学（广州）人工智能方向博士研究生，导师为 **刘李教授（Prof. Li Liu）** 和 **曾宪国教授（Prof. Danny H. K. Tsang）**。我的研究聚焦高效、可靠的多模态智能，主要包括音视频理解、自动线索语识别、多模态大模型与智能体，以及模型不确定性。

近期工作探索如何让大语言模型与专用智能体协同理解视觉语音和手势线索，如何在标注样本有限时高效学习多模态表示，以及如何评估模型的置信度与生成内容真实性。我也关注音频伪造检测和具有物理规律约束的音视频生成评测。

博士阶段之前，我曾从事工业计算机视觉、大规模多模态数据集构建、无人机目标跟踪和学习辅助优化研究。我拥有澳大利亚国立大学人工智能硕士学位和电子科技大学软件工程学士学位。

**研究方向：** 音视频学习 · 多模态大模型与智能体 · 语音及线索语识别 · 可信多模态人工智能 · 模型不确定性 · 音频伪造检测

欢迎就科研合作、多模态人工智能及相关工作机会与我交流。

## [近期动态](/zh/news/)

<div class="news">
  <div class="table-responsive">
    <table class="table table-sm table-borderless">
      <tr>
        <th scope="row" style="width: 20%">2026-05-06</th>
        <td>在 ICASSP 2026 展示半免训练自动线索语识别工作 <strong>STF-ACSR</strong>。<a href="https://arxiv.org/abs/2503.21785">论文</a> · <a href="https://github.com/DennisHgj/STF_ACSR">代码</a></td>
      </tr>
      <tr>
        <th scope="row" style="width: 20%">2026-01-14</th>
        <td><strong>Semantic Modulated Prompting for Few-Shot Audio-Visual Classification</strong> 发表于 IEEE/ACM TASLP。<a href="https://doi.org/10.1109/TASLPRO.2026.3654246">论文</a></td>
      </tr>
      <tr>
        <th scope="row" style="width: 20%">2025-08-01</th>
        <td><strong>Cued-Agent</strong> 入选 ACM Multimedia 2025 口头报告，并获得 Student Travel Award。<a href="https://arxiv.org/abs/2508.00391">论文</a> · <a href="https://github.com/DennisHgj/Cued-Agent">代码</a></td>
      </tr>
    </table>
  </div>
</div>

## [代表性论文](/zh/publications/)

{% include selected_papers.liquid %}

{% assign scholar_stats = site.data.citations.metadata %}
<div class="homepage-stats" aria-label="网站与学术指标">
  <span class="homepage-stat-item">
    <i class="fa-regular fa-eye" aria-hidden="true"></i>
    <img
      class="homepage-stat-badge"
      src="https://visitor-badge.laobi.icu/badge?page_id=DennisHgj.DennisHgj.github.io.home&amp;left_text=%E8%AE%BF%E9%97%AE&amp;left_color=%236c757d&amp;right_color=%23868e96&amp;format=true&amp;height=18"
      alt="当前主页访问量"
      height="18"
    >
  </span>
  <a
    class="homepage-stat-item"
    href="https://scholar.google.com/citations?user=cH80kpEAAAAJ&amp;hl=zh-CN"
    target="_blank"
    rel="noopener noreferrer"
    aria-label="查看黄冠杰的 Google Scholar 主页"
  >
    <i class="ai ai-google-scholar" aria-hidden="true"></i>
    <span>Google Scholar 引用：<strong>{{ scholar_stats.total_citations | default: "—" }}</strong></span>
  </a>
</div>
