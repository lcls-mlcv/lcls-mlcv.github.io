---
layout: projects
title: BayFAI
description: Bayesian Optimization of Detector Geometry meets Fast Azimuthal Integration
img: assets/img/projects/bayfai.jpg
importance: 1
category: Automation
related_publications: false
---
BayFAI is a robust and efficient method for optimizing the geometry of X-ray detectors against calibrant data. It leverages Bayesian optimization to find the optimal detector geometry, which is then used to perform Fast Azimuthal Integration (FAI) on experimental data. BayFAI builds on the [pyFAI library](https://github.com/silx-kit/pyFAI) developed at ESRF, which is a popular tool for performing FAI on experimental data.

BayFAI can be decomposed in six steps:

1. Fabricate the powder image from experimental data and build the detector pixel layout by using the metrology $(x, y, z)_{|det}$.
2. Parallel scan over distances for more robustness.
3. Run Bayesian Optimization minimizing this black-box cost function:
    1. For a given set of geometry parameters $(L, p_x, p_y, \alpha, \beta, \gamma)$, compute the pixel coordinates relative to the Interaction Point (IP) $(x, y, z)_{|IP}$.
    2. Calculate pixel diffraction angle $2{\theta}_g$.
    3. For each $2{\theta}_c$ tabulated in the calibrant data, extract Bragg peaks defined as $2{\theta}_g$ local maxima in intensity in the powder image.
    4. Compute cost function: Mean Squared Error of the $2{\theta}$ diffraction angles.
4. Refine estimated optimum geometry by running Gradient-Descent around.
5. Discard non-minimum solution.
6. Pick lowest MSE geometry among valid solutions!


{% include figure.liquid path="assets/img/projects/bayfai_summary_mfxl1038923_r0133.png" title="BayFAI" caption="<b>Optimization summary</b>. From left to right, top to bottom. (a) Experiment Description and Geometry parameters with uncertainties. (b) Radial integration for the optimal geometry (peaks should match red-dashed calibrant q-values). (c) Calibration powder image in laboratory frame overlayed with calibrant rings. (d) Histogram of pixel intensities and statistics: pixel intensities above the purple-dashed threshold are considered key pixels providing ground for optimization. (e) Bayesian optimization history for the best distance. (f) Negative Residual for each scanned distance at the end of the Bayesian Optimization steps. (g) Final residual after gradient-descent geometry refinement. Green dotted points represent valid geometries whereas red dotted points are non-minimum solutions." %}

The method is benchmarked against a constantly updated set of calibrant data from the MFX and CXI beamlines at LCLS. The MEC beamline is the next target! Stay tuned! 
<!-- TODO: add link to the benchmark -->

The method is available through the LUTE software package. The user documentation can be found [here](https://github.com/lcls-mlcv/BayFAI).
<!-- describe usage -->
