# @iddata/detrend

## Description
Detrend outputs and inputs of dataset dat by removing the best fit of a polynomial of order ord. If ord is not specified, default value 0 is taken. This corresponds to removing a constant.

## Calling Sequence
- `datout = detrend (dat)`
- `datout = detrend (dat, ord)`

## Parameters
- `datout` (Structure): Output iddata set
- `dat` (Structure): Input iddata set.
- `ord` (Real scalar/String): The order of the polynomial
  - `ord = 0 (or) "constant"`
  - `ord = 1 (or) "linear"`

## Examples
1.
```
DAT = iddata ({[(1:10).', (1:2:20).'], [(10:-1:1).', (20:-2:1).']}, {[(41:50).', (46:55).'], [(61:70).', (-66:-1:-75).']});
DATD = detrend_iddata(DAT)
DATD.u(1)(1)
DATD.u(2)(1)
```
```
DATD = [struct] with fields:

  y: (2-elements list)
      (1): (1-element list)
          (1) = [-4.5,-9;-3.5,-7;-2.5,-5;-1.5,-3;-0.5,-1;0.5,1;1.5,3;2.5,5;3.5,7;4.5,9]
      (2): (1-element list)
          (1) = [4.5,9;3.5,7;2.5,5;1.5,3;0.5,1;-0.5,-1;-1.5,-3;-2.5,-5;-3.5,-7;-4.5,-9]
  outname: (2-elements list)
      (1) = ""
      (2) = ""
  outunit: (2-elements list)
      (1) = ""
      (2) = ""
  u: (2-elements list)
      (1): (1-element list)
          (1): [10x2 double]
      (2): (1-element list)
          (1): [10x2 double]
  inname: (2-elements list)
      (1) = ""
      (2) = ""
  inunit: (2-elements list)
      (1) = ""
      (2) = ""
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

 DATD.u(1)(1) = [10x2 double]

  -4.5  -4.5
  -3.5  -3.5
  -2.5  -2.5
  -1.5  -1.5
  -0.5  -0.5
   0.5   0.5
   1.5   1.5
   2.5   2.5
   3.5   3.5
   4.5   4.5

 DATD.u(2)(1) = [10x2 double]

  -4.5   4.5
  -3.5   3.5
  -2.5   2.5
  -1.5   1.5
  -0.5   0.5
   0.5  -0.5
   1.5  -1.5
   2.5  -2.5
   3.5  -3.5
   4.5  -4.5
```
2.
```
DAT = iddata ({[(1:10).', (1:2:20).'], [(10:-1:1).', (20:-2:1).']}, {[(41:50).', (46:55).'], [(61:70).', (-66:-1:-75).']});
DATD = detrend_iddata(DAT, 'constant')
DATD.u(1)(1)
DATD.u(2)(1)
```
```
DATD = [struct] with fields:

  y: (2-elements list)
      (1): (1-element list)
          (1) = [-4.5,-9;-3.5,-7;-2.5,-5;-1.5,-3;-0.5,-1;0.5,1;1.5,3;2.5,5;3.5,7;4.5,9]
      (2): (1-element list)
          (1) = [4.5,9;3.5,7;2.5,5;1.5,3;0.5,1;-0.5,-1;-1.5,-3;-2.5,-5;-3.5,-7;-4.5,-9]
  outname: (2-elements list)
      (1) = ""
      (2) = ""
  outunit: (2-elements list)
      (1) = ""
      (2) = ""
  u: (2-elements list)
      (1): (1-element list)
          (1): [10x2 double]
      (2): (1-element list)
          (1): [10x2 double]
  inname: (2-elements list)
      (1) = ""
      (2) = ""
  inunit: (2-elements list)
      (1) = ""
      (2) = ""
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

 DATD.u(1)(1) = [10x2 double]

  -4.5  -4.5
  -3.5  -3.5
  -2.5  -2.5
  -1.5  -1.5
  -0.5  -0.5
   0.5   0.5
   1.5   1.5
   2.5   2.5
   3.5   3.5
   4.5   4.5

 DATD.u(2)(1) = [10x2 double]

  -4.5   4.5
  -3.5   3.5
  -2.5   2.5
  -1.5   1.5
  -0.5   0.5
   0.5  -0.5
   1.5  -1.5
   2.5  -2.5
   3.5  -3.5
   4.5  -4.5
```

