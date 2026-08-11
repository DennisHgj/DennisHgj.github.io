---
layout: page
title: GLAD 音频伪造检测
permalink: /zh/projects/audio-deepfake-detection/
description: 基于全局-局部自监督表征与自适应门控的跨域音频伪造检测。
lang: zh
---

GLAD（Global-Local Adaptive Detector）面向未知攻击和跨域环境下语音伪造检测泛化不足的问题，联合高层语义、底层局部伪造痕迹和样本级动态模型选择。

![GLAD 语音伪造检测框架](/assets/img/projects/audio-deepfake-glad-framework-full.png){: .img-fluid .rounded .z-depth-1 }

<p class="caption">原稿 Figure 3：SaniBoost、层次化全局-局部骨干和层次自适应门控构成完整 GLAD 流程。</p>

## 核心亮点

- **层次化全局-局部编码：** 以语义-声学交叉注意力协同建模双流自监督特征，并融合全局时序线索与局部 CNN 痕迹。
- **样本级自适应门控：** 根据不同攻击样本动态重加权多个自监督层和异构骨干，减少域相关干扰。
- **SaniBoost 数据增强：** 结合噪声净化与信号归一化，降低模型依赖环境噪声捷径的风险。
- **挑战赛验证：** 获 ICME ESDD2 2026 环境音频伪造检测挑战赛第 4 名。
