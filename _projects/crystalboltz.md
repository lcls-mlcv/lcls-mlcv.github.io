---
layout: projects
title: CrystalBoltz
description: Transforming X-ray Crystallography with Generative AI
importance: 2
category: AtomicSPI
related_publications: false
---
Despite being trained predominantly on crystal structures, protein structure prediction models cannot solve structures from crystallography experiments. The discrepancy between predicting and solving structures is rooted in the lack of experimental context for the molecule of interest. In addition, the mainstream practice of solving averaged single structures is suboptimal for emerging experiments that aim to probe the dynamic nature of proteins.

The latest generation of models, such as AlphaFold3, uses a generative approach that inherently supports modeling structural ensembles and could fundamentally transform crystallography data analysis. We propose to guide these generative models using crystallographic measurements. A scalable and efficient way to achieve the guidance is to support inference-time steering of pretrained models. A differentiable forward model computes the likelihood of experimental measurement, which is then injected into the generation process of the molecular structures during inference time. Enhanced sampling techniques can also be incorporated to further speed up the guided inference process.
