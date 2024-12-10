---
layout: page
title: AtomicSPI
description: Learning atomic scale biomolecular dynamics from single-particle imaging data.
img: assets/img/projects/atomicspi.png
importance: 1
category: Past
related_publications: true
---

### Project Goal
The goal of the AtomicSPI project is to deliver software helping structural biologists resolve molecular conformations from single particle imaging datasets. The project work itself consists of four connected deliverables:
1. An atomic representation of the particle: A graph-based atomic model will enable the application of physics-based priors during refinement, and will be fit directly to data, rather than fitting to an intermediate reconstructed 3D map (current practice).
2. A deep learning model that maps individual particles to a continuous space of conformations and orientations: The deep learning model will capture the molecular dynamics crucial to understanding biological function in a feasible low-dimensional space. The model will provide a distribution of conformations (i.e. the energy landscape) with applications for establishing steady-state kinetic models.
3. A differentiable digital twin of the electron microscope: The simulation will map the predicted structures and orientations to the images that would be produced by the electron microscope or X-ray FEL source. Crucially, by making the simulation differentiable, it can be inverted to infer structures directly from data, proposing new structures/orientations that correspond to an experimental image.
4. A deep learning reconstruction pipeline: The pipeline will tie together the above three components to learn atomic models directly from measured datasets. By combining the three components into a single step, the proposed method will be both more efficient and more accurate than existing analysis pipelines.

### Accomplishments
We have accomplished all four deliverables above in the cryoEM setting and prototyped them in the X-ray SPI setting. As summarized in Figure 1, the work carried thanks to this LDRD belongs to a new wave of next-generation volume reconstruction algorithm development that combines generative modeling with end-to-end unsupervised deep learning techniques {% cite donnat2022deep %}.
{% include figure.liquid loading="eager" path="assets/img/publication_preview/donnat2022deep.png" title="AtomicSPI" class="img-fluid rounded z-depth-1" %}
<div class="caption">
    Comparison of generative reconstruction methods. Adapted from {% cite donnat2022deep %}. We give a quick overview of our contributions to these methods in what follows. CryoPoseNet {% cite nashed2021cryoposenet %} and CryoAI {% cite donnat2022deep %} are two methods for homogeneous reconstruction, meaning they reconstruct a unique volume from the dataset. CryoFIRE {% cite levy2022amortized %} and aNiMAte {% cite nashed2022heterogeneous %} are not shown in the figure yet and are two methods for heterogeneous reconstruction, meaning they reconstruct one volume per particle in the dataset. CryoFIRE {% cite levy2022amortized %} is a hybrid of CryoAI and CryoDRGN2, encodes both R, t and the conformation z of the particle in each image xi and learns an implicit neural network representation of the 3D volume of the molecule. aNiMAte {% cite nashed2022heterogeneous %} belongs to the same category as CryoFold from MIT and AtomVAE from Deepmind, encodes t and z of the particle in each image xi which help interpret the variability in the dataset as meaningful deformation of a reference atomistic representation of the 3D volume of the molecule. X-RAI {% cite shenoy2023scalable %}{% cite shenoy2023amortized %} is similar to cryo-AI in the X-ray setting (i.e. with a different rendering pipeline).
</div>

We illustrate in Figure 2 our main achievements.
{% include figure.liquid loading="eager" path="assets/img/projects/atomicspi.jpg" title="AtomicSPI" class="img-fluid rounded z-depth-1" %}

### Acknowledgements
This project was supported by the LDRD program at SLAC from 2021 to 2024.
