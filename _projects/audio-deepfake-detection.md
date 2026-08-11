---
layout: page
title: "GLAD: Audio Deepfake Detection"
description: Global-local SSL features, sample-adaptive gating, and SaniBoost improve detection under unseen attacks and domain shifts.
importance: 4
category: research
img: assets/img/projects/audio-deepfake-glad-framework-full.png
---

GLAD (Global-Local Adaptive Detector) studies speech deepfake detection under unseen attacks and domain shifts, where static feature selection, global-semantic bias, and environment-specific shortcuts often fail to generalize.

![GLAD speech deepfake detection framework](/assets/img/projects/audio-deepfake-glad-framework-full.png){: .img-fluid .rounded .z-depth-1 }

<p class="caption">Figure 3 from the manuscript: SaniBoost, the Hierarchical Global-Local backbone, and Hierarchical Adaptive Gating form the complete GLAD pipeline.</p>

## Core highlights

- **Hierarchical global-local encoding:** semantic-acoustic cross-attention combines dual-stream self-supervised features, while multi-granularity fusion connects global temporal context with local CNN traces.
- **Sample-adaptive gating:** dynamically reweights multiple SSL layers and heterogeneous backbones according to the evidence in each attack sample.
- **SaniBoost augmentation:** noise sanitization and signal normalization reduce shortcut learning from environmental artifacts.

The resulting system placed fourth in the Efficient Speech Deepfake Detection Challenge 2 at IEEE ICME 2026.
