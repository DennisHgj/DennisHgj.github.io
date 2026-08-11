---
layout: page
title: Cued-Agent
description: Four specialized agents connect hand-cue recognition, lip reading, prompt-based decoding, and language-level self-correction.
importance: 1
category: research
img: assets/img/projects/cued-agent-framework-preview.webp
github: https://github.com/DennisHgj/Cued-Agent
---

Cued-Agent addresses hand-lip asynchrony, limited training data, and the gap between phoneme recognition and natural-language output by dividing the full automatic cued speech recognition pipeline among four specialized agents.

![Cued-Agent four-agent framework](/assets/img/projects/cued-agent-framework-full.webp){: .img-fluid .rounded .z-depth-1 }

<p class="caption">The four-agent framework from the paper and official project repository.</p>

## Core highlights

- **Four-agent collaboration:** hand recognition, lip recognition, hand-prompt decoding, and phoneme-to-word self-correction cover perception, multimodal fusion, and language generation.
- **Minimal training overhead:** an MLLM recognizes hand cues from selected keyframes, while parameter-free score fusion injects the cues into lip-reading decoding.
- **Language-level correction:** an LLM uses cued-speech rules to refine phoneme sequences and produce natural sentences.
- **Real-world data:** the project includes a Mandarin cued speech dataset collected with speakers who have hearing impairment. The paper was selected for an ACM Multimedia 2025 oral presentation and received a Student Travel Award.

- [Paper](https://arxiv.org/abs/2508.00391)
- [Code and data](https://github.com/DennisHgj/Cued-Agent)
