# Data and range catalog

This directory contains the shared network inputs, the author-curated critical-point workbook, and the generated simulation-range catalog.

## Files

| File | Purpose |
| --- | --- |
| `networks/` | 22 shared input adjacency matrices used by all three dynamical systems |
| `manually_created_critical_points.xlsx` | Author-curated predicted and manually read critical points |
| `network_ranges.csv` | Generated range catalog used by the interactive MATLAB runner |
| `build_range_catalog.py` | Rebuilds `network_ranges.csv` from the workbook |

The network `.mat` files are inputs, not simulation outputs.

## Workbook provenance

The workbook contains the critical-point values used for the range catalog. Critical points labeled `Real` were read manually from bifurcation diagrams and entered into the table; predicted columns contain the corresponding model predictions. Blank cells are left as missing values and are not interpreted as zero.

The workbook contains three sheets: `Rossler system`, `mChialvo system`, and `Henon system`. Together they cover the same 22 network topologies used by the simulations.

## Suggested ranges

For each system/network pair, the builder takes all positive finite predicted and manually read critical-point values and writes:

```text
suggested_min = 0
suggested_max = 1.10 × max(available critical-point values)
```

These intervals are starting suggestions, not automatically detected bifurcation boundaries or validated stability limits.

## Regeneration

From this directory run:

```bash
python build_range_catalog.py
```

Requirements: Python 3 and `openpyxl`.

The script verifies that each referenced adjacency matrix exists in `data/networks/`, then overwrites `network_ranges.csv`.

## Outputs

Simulation-result `.mat` files and generated `.png` figures are intentionally not stored in the repository. They are created locally when the MATLAB workflows are run.
