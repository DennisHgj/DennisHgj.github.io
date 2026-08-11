---
layout: page
title: Semantic Modulated Prompting
permalink: /zh/projects/semantic-modulated-prompting/
description: 面向小样本音视频分类的参数高效语义提示框架。
lang: zh
---

Semantic Modulated Prompting（SMP）针对小样本音视频分类中的模型过拟合、音视频时序异步和模态失衡，引入文本语义提示帮助模型定位关键片段、完成跨模态对齐并动态校准各模态的学习状态。

![Semantic Modulated Prompting 框架](/assets/img/projects/semantic-modulated-prompting-framework-full.png){: .img-fluid .rounded .z-depth-1 }

<p class="caption">已发表论文中的 Figure 2：P-AVeL 负责提示引导的音视频融合，P-PR 调整模态原型并优化决策边界。</p>

## 核心亮点

- **提示优化的高效学习器：** 基于 Adapter 构建参数高效模块，用提示引导的潜在注意力从冗长、异步的音视频序列中定位关键 token。
- **提示调整的原型正则：** 以语义中心持续校准音频与视觉原型，并根据模态学习状态动态重平衡。
- **针对三个关键难点的一体化设计：** 在少量标注下同时缓解过拟合、异步融合与模态偏置，实验中稳定优于已有多模态小样本方法。

[论文](https://doi.org/10.1109/TASLPRO.2026.3654246) · [代码](https://github.com/DennisHgj/SMP_FSAVC)
