---
layout: page
title: PhyAVBench
permalink: /zh/projects/phyavbench/
description: 面向文本到音视频生成的声学物理规律评测基准。
lang: zh
---

PhyAVBench 不只检查音视频同步，还评估生成模型是否理解声音产生与传播背后的物理机制。基准通过成对提示只改变一个受控物理变量，再观察生成音频是否作出正确响应。

![PhyAVBench 模型物理能力对比](/assets/img/projects/phyavbench-radar-full.webp){: .img-fluid .rounded .z-depth-1 }

<p class="caption">PhyAVBench 原项目给出的不同生成模型在六类声学物理维度上的对比。</p>

## 核心亮点

- **Audio-Physics Sensitivity Test：** 用受控成对提示区分“画面听起来合理”和“声音随物理条件正确变化”这两种能力。
- **覆盖六类物理维度：** 包括声源机制、流体与空气动力学、传播环境、观察者因素、时间因果和复杂耦合。
- **真实数据支撑：** 最新公开版本基于 PhyAV-Sound-11K，包含 11,605 个视频、25.5 小时音视频和 184 名参与者，并评估 17 个代表性模型。

[项目主页](https://imxtx.github.io/PhyAVBench/) · [论文](https://arxiv.org/abs/2512.23994) · [代码与基准](https://github.com/imxtx/PhyAVBench)