3.
```
DAT = iddata ({[(1:10).', (1:2:20).'], [(10:-1:1).', (20:-2:1).']}, {[(41:50).', (46:55).'], [(61:70).', (-66:-1:-75).']});
DATD = detrend_iddata(DAT, 1)
DATD.y(1)(1)
DATD.y(2)(1)
DATD.u(1)(1)
DATD.u(2)(1)
```
```
 DATD = [struct] with fields:

  y: (2-elements list)
      (1): (1-element list)
          (1): [10x2 double]
      (2): (1-element list)
          (1): [10x2 double]
  outname: (2-elements list)
      (1) = ""
      (2) = ""
  outunit: (2-elements list)
      (1) = ""
      (2) = ""
  u: (2-elements list)
      (1): (1-element list)
          (1): [10x2 double]
      (2): (1-element list)
          (1): [10x2 double]
  inname: (2-elements list)
      (1) = ""
      (2) = ""
  inunit: (2-elements list)
      (1) = ""
      (2) = ""
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

 DATD.y(1)(1) = [10x2 double]

  -1.110D-15  -4.663D-15
  -8.882D-16  -3.553D-15
  -8.882D-16  -2.665D-15
  -1.776D-15  -1.776D-15
  -8.882D-16  -1.776D-15
  -1.776D-15   0.       
  -1.776D-15   0.       
  -1.776D-15   1.776D-15
   0.          3.553D-15
  -1.776D-15   3.553D-15

 DATD.y(2)(1) = [10x2 double]

  -3.553D-15  -7.105D-15
  -1.776D-15  -3.553D-15
  -1.776D-15  -3.553D-15
  -1.776D-15  -3.553D-15
  -1.776D-15  -3.553D-15
  -8.882D-16  -1.776D-15
  -8.882D-16  -1.776D-15
   0.          0.       
   2.220D-16   4.441D-16
   4.441D-16   8.882D-16

 DATD.u(1)(1) = [10x2 double]

  -2.842D-14  -2.132D-14
  -1.421D-14  -1.421D-14
  -1.421D-14  -1.421D-14
  -1.421D-14  -1.421D-14
  -1.421D-14  -1.421D-14
   0.         -1.421D-14
   0.          0.       
   7.105D-15  -7.105D-15
   1.421D-14   0.       
   1.421D-14   0.       

 DATD.u(2)(1) = [10x2 double]

  -3.553D-14   5.684D-14
  -2.842D-14   4.263D-14
  -2.132D-14   4.263D-14
  -1.421D-14   2.842D-14
  -1.421D-14   2.842D-14
  -1.421D-14   0.       
   0.          0.       
   0.          0.       
   1.421D-14  -1.421D-14
   1.421D-14  -2.842D-14

```

4.
```
DAT = iddata ({[(1:10).', (1:2:20).'], [(10:-1:1).', (20:-2:1).']}, {[(41:50).', (46:55).'], [(61:70).', (-66:-1:-75).']});
DATD = detrend_iddata(DAT,10);
```
```
at line    23 of function detrend_iddata ( C:\Users\Downloads\detrend.sci line 23 )

Only ord = 0 or 1 are supported in Scilab's detrend()
```

5.
```
DAT = iddata ({[(1:10).', (1:2:20).'], [(10:-1:1).', (20:-2:1).']}, {[(41:50).', (46:55).'], [(61:70).', (-66:-1:-75).']});
DATD = detrend_iddata(DAT,'linear', 'constant');
```
```
at line     2 of function detrend_iddata ( C:\Users\KARTHIK\Downloads\detrend.sci line 2 )

Wrong number of input arguments.
```
