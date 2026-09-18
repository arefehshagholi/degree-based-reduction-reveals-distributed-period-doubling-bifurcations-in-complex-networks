# Reproducibility status

## Numerical files created by the current runner

| System | Saved variables |
| --- | --- |
| Hénon / mChialvo | `Amat1`, `output_x`, `Beff`, `A`, `params`, `metadata` |
| Rössler | `Amat`, `Xmat`, `A`, `params`, `metadata` |

The coupling arrays and corresponding output arrays are used to plot the bifurcation diagram. The controller saves MAT v7.3 and then attempts to save a PNG at 200 dpi. Metadata records system, network label/filename, parameters, MATLAB version, start time and the manual reading method. It does not record a repository commit or a historical source figure for each workbook entry.

## Cluster reporting

After plotting, the runner calls the existing `calc_beff(A)` and groups nodes by exact equality of `sum(A,2)`. Cluster IDs follow ascending degree, matching the existing beta ordering. The Command Window and the new `_clusters.csv` report `ClusterID`, `Degree`, `NodeCount`, `BetaEff` and `NodeIDs`.

The MAT file additionally stores `cluster_summary`, `node_cluster` and `Beff` for every system. `node_cluster(i)` gives the cluster ID of node `i`, where node IDs are 1-based row indices in `A`. Cluster metadata is appended after the figure is drawn. The original beta formula and simulation equations are unchanged. If the original beta calculation produces an undefined value, it is preserved and a warning is displayed.

The reporting addition has not been executed in MATLAB in the preparation environment.

## Checks performed during data restoration

- The restored workbook matches the original author upload byte-for-byte (62,784 bytes).
- Its ZIP container passes integrity checking and all three worksheets can be read.
- Running the existing range builder with this workbook reproduces all existing CSV field values: 66 rows, with 22 unique networks per system.
- All 22 referenced network inputs exist.
- No MATLAB or Python source file was modified in this restoration/documentation update.

These checks validate file integrity and range generation. They do not validate the scientific critical-point values. MATLAB simulations have not been executed end to end in this preparation environment.

## Evidence still needed for complete table reproduction

1. Original numerical outputs and figures supporting the manual readings, with a mapping to workbook rows or node/cluster identifiers.
2. Historical coupling grids, seeds, initialization, transient settings and solver settings where available.
3. The visual criterion used to identify each transition, refinement procedure, treatment of ambiguous cases and meaning of missing entries.
4. MATLAB execution checks for each dynamical system and comparison with representative manuscript results.
5. Confirmed author/publication metadata, a stable release to cite, and a separate reuse license for research data. The software license is provided in `LICENSE`.

Newly generated runs should be labeled as reruns, with their actual settings and commit recorded. They should not be presented as the original evidence unless that provenance can be established.
