---
layout: projects
title: autoGeo
description: Towards an Automated Detector Geometry Calibration
img: assets/img/projects/geometry_calibration.jpg
subprojects: ["BayFAI", "ConiCal", "PyPCA"]
importance: 1
category: Automation
related_publications: false
---

### Project Goal

The motivation behind automating the detector geometry calibration pipeline arises from the critical need for precise detector alignment in X-ray diffraction experiments. Accurate geometry calibration is essential for reliable data interpretation, as even small misalignments can propagate into significant downstream errors. Traditionally, detector calibration relies on laborious manual trial-and-error fitting, which are time-consuming and susceptible to human bias. As experimental setups become increasingly complex and costly, there is a strong demand for automated, faster, and robust calibration solutions.

This project addresses these challenges by developing an automated detector geometry calibration framework that combines advanced optimization strategies with intelligent denoising techniques. By integrating these tools into the LCLS LUTE environment, autoGeo enables the streamlining of experimental workflows, allowing scientists to focus on the experiment itself rather than wasting time on routine calibration tasks. Ultimately, this work aims to enable reproducible, high-throughput geometry calibration for modern X-ray experiments.

To solve for detector geometries, two complementary workflows are explored:

1. Physics-based forward modeling with iterative optimization
In this approach, X-ray diffraction patterns are simulated using a parameterized detector geometry model. An optimization loop then iteratively updates the geometry parameters to minimize the residual between simulated and measured diffraction patterns. This method directly incorporates physical constraints and experimental knowledge, making it well suited for global, end-to-end geometry refinement.

2. Computer vision–driven feature extraction followed by geometric fitting
This workflow treats diffraction images as visual data, using computer vision techniques to identify salient features such as diffraction rings. These extracted features are then used to analytically fit the detector geometry by solving for the underlying conic parameters. By decoupling feature detection from geometry fitting, this approach has the advantage to be way faster but at the cost of robustness.

Within autoGeo, BayFAI implements the first strategy using Bayesian optimization combined with a physics-informed scoring function, while ConiCal follows the second strategy by applying RANSAC-based ring detection and fitting detector geometries from conic representations.

### Limitations

The performance of both approaches is strongly dependent on powder image quality. Artifacts such as high-intensity backgrounds, detector noise, or parasitic scattering can bias the optimization process and degrade feature extraction. To mitigate these effects, future work aims to integrate intelligent denoising and background suppression techniques—leveraging PyPCA—as a preprocessing step prior to geometry optimization.

### AutoGeo Projects 
For a deeper dive into the autoGeo projects, check out their individual pages:
<div class="projects">
  <div class="row row-cols-1 row-cols-md-3">
  {% for project in site.projects %}
    {% if page.subprojects contains project.title %}
      {% include projects.liquid %}
    {% endif %}
  {% endfor %}
  </div>
</div>