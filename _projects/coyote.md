---
layout: projects
title: Coyote Protector
description: Crystal Detection for Beamline Protection
img: assets/img/projects/coyote_intro.png
importance: 1
category: Automation
related_publications: false
---
Coyote is a fast and reliable system for crystal diffraction during X-ray experiments at the LCLS beamline. It allows to scan a chip containing many crystals, by moving it to specific positions in front of the pulsed (120 Hz) X-ray beam. However, high-energy scattering of wide crystals can damage the detector, motivating the need for a crystal detection algorithm.

The current decision pipeline follows three main steps:

1. Pre-scan the chip and acquire image data.
2. Analyze the images with deep-learning models.
3. Determine crystal positions and sizes and use them to guide beamline actions.

The detection stack (2.) is based on YOLO models, and the system is deployed on SLAC infrastructure with GPU acceleration for low-latency operation.

The contribution of the MLCV team focuses on crystal avoidance: when the size of a crystal is above a threshold, the detection algorithm flags it to avoid it, hence reducing risk during high-power shots and protect beamline hardware.

### Detection Algorithm
## Intro 
The YOLO (You Only Look Once) approach is used, leveraging the yolo model availalble in the Ultralytics library, the algorithms outputs, for each crystal detected : 
- crystal class (from 1 to n, n being the total number of classes)
- width and height (in pixel units)
- centroid position (x_0, y_0 in cartesian coordinates)
- confidence (CNN output confidence)
## Lbelling and training
YOLO is a deep learning model using a supervised training approach. This requires labelled data. The data used have been collected at MFX SLAC in January 2026, then labelled using LabelMe GUI.
The model is then trained on CPUs using the defaults optimizers. The  two main variables are :
- Number of epochs : set to reach a clear convergence and to prevent overfitting.
- Model choice : we focused on YOLOv8 and YOLOv11, best suited for our task.
- Model size : range from n (nano) to xl (extra large) : theoritcally, given a suffisiant amount of training data, the bigger, the better but the more latency. Low latency being a main contrains, nano models were used.

## Results and output
<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/projects/abismal.png" title="ABISMAL" class="img-fluid rounded z-depth-1" caption="Graphical representation of the ABISMAL model." %}
    </div>
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/projects/abismal2.png" title="ABISMAL" class="img-fluid rounded z-depth-1" caption="Schematic representation of the ABISMAL implementation." %}
    </div>
</div>
## Performance (to be updated)

- Inference time per frame: TBD ms
- End-to-end decision latency: TBD ms
- Crystal localization accuracy: TBD
- Crystal-avoidance precision/recall: TBD
- Validation dataset and beamtime conditions: TBD


### Challenges

The YOLO approach is a supervised learning approach, which means that the quality of the prediction of the algorithm strongly depend on the quality of the training data and labels. The labelling has been done using the GUI Labelme.


### Future Work

This pipeline has been designed given the actual facility constrains. However, a live inference could also be possible.
IOC etc

### GitHub Repository
{% include repository/repo.liquid repository="lcls-mlcv/coyote_protector" %}


