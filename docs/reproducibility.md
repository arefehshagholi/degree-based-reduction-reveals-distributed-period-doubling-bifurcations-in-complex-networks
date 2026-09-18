# Reproducibility status

## Numerical files created by the current runner

| System | Saved variables |
| --- | --- |
| Hénon / mChialvo | `Amat1`, `output_x`, `Beff`, `A`, `params`, `metadata` |
| Rössler | `Amat`, `Xmat`, `A`, `params`, `metadata` |

The coupling arrays and corresponding output arrays are used to plot the bifurcation diagram. The controller saves MAT v7.3 and then attempts to save a PNG at 200 dpi. Metadata records system, network label/filename, parameters, MATLAB version, start time and the manual reading method. It does not record a repository commit or a historical source figure for each workbook entry.

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
5. Confirmed author/publication metadata, a chosen reuse license, and a stable release to cite.

Newly generated runs should be labeled as reruns, with their actual settings and commit recorded. They should not be presented as the original evidence unless that provenance can be established.
