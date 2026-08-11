---
layout: page
title: Evidential Uncertainty for In-Context Learning
description: Single-pass, query-level evidential uncertainty reduces prompt dependence and the token cost of reliable in-context learning.
importance: 5
category: research
img: assets/img/projects/evidential-uncertainty-framework-full.png
---

This project addresses uncertainty estimates that depend heavily on prompt wording, demonstration sampling, or repeated generation. E-UQ freezes the language model and maps a test query's hidden representation to a Dirichlet distribution over class probabilities.

![E-UQ query-only evidential uncertainty framework](/assets/img/projects/evidential-uncertainty-framework-full.png){: .img-fluid .rounded .z-depth-1 }

<p class="caption">Figure 3 from the manuscript: E-UQ-T learns a lightweight evidential head, while E-UQ-TF constructs few-shot class prototypes; both output a Dirichlet distribution for prediction and uncertainty decomposition.</p>

## Core highlights

- **One forward pass per query:** produces the prediction, aleatoric uncertainty, and epistemic uncertainty without demonstrations, repeated sampling, beam search, or semantic clustering at inference time.
- **Two deployment modes:** E-UQ-T trains a lightweight evidential head, while E-UQ-TF constructs class prototypes from a small support set without training the language model.
- **Reliability and efficiency:** evaluated on five text-classification datasets across several LLaMA and Qwen model sizes, including misclassification detection, prompt perturbations, and out-of-distribution tests.

In the evaluated setting, query-level inference reduced average input-token consumption by approximately 96.7%.
