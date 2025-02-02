---
layout: projects
title: Abismal
description: A Different Way of Modeling Diffraction
img: /assets/img/projects/abismal.png
importance: 1
category: Computational Imaging
related_publications: true
---

Historical models of diffraction have built upon the deep understanding of the scattering physics. This approach works very well in the context of small molecule crystals. However, large biological molecules like proteins and nucleic acids can be very challenging to treat from first principles. A recent breakthrough {% cite dalton2022careless %} demonstrated how a deep-learning model could be trained using Bayesian inference to discover an appropriate physical model which is bespoke for each sample. This pioneering work had notable limitations which prevented it from treating the large data sets generated at the LCLS and other free-electron lasers. A new project, [ABISMAL](https://github.com/rs-station/abismal), is being developed to surpass these limitations and bring the power of neural networks to LCLS in order to understand the motions of biological molecules.
<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/projects/abismal.png" title="ABISMAL" class="img-fluid rounded z-depth-1" caption="Graphical representation of the ABISMAL model." %}
    </div>
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/projects/abismal2.png" title="ABISMAL" class="img-fluid rounded z-depth-1" caption="Schematic representation of the ABISMAL implementation." %}
    </div>
</div>

### GitHub Repository
{% include repository/repo.liquid repository="rs-station/abismal" %}
