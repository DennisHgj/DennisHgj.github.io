---
layout: page
title: PhyAVBench
description: Controlled prompt pairs test whether generated sound changes correctly when one underlying physical condition changes.
importance: 1
category: benchmark
img: assets/img/projects/phyavbench-radar-preview.webp
github: https://github.com/imxtx/PhyAVBench
---

PhyAVBench goes beyond audio-video synchronization to ask whether a generation model understands the physical mechanisms that produce and propagate sound. It changes one controlled physical variable in a prompt pair, then measures whether the generated audio responds in the correct direction.

![PhyAVBench physical capability comparison](/assets/img/projects/phyavbench-radar-full.webp){: .img-fluid .rounded .z-depth-1 }

<p class="caption">Comparison of generation models across six audio-physics dimensions, from the official PhyAVBench project.</p>

## Core highlights

- **Audio-Physics Sensitivity Test:** separates superficial plausibility from a model's ability to react correctly to controlled acoustic changes.
- **Six physical dimensions:** covers sound-source mechanics, fluid and aerodynamic effects, propagation environments, observer physics, time and causality, and complex coupling.
- **Grounded in newly collected data:** the current public release builds on PhyAV-Sound-11K, with 11,605 videos, 25.5 hours of audio-video, and 184 participants, and evaluates 17 representative models.

I contributed as a core author. The work was selected for an oral presentation at ACM Multimedia 2026.

- [Project page](https://imxtx.github.io/PhyAVBench/)
- [Paper](https://arxiv.org/abs/2512.23994)
- [Code and benchmark](https://github.com/imxtx/PhyAVBench)
