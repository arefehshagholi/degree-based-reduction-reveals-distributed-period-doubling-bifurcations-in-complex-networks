# Degree-Based Reduction Reveals Distributed Period-Doubling Bifurcations in Complex Networks

Reproducibility package for the manuscript. The repository contains MATLAB source code for the Hénon, mChialvo, and Rössler systems, one shared set of 22 network adjacency matrices, the author-curated critical-point workbook, and the Python utility used to build the coupling-range catalog.

## Start

Open the repository root in MATLAB and run:

```matlab
run_simulation
```

Choose the dynamical system and one of the 22 networks, then enter the coupling interval, number of coupling samples, and random seed. MATLAB R2019b or later is recommended. Rössler simulations require `findpeaks` from Signal Processing Toolbox.

## Shared network data

The same 22 adjacency matrices are used for all three dynamical systems. The original per-system copies were verified to be byte-for-byte identical, so they are stored once under `data/networks/` and shared by all simulation modules.

Network set: 1 complete, 5 regular, 5 Watts–Strogatz, 5 Newman–Watts, 5 Barabási–Albert/scale-free, and 1 star network.

The `.mat` files in `data/networks/` are **input adjacency matrices**, not simulation outputs.

## Critical-point workbook and range catalog

`data/manually_created_critical_points.xlsx` is the author-curated workbook used for the critical-point tables. Values labeled as real critical points were read manually from bifurcation diagrams; no automatic critical-point detector is claimed.

`data/network_ranges.csv` contains system/network coupling-range entries. The default suggested interval is generated as:

```text
suggested_min = 0
suggested_max = 1.10 × largest positive finite critical-point value
```

considering both predicted and manually read values for the selected network and system.

To regenerate the CSV from the workbook:

```bash
cd data
python build_range_catalog.py
```

Python 3 and `openpyxl` are required. The builder also verifies that every referenced network exists under `data/networks/`.

## Repository contents

| Path | Contents |
| --- | --- |
| `run_simulation.m` | Main interactive MATLAB entry point |
| `common/` | Shared interactive simulation controller |
| `data/networks/` | Shared 22 input adjacency matrices |
| `data/manually_created_critical_points.xlsx` | Author-curated critical-point workbook |
| `data/network_ranges.csv` | Generated coupling-range catalog |
| `data/build_range_catalog.py` | Python range-catalog generator |
| `henon/` | Hénon source code |
| `mchialvo/` | mChialvo source code |
| `rossler/` | Rössler source code |

## Output policy

Pre-generated simulation results and figures are intentionally not included in this repository. Running the MATLAB workflow creates `.mat` numerical outputs and `.png` bifurcation figures locally under each system's `results/` directory. Generated reduced-model `.mat`/`.png` files are also excluded. This keeps the repository focused on source code, input networks, and the tabulated critical-point data used to define the suggested simulation ranges.

## Validation note

The shared network files, workbook-to-network mappings, and range-catalog regeneration were checked during repository preparation. MATLAB/Octave was not available in the preparation environment, so a complete end-to-end MATLAB execution was not performed here.
