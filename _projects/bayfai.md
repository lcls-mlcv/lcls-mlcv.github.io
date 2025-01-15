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


{% include figure.liquid path="assets/img/projects/bayfai_mfxl1038923.jpg" title="BayFAI" caption="<b>Optimization summary</b>. From left to right, top to bottom. (a) Bayesian optimization score convergence plot. (b) Histogram of Pixel intensities and statistics: pixel intensity above the purple-dashed threshold are considered key data (control point) providing ground for optimization. (c) Radial integration given the optimized geometry. (d) Calibration powder plot in laboratory frame with resulting calibrant data fit. (e) Bayesian optimization best score found for each scanned distance. (f) Least-square residuals of calibrant data to control point data found for each scanned distance. BayFAI scans a range of detector-sample distances. For each distance, BayFAI launches a bayesian optimization to find the beam center quantified by the highest number of control points extracted. Then, a least-square method scores the distance - beam center association. The residuals' minimum gives the optimal distance - beam center." %}

The method is benchmarked against a constantly updated set of calibrant data from the MFX beamline at LCLS.
<!-- TODO: add link to the benchmark -->

The method is available through the LUTE software package.
<!-- describe usage -->
