---
layout: page
title: Semantic Modulated Prompting
description: Semantic prompts align asynchronous audio-visual evidence and dynamically rebalance weak modalities in few-shot learning.
importance: 3
category: research
img: assets/img/projects/semantic-modulated-prompting-framework-full.png
github: https://github.com/DennisHgj/SMP_FSAVC
---

Semantic Modulated Prompting (SMP) targets the three central difficulties of few-shot audio-visual classification: overfitting, asynchronous audio-video fusion, and modality imbalance. Textual semantics guide the model toward informative segments and provide a stable reference for cross-modal learning.

![Semantic Modulated Prompting framework](/assets/img/projects/semantic-modulated-prompting-framework-full.png){: .img-fluid .rounded .z-depth-1 }

<p class="caption">Figure 2 from the published paper: P-AVeL performs prompt-guided audio-visual fusion, while P-PR tunes modality prototypes and the decision boundary.</p>

## Core highlights

- **Prompt-refined efficient learning:** adapter-based modules use prompt-guided latent attention to locate informative tokens in long, asynchronous audio and video sequences.
- **Prompt-tuned prototype regularization:** semantic centers continuously calibrate audio and visual prototypes and dynamically rebalance the two modalities.
- **One framework for three failure modes:** the design jointly addresses limited labels, temporal misalignment, and modality bias while remaining parameter-efficient.

The work was published in IEEE/ACM Transactions on Audio, Speech, and Language Processing in 2026.

- [Publication](https://doi.org/10.1109/TASLPRO.2026.3654246)
- [Code](https://github.com/DennisHgj/SMP_FSAVC)
