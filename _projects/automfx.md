---
layout: projects
title: autoMFX
description: Automation of the MFX beamline at LCLS
img: assets/img/projects/automfx.jpg
subprojects: ["EXAFS", "Sim-EXAFS"]
importance: 3
category: Automation
related_publications: false
---
*More details coming soon*

### Project Goal

The MFX beamline automation project represents a comprehensive effort to transform the Macromolecular Femtosecond Crystallography (MFX) beamline at the Linac Coherent Light Source (LCLS) into a highly automated experimental facility. This system addresses the critical need for efficient, reproducible, and unattended operation of complex X-ray free-electron laser experiments, which require precise coordination of numerous beamline components, sample delivery systems, and data acquisition infrastructure.

The primary goal of this automation framework is to minimize manual intervention during experimental runs while maximizing data collection efficiency and experimental reproducibility. The system achieves this through integrated automation of key experimental workflows, including automated data acquisition sequences, intelligent beam alignment and optimization, energy scanning protocols, timing synchronization, and sample delivery coordination.

At the core of the automation system is an autorun capability that orchestrates extended experimental campaigns with minimal operator oversight. An intelligent beam alignment system employs machine learning and optimization techniques to automatically calibrate and maintain optimal beam positioning across multiple diagnostic locations. This system can perform calibration scans, build predictive models of beam behavior, and continuously optimize beam position using feedback from diagnostic cameras and intensity monitors.

Energy scanning automation enables spectroscopic measurements such as Extended X-ray Absorption Fine Structure (EXAFS) scans. The system automates complex energy sequences that require careful coordination between multiple monochromator systems, including the Double Crystal Monochromator (DCCM) and vernier fine-tuning mechanisms. These automated scans handle energy range calculations, wait time optimization for system settling, intensity-based alignment verification, and automatic focus optimization at each energy point

The system incorporates comprehensive safety and monitoring features, including automatic beam suspension when energy parameters fall outside acceptable ranges, pulse picker management for radiation safety, and real-time monitoring of critical beamline parameters. Error handling and recovery mechanisms ensure that experiments can continue or gracefully terminate when issues are detected, with automatic logging of any anomalies.

All automation components are designed to work seamlessly together, allowing researchers to execute complex multi-step experimental protocols with simple high-level commands. The system maintains full experimental provenance, automatically recording all relevant parameters, device positions, and experimental conditions for each data acquisition run. This comprehensive automation framework transforms the MFX beamline into a highly efficient experimental platform that enables researchers to focus on scientific analysis rather than manual beamline operation, significantly increasing the scientific productivity of the facility.

<p align="center">
  <img src="/assets/img/real_long.png" alt="Picture of the real Instrument at MFX" width="900">
</p>

### Xopt

Xopt is the core optimization engine driving our group’s automation efforts in beamline alignment. It is a flexible, open-source Python framework designed for high-level optimization across simulations, experiments, and control systems. It allows users to define input variables, objectives and constraints through a simple “VOCS” interface, then select from advanced algorithmic generators (e.g., evolutionary, Bayesian, multi-objective, multi-fidelity) to drive optimization with minimal boilerplate. 

<p align="center">
<img width="629" height="267" alt="xopt_diagram" src="https://github.com/user-attachments/assets/b763377b-bac6-4685-acef-eb84f090b783" />
</p>



### AutoMFX Projects
For a deeper dive into the AutoMFX projects, check out their individual pages:
<div class="projects">
  <div class="row row-cols-1 row-cols-md-3">
  {% for project in site.projects %}
    {% if page.subprojects contains project.title %}
      {% include projects.liquid %}
    {% endif %}
  {% endfor %}
  </div>
</div>



