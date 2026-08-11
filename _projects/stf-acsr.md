---
layout: page
title: STF-ACSR
description: An MLLM recognizes informative hand cues without task-specific training, and a single linear layer injects them into a lip-reading model.
importance: 2
category: research
img: assets/img/projects/stf-acsr-framework-preview.webp
github: https://github.com/DennisHgj/STF_ACSR
---

STF-ACSR reframes continuous hand modeling as a zero-shot MLLM classification task, then uses minimalist fusion to prompt a pretrained lip-reading model. This design reduces overfitting in low-data automatic cued speech recognition.

![STF-ACSR framework](/assets/img/projects/stf-acsr-framework-full.webp){: .img-fluid .rounded .z-depth-1 }

<p class="caption">The STF-ACSR framework from the paper and official project repository.</p>

## Core highlights

- **Training-free hand prompting:** a motion-based filter selects keyframes, while background, multimodal context, contrastive, and reasoning prompts activate the MLLM's hand-cue recognition ability.
- **Minimalist fusion:** recognized cues are converted into an embedding matrix, aligned by one linear layer, and added to lip features as prompts.
- **Designed for scarce data:** the method avoids training a complex temporal hand model or a large fusion network while preserving complementary hand and lip information.

The work was accepted at ICASSP 2026.

- [Paper](https://arxiv.org/abs/2503.21785)
- [Code](https://github.com/DennisHgj/STF_ACSR)
