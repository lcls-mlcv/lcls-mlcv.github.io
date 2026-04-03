---
layout: projects
title: Coyote Protector
description: Crystal Detection for Beamline Protection
img: assets/img/projects/coyote_intro.png
importance: 1
category: Automation
related_publications: false
---
Coyote is a system for crystal detection during serial crystallography experiments at the LCLS beamline. It coordinates the full scanning workflow: a chip containing many crystals is moved to specific positions in front of the pulsed (120 Hz) X-ray beam. However, high-energy scattering from large crystals can damage the detector, motivating the need for an automated crystal detection algorithm.

The decision pipeline follows three main steps:

1. Pre-scan the chip and acquire image data.
2. Analyze the images with deep-learning models to determine crystal positions and sizes.
3. Adapt the pulse picker sequence to avoid shooting oversized crystals.

The detection stack (step 2) is based on YOLO (You Only Look Once) models, and is deployed on SLAC infrastructure with GPU acceleration for low-latency operation.

The contribution of the MLCV team focuses on crystal avoidance: when the size of a crystal exceeds a user-defined threshold, the detection algorithm flags it, reducing the risk of detector damage during high-power shots.

## Detection Algorithm

### Introduction

The YOLO approach is used, leveraging models available in the Ultralytics library. For each detected crystal, the algorithm outputs:
- Crystal class (from 1 to *n*, where *n* is the total number of classes)
- Width and height (in pixels)
- Centroid position (in pixels, *x₀*, *y₀*)
- Confidence score (CNN output)

### Data Labelling and Training

YOLO is a supervised deep learning model requiring labelled data for training and evaluation. The data were collected with the MFX instrument at LCLS/SLAC in January 2026 and split 80/20 for training and testing. Training images are manually labelled using the LabelMe GUI.

The model is trained on CPUs. The three main tuning variables are:
- **Number of epochs**: set to reach clear convergence while preventing overfitting.
- **Model version**: YOLOv8 and YOLOv11 were evaluated, both well-suited for object detection tasks.
- **Model size**: ranges from *nano* (n) to *extra-large* (xl). While larger models generally perform better given sufficient training data, low latency is a primary constraint — nano models are therefore used.

### Results

<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/projects/coyote_before_inference.png" title="Raw detector image" class="img-fluid rounded z-depth-1" caption="Raw detector image before inference" %}
    </div>
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/projects/coyote_after_inference.png" title="Inference output" class="img-fluid rounded z-depth-1" caption="Inference output with bounding boxes and confidence scores" %}
    </div>
</div>

### Performance

To address operational constraints, the algorithm must be both fast and accurate. To represent this trade-off, we plot mAP@50 as a function of average inference time over the test set. The optimal model corresponds to the top-left point on this Pareto frontier.

<div class="row justify-content-center">
    <div class="col-sm-6 mt-3 mt-md-0">
        {% include figure.liquid path="assets/img/projects/coyote_pareto_frontier.png" title="Detection Algorithm Performance" class="img-fluid rounded z-depth-1" caption="Performance of the detection algorithm on the black crystal test set" %}
    </div>
</div>

The best results obtained on black crystal detection are as follows:

| Metric | Value |
| --- | --- |
| mAP@50 | 0.997 |
| Precision | 0.932 |
| Recall | 0.941 |
| Average inference time | 5.9 ms on GPUs |

## Implementation on SLAC's HPC Infrastructure

The goal is to integrate this algorithm into SLAC's HPC infrastructure. The current experimental setup requires data to first be collected on CDS (Control and Data Systems), then transferred to SDF (SLAC Data Facility) for processing, with results sent back to CDS to update the pulse picker sequence.

The workflow is:
1. Collect images with Coyote using CDS.
2. Transfer the data to SDF.
3. Run inference on SDF (GPU nodes).
4. Export results back to CDS for pulse picker update.

{% include figure.liquid path="assets/img/projects/coyote_parallel_pipeline.png" title="Workflow Image processing" class="img-fluid rounded z-depth-1" caption="End-to-end parallel worfklow for in situ image processing"%}

To reduce end-to-end latency, data are sliced into batches and processed in parallel. This approach currently achieves a throughput of **37 images per second** (27 ms per image), with data extraction being the current bottleneck.


## Challenges

The YOLO approach relies on supervised learning, meaning prediction quality is directly tied to the quality of training data and labels. Obtaining high-quality annotations at scale is time-consuming, and image appearance can vary significantly across crystal types, sample conditions, and beam settings — making generalization a key challenge going forward.

## Future Work

This pipeline has yet to be tested during live beamtime. Planned directions include:
- **Live inference**: the current design processes pre-scanned data, but on-the-fly inference during scanning is technically feasible and would reduce overall latency (no need to pre-scan the chip).
- **Automatic labelling**: using diffraction patterns directly to generate training labels could reduce the manual annotation burden and improve coverage across crystal types.
- **Generalization**: extending the training dataset to cover more crystal types, sizes, and imaging conditions would improve robustness.

## GitHub Repository
{% include repository/repo.liquid repository="lcls-mlcv/coyote_protector" %}


