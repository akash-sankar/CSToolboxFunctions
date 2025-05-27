# @iddata/vertcat

## Calling Sequence
- `dat = vertcat (dat1, dat2, …)`

## Description
Vertical concatenation of iddata datasets. The samples are concatenated in the following way: dat.y{e} =  [dat1.y{e}; dat2.y{e}; …] dat.u{e} = [dat1.u{e}; dat2.u{e}; …] where e denotes the experiment. The number of experiments, outputs and inputs must be equal for all datasets.

## Parameters
- `dat` (iddata/struct): A single iddata object with all the sample data from inputs vertically concatenated per experiment.
- `dat1, dat2, ...` (iddata/struct): iddata objects with identical I/O dimensions and experiment structure.

## Examples
