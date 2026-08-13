---
layout: about
title: about
permalink: /
subtitle: Ph.D. Candidate in Artificial Intelligence at <a href='https://www.hkust-gz.edu.cn/'>HKUST(GZ)</a>

profile:
  align: right
  image: prof_pic.jpg
  image_circular: true # crops the image to make it circular
  more_info: >
    <p>Guangzhou, China</p>
    <p><a href="mailto:ghuang565@connect.hkust-gz.edu.cn">ghuang565@connect.hkust-gz.edu.cn</a></p>

selected_papers: true # includes a list of papers marked as "selected={true}"
social: true # includes social icons at the bottom of the page

announcements:
  enabled: true # includes a list of news items
  scrollable: true # adds a vertical scroll bar if there are more than 3 news items
  limit: 5 # leave blank to include all the news in the `_news` folder

latest_posts:
  enabled: false
  scrollable: true # adds a vertical scroll bar if there are more than 3 new posts items
  limit: 3 # leave blank to include all the blog posts
---

<div class="opportunity-banner" role="note" aria-label="Employment availability">
  <i class="fa-solid fa-briefcase" aria-hidden="true"></i>
  <div>
    <strong>Open to full-time opportunities</strong>
    <span>Multimodal AI research and applied research roles</span>
  </div>
</div>

{% assign scholar_stats = site.data.citations.metadata %}
<div class="homepage-stats" aria-label="Website and research metrics">
  <div class="homepage-stat-card homepage-stat-card--visits">
    <i class="fa-solid fa-chart-line" aria-hidden="true"></i>
    <div class="homepage-stat-content">
      <span class="homepage-stat-label">Homepage visits</span>
      <img
        class="homepage-stat-badge"
        src="https://visitor-badge.laobi.icu/badge?page_id=DennisHgj.DennisHgj.github.io.home&amp;left_text=Views&amp;left_color=%23595959&amp;right_color=%23b509ac&amp;format=true&amp;height=24"
        alt="Current homepage visit count"
        height="24"
      >
      <small>Page loads since this counter was added</small>
    </div>
  </div>
  <a
    class="homepage-stat-card homepage-stat-card--scholar"
    href="https://scholar.google.com/citations?user=cH80kpEAAAAJ&amp;hl=en"
    target="_blank"
    rel="noopener noreferrer"
    aria-label="View Guanjie Huang's Google Scholar profile"
  >
    <i class="ai ai-google-scholar" aria-hidden="true"></i>
    <div class="homepage-stat-content">
      <span class="homepage-stat-label">Google Scholar citations</span>
      <strong class="homepage-stat-value">{{ scholar_stats.total_citations | default: "—" }}</strong>
      <small>
        {% if scholar_stats.last_updated %}Updated {{ scholar_stats.last_updated }}{% else %}Sync pending{% endif %}
      </small>
    </div>
    <i class="fa-solid fa-arrow-up-right-from-square homepage-stat-link-icon" aria-hidden="true"></i>
  </a>
</div>

I am a Ph.D. candidate in Artificial Intelligence at **The Hong Kong University of Science and Technology (Guangzhou)**, advised by **Prof. Li Liu** and **Prof. Danny H. K. Tsang**. My research focuses on efficient and reliable multimodal intelligence, especially audio-visual understanding, cued speech recognition, multimodal large language models, and uncertainty estimation.

My recent work studies how language models and specialized agents can reason over visual speech and hand cues, how multimodal systems can learn from limited data, and how their confidence and authenticity can be assessed. I am also interested in audio deepfake detection and physically grounded evaluation of audio-visual generation.

Before my doctoral study, I worked on industrial computer vision, large-scale multimodal dataset construction, UAV tracking, and learning-assisted optimization. I received an M.A.I. from the Australian National University and a B.Eng. in Software Engineering from the University of Electronic Science and Technology of China.

**Research interests:** audio-visual learning · multimodal large language models and agents · speech and cued speech recognition · trustworthy multimodal AI · model uncertainty · audio deepfake detection

I welcome conversations about research collaboration and multimodal AI opportunities.
