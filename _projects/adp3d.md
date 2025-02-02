---
layout: projects
title: ADP-3D
description: Solving Inverse Problems in Protein Space using Diffusion-Based Priors
img: assets/img/publication_preview/levy2024solving.jpg
importance: 2
category: AtomicSPI
related_publications: true
---
ADP-3D (Atomic Denoising Prior for 3D reconstruction) is a framework that conditions a diffusion model in protein space with any observations for which the measurement process can be physically modeled. Inspired from plug-n-play, ADP-3D demonstrates versatility in solving inverse problems in protein space with a pretrained diffusion model as a learned prior. It outperforms existing posterior sampling methods at reconstructing full protein structures from partial structures. It shows that a protein diffusion model can be guided to perform atomic model refinement in simulated cryo-EM density maps and that it can be conditioned on a sparse distance matrix. For more details, please read the preprint {% cite levy2024solving %} and visit the [project page](https://axel-levy.github.io/adp-3d/).

### GitHub Repository
{% include repository/repo.liquid repository="axel-levy/axlevy-adp-3d" %}
