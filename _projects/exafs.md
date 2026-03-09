---
layout: projects
title: EXAFS
description: Automated controller for Extended X-ray Absorption Fine Structure (EXAFS) spectroscopy scans on the MFX beamline at LCLS-II.
img: assets/img/Gemini_Generated_Image_EXAFS.png
importance: 3
category: autoMFX
related_publications: false
---

### Project Goal

The goal of **EXAFS@MFX** is to provide a reliable, operator-friendly controller for running Extended X-ray Absorption Fine Structure (EXAFS) scans at MFX. It automates an end-to-end scan across an absorption edge while keeping beam delivery optimized and the experiment protected, so scans run repeatably with minimal manual intervention.

### Automation loop

EXAFS scans require stepping photon energy while maintaining throughput and stability. This module runs that workflow by coupling DCCM energy moves (the primary scan axis) with undulator K stepping to keep the source tuned, and optional per-point optimization and tracking. It can align the vernier by maximizing intensity, apply transfocator focus configurations from a tracking map, and manage the full LCLS-II DAQ lifecycle (configure → run → pause/resume when needed → stop).

Additionally, it can track the **FEE spectrometer**, which automatically recalibrates the crystal and camera positions based on the current energy to maintain transmission. It can also optionally track only its camera angle to compensate for detector vignetting as the beam moves during a scan. A flux threshold can be enforced to automatically pause DAQ if the beam drops and resume when it recovers.

<p align="center">
  <img src="/assets/img/Gemini_Generated_Image_EXAFS.png" alt="Picture of the real Instrument at MFX" width="900">
</p>

### Accomplishments

This controller ties together the parts that typically make EXAFS scans hard to run manually: synchronized energy motion (DCCM + K), repeatable fine alignment (vernier), optics compensation (transfocator), and experiment lifecycle management (DAQ + safety checks). It also preserves calibration/track data between runs via JSON maps and provides diagnostic plotting tools for scan profiles and tracked offsets when debug mode is enabled.

### Limitations

Element edge metadata (foil/threshold energies) is currently hard-coded to a small set of transition metals, so adding new elements requires extending these tables. Focus tracking depends on precomputed tracking data, and experimental results during beamtime indicate the need for better synchronization, as the transfocator stage motion often lagged behind energy steps during high-speed scans. Vernier alignment is robust but can add overhead because it is scan-based rather than model-predicted.

Furthermore, pointing stability remains a challenge; while undulator alignment is available, more work is needed to ensure the beam remains optimally pointed throughout the entire scan range. A few hardware interactions still use shell calls and fixed PV names, which is less portable than fully device-native control. Finally, `long_escan` is intentionally feature-rich and therefore large, making it a functional operational entry point but a primary target for future refactoring and unit testing.
