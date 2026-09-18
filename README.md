# Degree-Based Reduction Reveals Distributed Period-Doubling Bifurcations in Complex Networks

Research materials accompanying the manuscript of the same title: MATLAB full-network simulations for Hénon, mChialvo and Rössler, 22 shared network adjacency matrices, the author-supplied critical-point workbook, and suggested coupling ranges.

## Repository scope

The `Real` critical points in the workbook were read manually from bifurcation diagrams and entered by the author. There is no automatic critical-point detector in this repository. The predicted columns are supplied tabulated results.

The repository provides full-network simulation code and the supplied network matrices. The `calc_beff.m` helper in each system directory computes effective parameters for groups of nodes with equal degree. The workbook contains tabulated results. Original simulation-result MAT files and figures are not distributed in this repository; new runs generate their own outputs.

## Run a simulation

Open the repository root in MATLAB and run:

```matlab
run_simulation
```

Select the system, network, coupling minimum and maximum, number of coupling samples, and random seed. Press Enter to accept a displayed default. Networks can be selected by number, label or filename.

MATLAB R2019b or later is recommended but has not been verified end to end in the preparation environment. Rössler runs require `findpeaks` from Signal Processing Toolbox. Python is only needed to rebuild the range catalog, not to run MATLAB with the supplied CSV.

Default settings in the current controller:

| Setting | Hénon and mChialvo | Rössler |
| --- | --- | --- |
| Coupling samples | 300 | 800 |
| Seed | 1 | 1 |
| Transient / retained map iterations | 500 / 50 | Not applicable |
| Integration time / tolerance | Not applicable | 500 / 1e-5 |

These are runner defaults, not a record of the settings used for every published table entry. A coarse sweep may need refinement near a transition.

## Files

| Path | Contents |
| --- | --- |
| `run_simulation.m` | MATLAB entry point |
| `common/` | Interactive controller |
| `henon/`, `mchialvo/`, `rossler/` | Full-network simulation functions and helpers |
| `data/networks/` | 22 input adjacency matrices shared by all three systems |
| `data/manually_created_critical_points.xlsx` | Original author-supplied workbook |
| `data/network_ranges.csv` | 66 suggested ranges: 22 networks × 3 systems |
| `data/build_range_catalog.py` | Existing workbook-to-range utility |
| `data/README.md` | Data provenance, columns and range interpretation |
| `docs/reproducibility.md` | Output contents, verification status and remaining evidence |

Network families comprise one complete network, five regular, five Watts–Strogatz, five Newman–Watts, five Barabási–Albert / scale-free networks, and one star network. Network MAT files are inputs.

## Simulation outputs

The runner saves a numerical `.mat` file and a `.png` bifurcation figure in `<system>/results/`, using a system/network/timestamp filename. Existing repository ignore rules exclude generated results. Original simulation outputs are not currently distributed here.

The numerical file includes parameters, network matrix and metadata. See [output details](docs/reproducibility.md). Manual critical-point readings are a separate step and are not automatically written back into the workbook.

## Suggested ranges

The ranges are heuristic starting intervals derived from the workbook, including both predicted and manually read critical points:

```text
suggested_min = 0
suggested_max = 1.10 × largest positive finite critical-point value for that system/network
```

They are not measured bifurcation boundaries or validated stability limits. Override them at the MATLAB prompt when appropriate. To rebuild the CSV with Python 3 and `openpyxl`:

```bash
cd data
python build_range_catalog.py
```

This command overwrites `network_ranges.csv`, including any manual edits to it.

## Data availability and citation

The source files, shared adjacency matrices, manually compiled critical-point workbook and range catalog are publicly available in this repository. Original simulation trajectories are not included in the current version.

When referring to these materials, include the manuscript title, repository URL and the exact commit used. Full publication metadata and a DOI have not yet been specified.

## License

The MATLAB and Python source code and accompanying software documentation are licensed under the [MIT License](LICENSE). This permits reuse, modification and redistribution, including commercial use, provided the copyright and permission notice are retained.

This software license does not cover the manuscript, the Excel workbook, the CSV data, network MAT files or simulation-result data and figures. No separate reuse license is granted for those research materials by this notice. Existing third-party notices, where applicable, remain in effect.

For academic use, please cite the manuscript and the repository commit used. This citation request does not add a condition to the MIT License.
