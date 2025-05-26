# iddata

## Description
`iddata` creates an identification dataset object from output and input time-domain signals for use in system identification. It supports both single and multi-experiment datasets and optional metadata.

## Calling Sequence
- `dat = iddata(y)`
- `dat = iddata(y, u)`
- `dat = iddata(y, u, tsam)`
- `dat = iddata(y, u, tsam, 'key1', value1, ..., 'keyN', valueN)`

## Input Parameters
- `dat` (struct): Identification dataset containing input, output, sampling time, and optional metadata.
- `y` (Real matrix or cell): Output signal(s).
- `u` (Real matrix or cell ): Input signal(s).
- `tsam` (Real scalar or celL): Sampling time
- `key` (String): Optional metadata key such as `'expname'`, `'inname'`, etc.
- `value`: Corresponding value for the metadata key.

## Optional Key–Value Pairs
- `'expname'` (Cell of strings): Names of the experiments, e.g., `{'exp1', 'exp2', ...}`.
- `'outname'` (Cell of strings): Names of output channels, e.g., `{'y1', 'y2', ...}`.
- `'outunit'` (Cell of strings): Units for output channels.
- `'inname'` (Cell of strings): Names of input channels, e.g., `{'u1', 'u2', ...}`.
- `'inunit'` (Cell of strings): Units for input channels.
- `'tsam'` (Real scalar or cell): Sampling time(s), same meaning as input `tsam`.
- `'timeunit'` (Cell of strings): Units for time, per experiment.
- `'name'` (String): Name of the dataset.
- `'notes'` (String or cell): Additional comments or notes.
- `'userdata'`: User-defined data (metadata or raw data).
