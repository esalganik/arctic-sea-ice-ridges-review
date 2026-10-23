# Arctic Sea Ice Ridges — Review Figures

This repository contains MATLAB scripts and supporting data used to generate selected figures for the review manuscript:

**Hidden in plain sight: the role of sea ice ridges in the coupled Arctic atmosphere–ice–ocean–ecosystem**

Mats A. Granskog, Evgenii Salganik, Renée M. Fredensborg Hansen, Yusuke Kawaguchi, Andrew Roberts, Jukka Tuhkuri, Melinda Webster, Philipp Assmy, Henriette Skourup, Amy R. Macfarlane, David Clemens-Sewall, Niels Fuchs, Eva Leu, Rolf Gradinger, Sebastian Gerland, Dmitry V. Divine, Elizabeth Hunke, Oliver Müller, Gunnar Bratbak, Christian Katlein, Madison M. Smith, Yoshimasa Matsumura, Morven Muilwijk, Christian Haas, Michel Tsamados, and Jari Haapala.

*Earth-Science Reviews* (in revision).

The scripts illustrate different aspects of Arctic sea-ice ridge morphology, spatial distribution, consolidation, porosity, and seasonal evolution. They combine published observations compiled from the literature with measurements collected during the MOSAiC expedition (2019–2020).

## Figures

| Figure | Script | Description |
|---|---|---|
| 3 | `Figure3_photo_and_morphology.m` | Ridge morphology illustrated using photography, airborne laser scanning (ALS), and remotely operated vehicle (ROV) observations |
| 5 | `Figure5_Wadhams.m` | Ridge keel-depth distributions based on published observations from Wadhams (2012) |
| 8 | `Figure8_ridge_spacing.m` | Compilation of Arctic ridge density measurements from submarine, airborne, and upward-looking sonar observations |
| 10 | `Figure10_porosity.m` | Literature compilation of ridge rubble and keel macroporosity |
| 12 | `Figure12_consolidation.m` | Seasonal evolution of ridge consolidation based on published observations and MOSAiC measurements |
| 18 | `Figure18_fb_rov.m` | Three-dimensional ROV observations illustrating false-bottom formation during summer |
| 23 | `Figure23_ridge_melt.m` | Relationship between summer ridge melt and initial keel draft from ROV observations |

## Repository structure

```text
├── Figure3_photo_and_morphology.m
├── Figure5_Wadhams.m
├── Figure8_ridge_spacing.m
├── Figure10_porosity.m
├── Figure12_consolidation.m
├── Figure18_fb_rov.m
├── Figure23_ridge_melt.m
├── data/
└── figures/
```

## Usage

Run each MATLAB script individually. Input files are read from the `data/` directory, and generated figures are saved to the `figures/` directory.

Some scripts require additional MATLAB toolboxes or external functions, including `linspecer`, `spcrv`, and the Gibbs SeaWater (GSW) Oceanographic Toolbox.

## Data sources

The figures use a combination of published literature values and processed MOSAiC observations. Literature sources are identified in the corresponding scripts and review manuscript.

Some compiled values involve conversions or approximations to facilitate comparisons between studies. These are documented in the code.

## Citation

If you use these scripts, please cite the associated review manuscript once published. Original observational studies should also be cited where their data are used.

## Status

Supporting code for a manuscript currently in revision at *Earth-Science Reviews*.
