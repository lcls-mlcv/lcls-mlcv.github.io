---
layout: projects
title: Sim-EXAFS
description: Simulation layer for running and debugging EXAFS workflows on MFX without beamline access (DCCM/vernier/TFS/undulator/diagnostics + lightweight DAQ).
img: assets/img/Gemini_Generated_Image_EXAFS_simulated.png
importance: 3
category: autoMFX
related_publications: false
---

### Project Goal
**Sim-EXAFS** provides an offline, safety-first environment to develop and test EXAFS scan workflows for MFX. Instead of aiming for perfect beam physics, it focuses on *high-fidelity control behavior*: the same device interfaces, the same sequencing, and realistic enough signals to validate scan logic, alignment routines, and operator procedures without touching real hardware.

### What it enables
Sim-EXAFS is used for rapid iteration when beam time is unavailable, debugging control-flow issues independently of EPICS/DAQ problems, validating optimization behavior against predictable synthetic signals, and training new users on complex workflows with zero risk to the instrument.

### How it works
Simulation uses a centralized **device registry**. A global devices dictionary is populated by real hardware via or simulated stand-ins. Downstream code interacts with the devices through the same keys and methods, so most scan and optimization code runs unchanged in either mode.

### Simulated beamline components
Sim-EXAFS covers the control surfaces needed to exercise the EXAFS automation loop:

- **Vernier + DCCM coupling (control realism)**  
  The vernier simulator mimics fine energy trim around the DCCM with persistent state and an energy-dependent systematic offset (so “commanded” and “effective” energy can differ as they often do on real systems). It also provides mode-aware behavior to support alignment and calibration scans, plus a synthetic intensity signal that peaks when vernier and DCCM match—useful for testing intensity-based alignment.

- **Transfocator (TFS) mechanics (API compatibility)**  
  The TFS simulator reproduces the lens insert/remove states and translation-stage motion using the same interface as the real Transfocator. This makes focus-tracking and per-energy configuration logic testable even though the simulation does not attempt to compute true optical focus or transmission.

- **Undulator pointing (command/actuate/done behavior)**  
  The undulator simulation mirrors the ACR-style move pattern and preserves polarity conventions. It supports both delta and absolute moves so alignment routines can be developed against realistic control semantics.

- **Diagnostics (YAG cameras, Wave8/IPM-like signals)**  
  Synthetic YAG images (Gaussian beam spots) respond to simulated mirror pitch and undulator pointing, allowing alignment routines to “see” beam motion. Derived position and intensity-like readbacks include offsets and noise so centering and stability checks behave plausibly. Marker support keeps camera-viewer workflows compatible.

- **Lightweight DAQ (for plan execution)**  
  A minimal fake DAQ interface supports workflows that expect a DAQ object (e.g., bluesky-driven calibration), enabling scan plans to run without network access. This validates sequencing and integration points, but does not generate real data products.


### Strengths
Sim-EXAFS is intentionally interface-compatible with real hardware, so scan logic developed in simulation usually transfers directly to beamline operation. Because diagnostics respond to control inputs, optimization and alignment routines can be meaningfully debugged offline, not just “unit tested” in isolation.

### Known gaps
The simulation does not model full beam transport physics (no ray tracing, simplified noise/response models), and most moves succeed immediately without realistic failure modes (timeouts, limit hits, disconnects, DAQ errors). State is often maintained at module scope, which can make parallel independent simulation scenarios awkward without a reset/scoping mechanism. DAQ simulation does not emulate file writing or event streams, so data-dependent logic cannot be validated end-to-end.

