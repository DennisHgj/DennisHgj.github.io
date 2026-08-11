---
layout: page
title: Cued-Agent
permalink: /zh/projects/cued-agent/
description: 基于多智能体协作的免端到端训练自动线索语识别系统。
lang: zh
---

Cued-Agent 面向自动线索语识别中的手唇异步、训练数据不足，以及传统方法难以从音素序列生成自然语言句子等问题，将完整识别流程拆分给四个专用智能体协同完成。

![Cued-Agent 四智能体框架](/assets/img/projects/cued-agent-framework-full.webp){: .img-fluid .rounded .z-depth-1 }

<p class="caption">原论文与项目仓库中的 Cued-Agent 四智能体框架图。</p>

## 核心亮点

- **四智能体协作：** 手势识别、唇读、手势提示解码和音素到词自校正智能体覆盖多模态感知、融合和自然语言输出全过程。
- **极少训练开销：** 多模态大模型以关键帧和专家提示完成手势分类，解码阶段用手势提示动态加权唇读分数，无需新增手唇融合训练参数。
- **语言级自校正：** 大语言模型结合线索语规则，对音素序列进行多轮语法与语义修正并生成自然语言句子。
- **真实应用数据：** 构建包含多名听障者的普通话线索语数据；论文入选 ACM Multimedia 2025 口头报告并获 Student Travel Award。

[论文](https://arxiv.org/abs/2508.00391) · [代码与数据](https://github.com/DennisHgj/Cued-Agent)
