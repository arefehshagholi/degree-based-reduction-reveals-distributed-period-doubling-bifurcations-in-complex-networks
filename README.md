# Degree-Based Reduction Reveals Distributed Period-Doubling Bifurcations in Complex Networks

Reproducibility package for the manuscript. The repository contains MATLAB simulation code, a shared set of 22 network adjacency matrices, and a 66-row coupling-range catalog for the Hénon, mChialvo, and Rössler systems.

## Start

Open the repository root in MATLAB and run:

```matlab
run_simulation
```

Choose the dynamical system and one of the 22 networks, then enter the coupling interval, number of samples, and random seed. MATLAB R2019b or later is recommended. Rössler simulations require `findpeaks` from Signal Processing Toolbox.

## Shared network data

The same 22 adjacency matrices are used for all three dynamical systems. Byte-for-byte comparison of the original per-system copies confirmed that all 22 files were identical, so they are stored once under `data/networks/` and shared by all simulation modules.

Network set: 1 complete, 5 regular, 5 Watts–Strogatz, 5 Newman–Watts, 5 Barabási–Albert/scale-free, and 1 star network.

## Critical-point ranges

`data/network_ranges.csv` contains 66 system/network entries extracted from the manually curated critical-point workbook used in the study. Critical points were read manually from bifurcation diagrams; no automatic critical-point detector is claimed. Suggested simulation ranges are exploratory starting intervals and should be refined when higher visual/numerical resolution is required.

## Outputs

Each run creates timestamped `.mat` numerical data and `.png` bifurcation plots under the selected system's `results/` directory. Generated outputs are not required as input data.

## Structure

| Path | Contents |
| --- | --- |
| `data/networks/` | Shared 22 network adjacency files |
| `data/network_ranges.csv` | 66 system/network range records |
| `common/` | Interactive simulation controller |
| `henon/` | Hénon simulation and analysis code |
| `mchialvo/` | mChialvo simulation and analysis code |
| `rossler/` | Rössler simulation and analysis code |

## Validation note

All 22 shared network files and all 66 range mappings were checked during repository preparation. MATLAB/Octave was not available in the preparation environment, so an end-to-end MATLAB execution was not performed here.