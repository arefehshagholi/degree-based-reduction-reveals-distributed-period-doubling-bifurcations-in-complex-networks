# Data provenance and suggested coupling ranges

## Critical-point workbook

`manually_created_critical_points.xlsx` is the original author-supplied workbook, restored byte-for-byte. No cells, formulas, formatting or sheet names were changed during restoration. The checksum is recorded in `checksums.sha256`.

The sheet names are `Rossler system `, `mChialvo system ` and `Henon system ` (including their original trailing spaces). Each covers 22 network labels, with multiple rows where present.

| Workbook field | Interpretation |
| --- | --- |
| First column (`Network` or original spelling `Newtwork`) | Network label |
| `m` / `C` | Original grouping field; its precise interpretation should be checked against the manuscript |
| `B_eff ` | Tabulated effective parameter |
| `CPn(pred)` | Supplied model prediction for the indicated critical point |
| `CPn(Real)` | Critical point read manually from a bifurcation diagram |
| Relative and signed relative error columns | Author-supplied comparison values; preserved unchanged |

Rössler and mChialvo include CP1–CP3; Hénon includes CP1–CP2. `Real` denotes a visual reading, not an automatic estimate or an exact ground-truth value. Blank cells remain missing, not zero. No uncertainty bounds or numerical detection accuracy are inferred from the displayed decimal precision.

The historical workflow was simulation, saved numerical/figure output, visual identification of transitions, then manual entry into this workbook. The original figures and numerical outputs supporting all entries are not currently included. The exact reading criterion, refinement procedure and historical run settings remain to be documented by the author.

## Shared network inputs

`networks/` contains 22 MAT files with adjacency matrix `A`. They are simulation inputs, not trajectories or bifurcation figures.

| Workbook labels | MAT filenames |
| --- | --- |
| `Complete` | `completenet.mat` |
| `Regular1`–`Regular5` | `regularnet1.mat`–`regularnet5.mat` |
| `WS1`–`WS5` | `WattsStrogatz1.mat`–`WattsStrogatz5.mat` |
| `NW1`–`NW5` | `NewmanWatts1.mat`–`NewmanWatts5.mat` |
| `SF1`–`SF5` | `BAnet1.mat`–`BAnet5.mat` |
| `Star` | `starnet.mat` |

## Separate range catalog

`network_ranges.csv` contains one row per system/network pair (66 rows). Columns are `system`, `network_label`, `network_file`, `suggested_min` and `suggested_max`.

The existing builder groups workbook rows by network label. It reads positive finite numeric values from D–I for Rössler/mChialvo and D–G for Hénon, using cached cell values. It sets the minimum to zero and the maximum to 1.10 times the largest available critical point. Both predicted and manually read values contribute.

Thus the source critical-point entries are manually curated, while the supplied ranges are generated heuristic suggestions. They are not independently measured boundaries. Users may override a range in the MATLAB prompt without changing the workbook or CSV.

With Python 3 and `openpyxl`, run from this directory:

```bash
python build_range_catalog.py
```

The script overwrites the CSV and checks that referenced network files exist. Restoration validation confirmed 66 rows, 22 per system, and identical CSV field values after regeneration from the restored workbook.

## Results

New runs save MAT numerical output and PNG figures under the corresponding system's `results/` directory. They do not update this workbook. See [reproducibility details](../docs/reproducibility.md) for the saved variables and remaining validation work.
