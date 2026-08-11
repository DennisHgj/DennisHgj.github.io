---
layout: page
title: WebUAV-3M
description: A 3.3M-frame UAV tracking benchmark with dense boxes, language specifications, audio descriptions, and diverse target categories.
importance: 1
category: engineering
img: assets/img/projects/webuav-representative-videos-preview.webp
github: https://github.com/983632847/WebUAV-3M
---

WebUAV-3M addresses the limited scale, modality coverage, and scene diversity of earlier UAV tracking datasets through a million-scale multimodal benchmark.

![Representative WebUAV-3M videos and multimodal annotations](/assets/img/projects/webuav-representative-videos-full.webp){: .img-fluid .rounded .z-depth-1 }

<p class="caption">Representative videos, target boxes, language specifications, and audio waveforms from the paper and official repository.</p>

## Core highlights

- **Million-scale coverage:** 3.3 million frames from 4,500 video sequences across 223 target categories, including buildings, vehicles, animals, people, and industrial objects.
- **Multimodal annotations:** dense boxes are complemented by natural-language specifications and audio descriptions to reduce ambiguity during occlusion, appearance changes, and long-term tracking.
- **Fine-grained evaluation:** seven scenario-constrained subsets and a unified comparison of more than 40 representative trackers.
- **Scalable construction:** a semi-automatic annotation pipeline made dense labeling at this scale practical.

I contributed as a co-first author and helped build the dataset tooling and multimodal benchmark. The work was published in IEEE Transactions on Pattern Analysis and Machine Intelligence.

- [Paper](https://arxiv.org/abs/2201.07425)
- [Code and dataset](https://github.com/983632847/WebUAV-3M)
