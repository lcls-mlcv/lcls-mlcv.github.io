---
layout: projects
title: Simulation
description: Simulated devices for Extended X-ray Absorption Fine Structure (EXAFS) spectroscopy scans on the MFX beamline at LCLS-II.
img: assets/img/Gemini_Generated_Image_EXAFS_simulated.png
importance: 3
category: autoMFX
related_publications: false
---
# Simulation Setup for MFX Beamline Components

## Overview
The MFX codebase includes a simulation layer that lets you exercise beamline workflows without access to the physical MFX hutch. The goal is not perfect beam physics, but *high-fidelity control behavior*: the same device interfaces, the same sequencing, and realistic enough signals to develop scan logic, alignment routines, and operator training safely offline.

## Why it exists
Simulation mode supports day-to-day development (no-beam testing and faster iteration), validation of optimization logic with predictable behavior, training without risk to hardware, and debugging when one needs to separate control-flow bugs from EPICS/DAQ/hardware issues.

## How it works
The simulation follows a centralized **device registry** pattern. A global dictionary of **devices** is populated by either real hardware (`init_devices()`) or synthetic devices (`sim_devices()`). Downstream code consumes the **devices** through the same keys and method calls, so most of the code does not need to care whether it is running against real PV-backed devices or simulated stand-ins.

## What is simulated

### Vernier energy control
The vernier simulation in `mfx/optimize/beamline_hw.py` mimics fine energy trim around the DCCM. It tracks commanded vs. effective position using a custom axis wrapper and keeps state in module-level trackers so actions remain consistent across calls (important for scan loops). A simple *energy-dependent systematic offset* is applied to emulate the real-world behavior where vernier and DCCM do not perfectly agree, and the offset grows with energy. To enable alignment and calibration workflows, the simulation supports mode-dependent behavior: in “alignment scan” mode the vernier lands exactly at the requested value to emulate an alignment scan; in “calibration scan” mode DCCM and vernier move together while the offset model remains active.

To make intensity-based alignment testable, the simulation generates a synthetic intensity signal that peaks when the vernier matches the DCCM, using a Gaussian-shaped response with added noise. A companion helper provides a simulated DCCM readback with small measurement noise so code that relies on energy readback behaves realistically.

### Transfocator (TFS)
The transfocator simulation in `tfs/sim_transfocator.py` reproduces the *mechanics and API* of the lens system: lens insert/remove state, a translation stage, and a wrapper object that looks like the real `Transfocator`. Lenses are backed by fake EPICS signals and the translation stage is implemented as a synthetic motor axis; moving the stage updates lens positions in a consistent way. This is designed to be transparent to scan logic and focus-tracking code: you can call `.insert()`, `.remove()`, and `.translation.mv()` exactly as you would on real hardware.

What it does not attempt to do is model true optical focusing or transmission. It is a control-level simulation for testing sequencing, configuration lookup, and lens-state bookkeeping.

### Undulator pointing
The undulator pointing simulation in `mfx/optimize/undpoint.py` emulates the ACR-style “command → actuate → done” move pattern and tracks state across moves. It supports both a delta-move interface and an absolute-position interface (implemented by converting absolute requests into deltas). Polarity conventions are preserved so algorithms that depend on sign behave the same way as on the beamline. The moves complete immediately (no motion time modeling), focusing on logic correctness rather than dynamics.

### DAQ (lightweight)
For routines that need a DAQ object (notably bluesky-driven calibration flows), a minimal `FakeDaq` replaces the real LCLS-II DAQ interface. Methods are no-ops but return the expected types, which allows plans to run without network access or DAQ state. This is intentionally limited: it validates control flow and integration points, not data products, file writing, or event-dependent logic.

### Diagnostics (YAG, Wave8, IPMs)
Diagnostics simulation is primarily implemented in `mfx/optimize/beamline_hw.py` and `mfx/optimize/devices.py`. YAG cameras produce synthetic Gaussian beam images whose centroid responds to simulated mirror pitch and undulator pointing, enabling alignment routines to “see” motion. Wave8/IPM-like readbacks provide derived X/Y positions and intensity-like signals with offsets and noise so centering and stability checks can be exercised. Marker support is included to keep camviewer-style workflows compatible with simulation.

## The `sim_devices()` entry point
`sim_devices()` is the one-stop initializer for simulation mode: it constructs simulated mirror/undulator controls, diagnostics, vernier behavior, and readback helpers, then registers them in the global `devices` dictionary. It is designed to be idempotent (safe to call multiple times) and to preserve random initial offsets within a session, which helps mimic the “nothing is perfectly aligned on startup” feel of real beamline operation.

## Strengths
Simulation mode covers all major control surfaces needed for typical MFX workflows (energy trim, focusing optics, pointing, diagnostics, and enough DAQ scaffolding to run plans). It is intentionally interface-compatible with real devices, so code written against simulation is usually deployable without changes. Because synthetic diagnostics respond to control inputs, optimization and alignment routines can be developed and debugged meaningfully offline.

## Known gaps
The simulation does not include full beam transport physics: no ray tracing, no real focus computation in the transfocator, simplified noise and response models, and minimal modeling of failures (timeouts, limit hits, EPICS disconnects, DAQ error states). Global, module-level trackers also make parallel independent “beamlines” in one process awkward unless a reset/scoping mechanism is added. DAQ simulation does not generate data or emulate file output, so data-dependent workflows cannot be validated end-to-end.

