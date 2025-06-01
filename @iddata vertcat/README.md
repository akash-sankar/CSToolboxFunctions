# @iddata/vertcat

## Calling Sequence
- `dat = vertcat (dat1, dat2, …)`

## Description
Vertical concatenation of iddata datasets. The samples are concatenated in the following way: dat.y{e} =  [dat1.y{e}; dat2.y{e}; …] dat.u{e} = [dat1.u{e}; dat2.u{e}; …] where e denotes the experiment. The number of experiments, outputs and inputs must be equal for all datasets.

## Parameters
- `dat` (iddata/struct): A single iddata object with all the sample data from inputs vertically concatenated per experiment.
- `dat1, dat2, ...` (iddata/struct): iddata objects with identical I/O dimensions and experiment structure.

## Dependencies
[@iddata/cat](https://github.com/akash-sankar/CSToolboxFunctions/tree/main/%40iddata%20cat)

## Examples
1.
```
dat = vertcat(iddata (1, 1), iddata (2, 2))
```
```
 dat = [struct] with fields:

  y: (1-element list)
      (1) = [1;2]
  outname: (1-element list)
      (1) = ""
  outunit: (1-element list)
      (1) = ""
  u: (1-element list)
      (1) = [1;2]
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
dat = vertcat(iddata (1, 1), iddata (2, 2), iddata(3, 3))
```
```
 dat = [struct] with fields:

  y: (1-element list)
      (1) = [1;2;3]
  outname: (1-element list)
      (1) = ""
  outunit: (1-element list)
      (1) = ""
  u: (1-element list)
      (1) = [1;2;3]
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

3.
```
dat = vertcat(iddata (1, 1), iddata ({2, 3}, {2, 3}))
```
```
at line     4 of function check_experiments ( C:\Users\KARTHIK\Desktop\Scilab\cat_iddata.sci line 112 )
at line    20 of function cat_iddata        ( C:\Users\KARTHIK\Desktop\Scilab\cat_iddata.sci line 20 )
at line     2 of function vertcat           ( C:\Users\KARTHIK\Desktop\Scilab\vertcat.sci line 2 )

iddata: cat: number of experiments do not match
```

4.
```
dat = vertcat()
```
```
at line     2 of function check_domain ( C:\Users\KARTHIK\Desktop\Scilab\cat_iddata.sci line 101 )
at line    16 of function cat_iddata   ( C:\Users\KARTHIK\Desktop\Scilab\cat_iddata.sci line 16 )
at line     2 of function vertcat      ( C:\Users\KARTHIK\Desktop\Scilab\vertcat.sci line 2 )

Invalid index.
```
