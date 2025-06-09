# @iddata/detrend

## Description
Detrend outputs and inputs of dataset dat by removing the best fit of a polynomial of order ord. If ord is not specified, default value 0 is taken. This corresponds to removing a constant.

It was observed that while the inbuilt detrend function performs well for larger values, discrepancies arise when dealing with values closer to zero. 

## Calling Sequence
- `datout = detrend (dat)`
- `datout = detrend (dat, ord)`

## Parameters
- `datout` (Structure): Output iddata set
- `dat` (Structure): Input iddata set.
- `ord` (Real scalar/String): The order of the polynomial
  - `ord = 0 (or) "constant"`
  - `ord = 1 (or) "linear"`

## Dependencies
[@iddata/size](https://github.com/akash-sankar/CSToolboxFunctions/tree/main/%40iddata%20size)

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
t = 0:20;
Y = 3*sin(t) + t;
U = 3*cos(t) + t;
dat = iddata(Y',U');
D = detrend_iddata(dat,'linear')
DATD.y(1)(1)
DATD.y(2)(1)
DATD.u(1)(1)
DATD.u(2)(1)
```
```
 D = [struct] with fields:

  y: (1-element list)
      (1): (1-element list)
          (1): [21x1 double]
  outname: (1-element list)
      (1) = ""
  outunit: (1-element list)
      (1) = ""
  u: (1-element list)
      (1): (1-element list)
          (1): [21x1 double]
  inname: (1-element list)
      (1) = ""
  inunit: (1-element list)
      (1) = ""
  tsam: (1-element list)
      (1) = -1.000000000000000000D+00
  timeunit = ""
  timedomain = %t
  w: (empty list)
  expname: (1-element list)
      (1) = ""
  name = ""
  notes: (empty list)
  userdata = []
  type = "iddata"

 D.y(1)(1) = [21x1 double]

  -4.281748407313681337D-01
   2.124795285130889333D+00
   2.356831782622813343D+00
   8.085669776393844543D-02
  -2.584353640900879157D+00
  -3.162161807527941626D+00
  -1.095078306696735559D+00
   1.742685155494978488D+00
   2.768357270647323176D+00
   1.065195157941017712D+00
  -1.774666459013793940D+00
  -3.114016574559228090D+00
  -1.695207537469853420D+00
   1.203569498449940767D+00
   2.943447626493199465D+00
   1.951046251318508951D+00
  -8.349700477094703643D-01
  -2.826895401914377715D+00
  -2.167107495152167829D+00
   5.640430455902887275D-01
   2.881804340222881677D+00

 D.u(1)(1) = [21x1 double]

   2.965209432047589022D+00
   1.567600998348205987D+00
  -1.320261780201442470D+00
  -3.060314111665153547D+00
  -2.069782835758454898D+00
   7.236192319182581656D-01
   2.734628184175875276D+00
   2.097308735950888625D+00
  -6.194134798086690097D-01
  -2.934819515340659990D+00
  -2.737158668219787927D+00
  -2.251823383300806114D-01
   2.274587092599441362D+00
   2.446850209448751201D+00
   1.162061684178627985D-01
  -2.591584576085905312D+00
  -3.204014629783397794D+00
  -1.175041554271835764D+00
   1.612883233311389830D+00
   2.579531611835360394D+00
   8.191485914117251355D-01
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
