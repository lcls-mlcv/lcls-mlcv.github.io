---
layout: projects
title: BayFAI
description: Bayesian Optimization meets Fast Azimuthal Integration
img: assets/img/projects/bayfai.jpg
importance: 1
category: Automation
related_publications: false
---
BayFAI is a physics-driven detector geometry calibration framework that leverages Bayesian optimization to efficiently explore the high-dimensional geometry parameter space. Starting from a forward model of X-ray diffraction, BayFAI simulates powder diffraction patterns for candidate detector geometries and evaluates their agreement with experimental data using a robust, physics-informed scoring function. BayFAI builds on the [pyFAI library](https://github.com/silx-kit/pyFAI) developed at ESRF, which is a popular toolbox for performing Fast Azimuthal Integration (FAI) on experimental data, and 

By balancing exploration and exploitation, Bayesian optimization enables BayFAI to converge toward optimal geometry parameters with significantly fewer forward-model evaluations than traditional grid searches or manual tuning. This makes the method well suited for complex detector layouts and scenarios where prior knowledge of the geometry is incomplete or uncertain.

__Best suited for:__
- Global, end-to-end geometry refinement
- Complex detector configurations
- Cases where physical constraints and priors are important

<div style="display: flex; gap: 1rem; align-items: flex-start;">
  <figure style="flex: 1; text-align: center;">
    <img src="/assets/gif/projects/bayfai_score_map.gif" alt="BayFAI score map evolution" width="100%">
    <figcaption><b>Score map evolution</b><br>Bayesian optimization score landscape at each iteration.</figcaption>
  </figure>

  <figure style="flex: 1; text-align: center;">
    <img src="/assets/gif/projects/bayfai_rings_overlay.gif" alt="BayFAI ring overlay" width="100%">
    <figcaption><b>Simulated ring overlay</b><br>Forward-model diffraction rings overlaid on the powder image.</figcaption>
  </figure>
</div>

{% include figure.liquid path="assets/img/projects/bayfai_summary.png" title="BayFAI" caption="<b>Optimization summary</b>. From left to right, top to bottom. (a) Experiment Description and Geometry parameters with uncertainties. (b) Radial integration for the optimal geometry (peaks should match red-dashed calibrant q-values). (c) Calibration powder image overlayed with calibrant rings. (d) Histogram of pixel intensities and statistics: the purple-dashed threshold sets the lower bound for a pixel to be extracted as a Bragg peak. (e) Bayesian optimization history for the best distance. (f) Negative-Log Residual for each scanned distance at the end of the Bayesian Optimization steps. (g) Confidence-Penalized Negative-Log residual after gradient-descent geometry refinement. Green dotted points represent valid geometries whereas red dotted points are non-minimum solutions." %}

BayFAI was benchmarked against a constantly updated set of calibrant data from the MFX and CXI beamlines at LCLS. The MEC beamline is the next target! Stay tuned! 
Running BayFAI is made possible through the LUTE software package. The user documentation can be found as well as the benchmark data can be found here:
{% include repository/repo.liquid repository="lcls-mlcv/BayFAI" %}