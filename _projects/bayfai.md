---
layout: projects
title: BayFAI
description: Bayesian Optimization of Detector Geometry meets Fast Azimuthal Integration
img: assets/img/projects/bayfai.jpg
importance: 1
category: Ongoing
related_publications: false
---
BayFAI is a robust and efficient method for optimizing the geometry of X-ray detectors against calibrant data. It leverages Bayesian optimization to find the optimal detector geometry, which is then used to perform Fast Azimuthal Integration (FAI) on experimental data. BayFAI builds on the [pyFAI library](https://github.com/silx-kit/pyFAI) developed at ESRF, which is a popular tool for performing FAI on experimental data.

*More details coming soon*


{% include figure.liquid path="assets/img/projects/bayfai_mfxl1038923.jpg" title="BayFAI" caption="Bayesian Optimization meets Fast Azimuthal Integration" %}

The method is benchmarked against a constantly updated set of calibrant data from the MFX beamline at LCLS.
<!-- TODO: add link to the benchmark -->

The method is available through the LUTE software package.
<!-- describe usage -->
