---
layout: projects
title: Von Hamos
description: Deterministic control of the MFX 6-crystal Von Hamos X-ray emission spectrometer.
img: assets/img/vonhamos_mfx.jpg
importance: 3
category: autoMFX
related_publications: false
---

### Project Goal
**Von Hamos@MFX** provides reliable, repeatable control of the MFX **6-crystal Von Hamos X-ray emission spectrometer** for high-resolution X-ray emission spectroscopy (XES). The core objective is *deterministic positioning*: crystals must land where we ask—within tight tolerances—despite backlash, drift, and imperfect motor behavior, because small positioning errors directly degrade spectral resolution.

<p align="center">
  <img src="/assets/img/vonhamos_mfx.png" alt="Picture of the real Instrument at MFX" width="900">
</p>

### Deterministic positioning (the key idea)
Most motion systems offer a fast “move-to” command, but that does not guarantee the final position is within a micron/arcminute-level tolerance. This module introduces a deterministic motor wrapper that iteratively moves and verifies position until the axis is within a user-defined tolerance.

**`DeterministicBeckhoffAxis`** extends standard Beckhoff motion with a `go(target, epsilon, ...)` routine that:
- clears errors and reads back the actual position,
- retries until the axis is within `epsilon`,
- optionally uses a “smart” overshoot strategy to break through backlash or a stuck approach direction.

In practice, this typically converges in a few iterations and gives a repeatable final position suitable for spectroscopy-grade alignment.

### What it controls
The spectrometer is modeled as a **6-crystal assembly** with both per-crystal and global degrees of freedom.

**`DeterministicCrystal`** represents one analyzer crystal with three critical axes:
- **x**: sets the crystal’s distance / Rowland geometry (strongly impacts resolution and collection efficiency),
- **rot**: selects energy via Bragg angle,
- **tilt**: corrects vertical focusing and mounting offsets.

**`DeterministicVonHamos6Crystal`** bundles six of these crystals (`c1`–`c6`) and exposes global stages used for coarse placement of the full spectrometer (global rotation and translations), while leaving high-precision tuning to the per-crystal deterministic axes.

### Typical workflows
Von Hamos@MFX supports common operations needed during setup and data taking:
- **initialization and repeatable positioning** (bring crystals back to known “good” coordinates),
- **per-crystal tuning** (x/rot/tilt adjustments to maximize signal and lock energy),
- **energy scans** by stepping crystal rotation,
- **multi-crystal acquisition** where all six analyzers collect in parallel and spectra are combined downstream.

Helper utilities like `optimize_crystal()`, `set_all_crystals()`, and position reporting functions provide quick “one-call” operations during shifts and alignment.
