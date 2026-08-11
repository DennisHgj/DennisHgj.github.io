---
layout: page
title: WebUAV-3M
permalink: /zh/projects/webuav-3m/
description: 百万级多模态无人机目标跟踪数据集与评测基准。
lang: zh
---

WebUAV-3M 面向既有无人机跟踪数据规模有限、模态单一和场景覆盖不足的问题，构建大规模、类别丰富并带有语言与音频信息的多模态跟踪基准。

![WebUAV-3M 代表性视频与多模态标注](/assets/img/projects/webuav-representative-videos-full.webp){: .img-fluid .rounded .z-depth-1 }

<p class="caption">WebUAV-3M 原论文与项目仓库中的代表性视频、目标框、语言规范和音频波形。</p>

## 核心亮点

- **百万级规模：** 包含 330 万帧、4500 个视频序列和 223 个目标类别，覆盖建筑、交通工具、动物、人物等多类无人机视角目标。
- **多模态标注：** 除密集边界框外，还提供自然语言规范与音频描述，用高层语义帮助处理遮挡、外观变化和长时跟踪歧义。
- **系统评测：** 构建七个场景约束子测试集，并对 40 余种代表性跟踪算法进行统一评测与分析。
- **工程贡献：** 设计可扩展的半自动标注流水线以支撑百万级数据构建；论文发表于 IEEE TPAMI，本人为共同第一作者。

[论文](https://arxiv.org/abs/2201.07425) · [代码与数据集](https://github.com/983632847/WebUAV-3M)
