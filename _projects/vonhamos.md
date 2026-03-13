---
layout: projects
title: Von Hamos Spectrometer
description: Deterministic control of the MFX 6-crystal Von Hamos X-ray emission spectrometer.
img: assets/img/vonhamos_new_cropped.png
importance: 3
category: autoMFX
related_publications: false
---

### Project Goal

**Von Hamos@MFX** provides reliable, repeatable control of the MFX **6-crystal Von Hamos X-ray emission spectrometer** for high-resolution X-ray emission spectroscopy (XES). The core objective is _deterministic positioning_: crystals must land where we ask—within tight tolerances—despite backlash, drift, and imperfect motor behavior, because small positioning errors directly degrade spectral resolution.

<!-- <p align="center">
  <img src="/assets/img/vonhamos_new.png" alt="Picture of the real Instrument at MFX" width="500">
</p> -->

### Deterministic positioning (the key idea)

Most motion systems offer a fast “move-to” command, but that does not guarantee the final position is within a micron/arcminute-level tolerance. This module introduces a deterministic motor wrapper that iteratively moves and verifies position until the axis is within a user-defined tolerance.

**Disclaimer**: This iterative approach is designed for high-precision requirements where standard motion calls fall short. It should only be used if the default "move-to" command fails to meet the necessary position accuracy, as it introduces additional overhead and motion cycles.

**`DeterministicBeckhoffAxis`** extends standard Beckhoff motion with a `go(target, epsilon, ...)` routine that:

- clears errors and reads back the actual position,
- retries until the axis is within `epsilon`,
- optionally uses a “smart” overshoot strategy to break through backlash or a stuck approach direction.

In practice, this typically converges in a few iterations and gives a repeatable final position suitable for spectroscopy-grade alignment.

### What it controls

The spectrometer is modeled as a **6-crystal assembly** with both per-crystal and global degrees of freedom.

**`DeterministicCrystal`** represents one analyzer crystal with three critical axes:

- **x**: sets the crystal’s distance (strongly impacts resolution and collection efficiency),
- **rot**: selects energy via Bragg angle,
- **tilt**: corrects vertical focusing and mounting offsets.

**`DeterministicVonHamos6Crystal`** bundles six of these crystals (`c1`–`c6`) and exposes global stages used for coarse placement of the full spectrometer (global rotation and translations), while leaving high-precision tuning to the per-crystal deterministic axes.

### Typical workflows

Von Hamos@MFX supports common operations needed during setup and data taking:

- **Initialization and repeatable positioning**: bring crystals back to known “good” coordinates
- **Per-crystal tuning**: x/rot/tilt adjustments to maximize signal and lock energy
- **Energy scans**: The software coordinates global and per-crystal rotations to step through Bragg angles. By utilizing deterministic moves during a scan, we ensure that each energy point is reached with the same mechanical approach, eliminating energy-axis "jitter" caused by backlash.
- **Multi-crystal acquisition**: All six analyzers collect in parallel and spectra are combined downstream.

### Alignment Automation

The project moves beyond manual "knob-turning" by providing high-level automation via one-call utilities:

* **Automated Array Initialization**: Instead of moving 18 axes (3 per crystal) individually, `set_all_crystals()` allows a single command to drive the entire spectrometer to a target geometry. This is used to rapidly switch the instrument between major emission lines.
* **Closed-Loop Optimization**: The `optimize_crystal()` utility provides a framework for beam-based alignment. It can be paired with detector feedback to iteratively refine the **tilt** (vertical focus) and **rotation** (Bragg angle) of a specific crystal until the signal is maximized and centered.
* **Deterministic Verification**: Alignment is only as good as the verification. Every automated move uses the `DeterministicBeckhoffAxis` logic to verify that the final position is within a micron-level `epsilon`. If a motor is "stuck," the **Smart Mode** automatically triggers an overshoot-and-return sequence to break through mechanical stiction without user intervention.
* **State Reporting**: `print_crystal_positions()` generates a live alignment table, allowing scientists to instantly compare the current physical state of the 6-crystal array against theoretical parameters.


