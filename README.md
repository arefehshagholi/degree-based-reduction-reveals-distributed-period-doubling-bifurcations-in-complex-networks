# Degree-Based Reduction Reveals Distributed Period-Doubling Bifurcations in Complex Networks

## Reproducibility Package

This repository provides the reproducibility materials associated with the manuscript **“Degree-Based Reduction Reveals Distributed Period-Doubling Bifurcations in Complex Networks.”**

The repository was prepared as part of the manuscript revision to address the reviewers’ requests regarding **code availability, reproducibility, network data, critical-point data, and transparency of the numerical workflow**.

It contains the MATLAB source code required to reproduce the simulations for the **Hénon, mChialvo, and Rössler systems**, the complete set of network adjacency matrices used in the study, the author-curated critical-point workbook, and the Python utility used to generate the coupling-range catalog.

The aim is to provide reviewers and readers with a clear connection between the numerical simulations, the network structures used in the manuscript, and the critical-point values reported in the analysis.

---

## Quick Start

Open the repository root directory in MATLAB and run:

```matlab
run_simulation
```

The interactive workflow allows the user to:

1. select the dynamical system;
2. select one of the available network structures;
3. specify the coupling interval;
4. specify the number of coupling samples;
5. specify the random seed; and
6. run the corresponding full-network simulation.

MATLAB R2019b or later is recommended.

For the Rössler simulations, `findpeaks` from the MATLAB Signal Processing Toolbox is required.

---

## Shared Network Data

All three dynamical systems use the same set of network adjacency matrices.

During preparation of the reproducibility package, the original network files stored separately for the Hénon, mChialvo, and Rössler implementations were checked and confirmed to be **byte-for-byte identical**. To avoid unnecessary duplication, a single shared copy is therefore stored under:

```text
data/networks/
```

The network set contains:

- complete network;
- regular networks;
- Watts–Strogatz networks;
- Newman–Watts networks;
- Barabási–Albert / scale-free networks; and
- star network.

The `.mat` files contained in `data/networks/` are **input adjacency matrices used by the simulations** and should not be interpreted as pre-generated simulation results.

---

## Critical-Point Data

The file

```text
data/manually_created_critical_points.xlsx
```

contains the critical-point data used in the manuscript analysis.

Importantly, the critical points identified as **real/observed critical points were determined manually from the corresponding bifurcation diagrams**.

No automatic critical-point detection algorithm is claimed or used for these manually reported values.

This distinction is preserved explicitly in the reproducibility package so that the origin of the reported critical points remains transparent.

---

## Coupling-Range Catalog

The file

```text
data/network_ranges.csv
```

provides the coupling intervals associated with the different dynamical-system/network combinations.

The suggested simulation interval is generated from the critical-point workbook according to:

```text
suggested_min = 0
suggested_max = 1.10 × largest positive finite critical-point value
```

where the largest relevant positive finite critical-point value is considered for the selected dynamical system and network.

The additional margin is included so that the simulated coupling interval extends beyond the critical transition region rather than terminating exactly at the largest tabulated critical point.

---

## Regenerating the Range Catalog

The coupling-range catalog can be regenerated directly from the author-curated workbook using:

```bash
cd data
python build_range_catalog.py
```

Requirements:

```text
Python 3
openpyxl
```

The script reads the workbook, constructs the coupling-range catalog, and verifies that every referenced network file exists under:

```text
data/networks/
```

This provides a reproducible link between the manually curated critical-point data and the coupling intervals used for the numerical simulations.

---

## Repository Structure

| Path | Description |
| --- | --- |
| `run_simulation.m` | Main interactive MATLAB entry point |
| `common/` | Shared interactive simulation controller |
| `data/networks/` | Network adjacency matrices used as simulation inputs |
| `data/manually_created_critical_points.xlsx` | Author-curated critical-point workbook |
| `data/network_ranges.csv` | Coupling-range catalog derived from the workbook |
| `data/build_range_catalog.py` | Python utility for rebuilding the range catalog |
| `henon/` | Hénon full-network and reduced-model source code |
| `mchialvo/` | mChialvo full-network and reduced-model source code |
| `rossler/` | Rössler full-network and reduced-model source code |

---

## Reproducibility and Output Policy

To keep the repository focused on the material required to **independently reproduce the numerical analysis**, pre-generated simulation outputs are intentionally not distributed with the repository.

In particular, generated:

```text
.mat
.png
```

simulation-result files are excluded.

Running the MATLAB workflow locally generates the numerical outputs and bifurcation figures in the corresponding system output directories.

The repository therefore provides the components required to regenerate the numerical results rather than supplying previously generated output files.

The `.mat` files located under `data/networks/` are an exception because they are **input network adjacency matrices**, not simulation outputs.

---

## Relation to the Manuscript Revision

This repository was organized specifically to make the computational procedure used in the revised manuscript independently inspectable and reproducible.

In response to the reproducibility-related points raised during peer review, the revision package now provides:

- the source code for all three dynamical systems considered in the manuscript;
- the network adjacency matrices used in the simulations;
- the manually curated critical-point data;
- the coupling-range information used for numerical runs;
- the Python procedure connecting the critical-point workbook to the coupling-range catalog; and
- a unified MATLAB entry point for reproducing the simulations.

Thus, the numerical workflow underlying the revised manuscript can be inspected and reproduced directly from the materials provided in this repository.

---

## Validation Note

As part of repository preparation:

- the shared network files were checked for consistency across the three dynamical systems;
- the workbook-to-network mappings were checked;
- the coupling-range catalog generation procedure was validated against the supplied workbook; and
- the repository structure was reorganized so that common input data are stored only once.

MATLAB/Octave was not available in the repository-preparation environment; therefore, a complete end-to-end execution of all MATLAB simulations was not performed in that environment.

The simulation source code, input data, parameter-selection workflow, and critical-point data required for independent execution are nevertheless provided in the repository.
