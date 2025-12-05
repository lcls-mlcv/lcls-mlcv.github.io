---
layout: projects
title: EXAFS
description: Automated controller for Extended X-ray Absorption Fine Structure (EXAFS) spectroscopy scans on the MFX beamline at LCLS-II.
img: assets/img/Gemini_Generated_Image_EXAFS.png‎
importance: 3
category: Automation
related_publications: false
---

### Project Goal
The goal of **EXAFS@MFX** is to provide a reliable, operator-friendly controller for running Extended X-ray Absorption Fine Structure (EXAFS) scans at MFX. It automates an end-to-end scan across an absorption edge while keeping beam delivery optimized and the experiment protected, so scans run repeatably with minimal manual intervention.

### Automation loop
EXAFS scans require stepping photon energy while maintaining throughput and stability. This module runs that workflow by coupling **DCCM energy moves** (the primary scan axis) with **undulator K stepping** to keep the source tuned, and optional per-point optimization and tracking. It can align the **vernier** by maximizing intensity, apply **transfocator** focus configurations from a tracking map, track the **FEE spectrometer** (and optionally its camera), and manage the full **LCLS-II DAQ** lifecycle (configure → run → pause/resume when needed → stop). A flux threshold can be enforced to automatically pause DAQ if the beam drops and resume when it recovers.

### Accomplishments
This controller ties together the parts that typically make EXAFS scans hard to run manually: synchronized energy motion (DCCM + K), repeatable fine alignment (vernier), optics compensation (transfocator), and experiment lifecycle management (DAQ + safety checks). It also preserves calibration/track data between runs via JSON maps and provides diagnostic plotting tools for scan profiles and tracked offsets when debug mode is enabled.

### Limitations
Element edge metadata (foil/threshold energies) is currently hard-coded to a small set of transition metals, so adding new elements requires extending those tables. Focus tracking depends on precomputed tracking data. Vernier alignment is robust but can add overhead because it is scan-based rather than model-predicted. A few hardware interactions use shell calls and fixed PV names, which is less portable than fully device-native control. Finally, `long_escan` is intentionally feature-rich and therefore large, making it a good operational entry point but a natural target for refactoring and unit tests.

