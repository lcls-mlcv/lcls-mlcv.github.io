---
layout: projects
title: Coyote Protector
description: Real-Time Crystal Detection for Beamline Protection
img: assets/img/projects/coyote_intro.png
importance: 1
category: Automation
related_publications: false
---
Coyote is a fast and reliable system for real-time crystal detection during X-ray experiments at the LCLS beamline.
It leverages state-of-the-art deep learning models, YOLO, optimized through ONNX Runtime, to predict crystal positions within few milliseconds.
These predictions are then used to trigger beamline protection mechanisms and prevent hardware damage during high-power X-ray shots.
Coyote builds on the LCLS/SLAC imaging pipeline, integrating seamlessly with existing detector data streams, and provides a robust foundation for automated safety monitoring in demanding experimental environments.

*More details coming soon*

### GitHub Repository
{% include repository/repo.liquid repository="lcls-mlcv/coyote_protector" %}


