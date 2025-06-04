# iddata

## Description
`iddata` creates an identification dataset object from output and input time-domain signals for use in system identification. It supports both single and multi-experiment datasets and optional metadata.

## Calling Sequence
- `dat = iddata(y)`
- `dat = iddata(y, u)`
- `dat = iddata(y, u, tsam)`
- `dat = iddata(y, u, tsam, 'key1', value1, ..., 'keyN', valueN)`

## Input Parameters
- `dat` (struct): iddata set containing input, output, sampling time, and optional metadata.
- `y` (Real matrix or cell): Output signal(s).
- `u` (Real matrix or cell ): Input signal(s).
- `tsam` (Real scalar or cell): Sampling time
- `key` (String): Optional metadata key such as `'expname'`, `'inname'`, etc.
- `value` (Real/Complex scalar/vector/matrix or String or Cell): Corresponding value for the metadata key.

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

## Examples
1.
```
dat = iddata((1:6)',(1:6)')
```
```
 dat = [struct] with fields:

  y: (1-element list)
      (1) = [1;2;3;4;5;6]
  outname: (1-element list)
      (1) = ""
  outunit: (1-element list)
      (1) = ""
  u: (1-element list)
      (1) = [1;2;3;4;5;6]
  inname: (1-element list)
      (1) = ""
  inunit: (1-element list)
      (1) = ""
  tsam: (1-element list)
      (1) = -1
  timeunit = ""
  timedomain = %t
  w: (empty list)
  expname: (1-element list)
      (1) = ""
  name = ""
  notes: (empty list)
  userdata = []
  type = "iddata"
```
2.
```
dat = iddata((1:6)',(1:6)',2)
```
```
 dat = [struct] with fields:

  y: (1-element list)
      (1) = [1;2;3;4;5;6]
  outname: (1-element list)
      (1) = ""
  outunit: (1-element list)
      (1) = ""
  u: (1-element list)
      (1) = [1;2;3;4;5;6]
  inname: (1-element list)
      (1) = ""
  inunit: (1-element list)
      (1) = ""
  tsam: (1-element list)
      (1) = 2
  timeunit = ""
  timedomain = %t
  w: (empty list)
  expname: (1-element list)
      (1) = ""
  name = ""
  notes: (empty list)
  userdata = []
  type = "iddata"
```

3.
```
dat = iddata((1:6)',(1:6)',-1,'outname','Output','inname','Input','expname','Experiment 1')
```
```
 dat = [struct] with fields:

  y: (1-element list)
      (1) = [1;2;3;4;5;6]
  outname: (1-element list)
      (1) = "Output"
  outunit: (1-element list)
      (1) = ""
  u: (1-element list)
      (1) = [1;2;3;4;5;6]
  inname: (1-element list)
      (1) = "Input"
  inunit: (1-element list)
      (1) = ""
  tsam: (1-element list)
      (1) = -1
  timeunit = ""
  timedomain = %t
  w: (empty list)
  expname: (1-element list)
      (1) = "Experiment 1"
  name = ""
  notes: (empty list)
  userdata = []
  type = "iddata"
```

4.
```
dat = iddata()
```
```
at line     3 of function iddata ( C:\Users\KARTHIK\Desktop\Scilab\iddata.sci line 3 )

Wrong number of input arguments
```

5.
```
dat = iddata((1:6)',(1:7)')
```
```
at line    13 of function __experiment_dim__ ( C:\Users\KARTHIK\Desktop\Scilab\iddata.sci line 104 )
at line    13 of function __iddata_dim__     ( C:\Users\KARTHIK\Desktop\Scilab\iddata.sci line 69 )
at line    19 of function iddata             ( C:\Users\KARTHIK\Desktop\Scilab\iddata.sci line 19 )

iddata: matrices y and u must have same number of rows
```
6.
```
dat = iddata({2, 3}, {2, 3})
```
```
 dat = [struct] with fields:

  y: (2-elements list)
      (1): (1-element list)
          (1) = 2
      (2): (1-element list)
          (1) = 3
  outname: (1-element list)
      (1) = ""
  outunit: (1-element list)
      (1) = ""
  u: (2-elements list)
      (1): (1-element list)
          (1) = 2
      (2): (1-element list)
          (1) = 3
  inname: (1-element list)
      (1) = ""
  inunit: (1-element list)
      (1) = ""
  tsam: (2-elements list)
      (1) = -1
      (2) = -1
  timeunit = ""
  timedomain = %t
  w: (empty list)
  expname: (2-elements list)
      (1) = ""
      (2) = ""
  name = ""
  notes: (empty list)
  userdata = []
  type = "iddata"
```
