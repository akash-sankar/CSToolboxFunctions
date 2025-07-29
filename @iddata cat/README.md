# @iddata/cat

## Description
Concatenate iddata sets along dimension dim.

## Calling Sequence
- `dat = cat_iddata (dim, dat1, dat2, …)`

## Parameters
- `dat` (Structure): Concatenated iddata set.
- `dim` (Real scalar): Dimension along which the concatenation takes place.
  - `dim = 1`: Concatenate samples. The samples are concatenated in the following way: dat.y{e} = [dat1.y{e}; dat2.y{e}; …] dat.u{e} = [dat1.u{e}; dat2.u{e}; …] where e denotes the experiment. The number of experiments, outputs and inputs must be equal for all datasets. Equivalent to vertcat.
  - `dim = 2`: Concatenate inputs and outputs. The outputs and inputs are concatenated in the following way: dat.y{e} = [dat1.y{e}, dat2.y{e}, …] dat.u{e} = [dat1.u{e}, dat2.u{e}, …] where e denotes the experiment. The number of experiments and samples must be equal for all datasets. Equivalent to horzcat.
  - `dim = 3`: Concatenate experiments. The experiments are concatenated in the following way: dat.y = [dat1.y; dat2.y; …] dat.u = [dat1.u; dat2.u; …]. The number of outputs and inputs must be equal for all datasets. Equivalent to merge.
- `dat1, dat2, …` (Structure): iddata sets to be concatenated.

## Dependencies
[iddata](https://github.com/akash-sankar/CSToolboxFunctions/tree/main/iddata)

## Examples
1.
```
dat = cat_iddata(1, iddata (1, 1), iddata (2,2))
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
dat = cat_iddata(2, iddata (1, 1), iddata (2, 2))
```
```
 dat = [struct] with fields:

  y: (1-element list)
      (1) = [1,2]
  outname: (2-elements list)
      (1) = ""
      (2) = ""
  outunit: (2-elements list)
      (1) = ""
      (2) = ""
  u: (1-element list)
      (1) = [1,2]
  inname: (2-elements list)
      (1) = ""
      (2) = ""
  inunit: (2-elements list)
      (1) = ""
      (2) = ""
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
dat = cat_iddata(3, iddata (1, 1), iddata (2, 2))
```
```
 dat = [struct] with fields:

  y: (2-elements list)
      (1) = 1
      (2) = 2
  outname: (1-element list)
      (1) = ""
  outunit: (1-element list)
      (1) = ""
  u: (2-elements list)
      (1) = 1
      (2) = 2
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

4.
```
dat = cat_iddata(1, iddata (1, 1), iddata ({2, 3}, {2, 3}))
```
```
at line     4 of function check_experiments ( C:\Users\KARTHIK\Desktop\Scilab\cat_iddata.sci line 112 )
at line    20 of function cat_iddata        ( C:\Users\KARTHIK\Desktop\Scilab\cat_iddata.sci line 20 )

iddata: cat: number of experiments do not match
```

5.
```
cat_iddata(1, iddata (1, 1), iddata (2,2), iddata (3,3))
```
```
 ans = [struct] with fields:

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
