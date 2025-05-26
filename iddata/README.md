# iddata

## Description
`iddata` creates an identification dataset object from output and input time-domain signals for use in system identification. It supports both single and multi-experiment datasets and optional metadata.

## Calling Sequence
- `dat = iddata(y)`
- `dat = iddata(y, u)`
- `dat = iddata(y, u, tsam)`
- `dat = iddata(y, u, tsam, 'key1', value1, ..., 'keyN', valueN)`

## Input Parameters

| Parameter | Type                      | Description |
|-----------|---------------------------|-------------|
| `y`       | Real matrix or cell       | Output signal(s). For single experiment: `n-by-p` matrix. For multiple experiments: cell vector of `n(i)-by-p` matrices. |
| `u`       | Real matrix or cell       | Input signal(s). For single experiment: `n-by-m` matrix. For multiple experiments: cell vector of `n(i)-by-m` matrices. Optional. If omitted or `[]`, dataset is treated as time series. |
| `tsam`    | Real scalar or cell       | Sampling time. If scalar: same `tsam` for all experiments. If cell: individual `tsam` per experiment. Optional; default is `-1`. |
| `'key'`   | String                    | Optional metadata key such as `'expname'`, `'inname'`, etc. |
| `value`   | Various                   | Corresponding value for the metadata key. |
