# Boeing707
## Calling Sequence
- `outsys = Boeing707()`

## Description
Sorts the input vector discrete-time poles, `p`, by magnitude (in decreasing order).

## Parameters
- `p` (Complex vector): Discrete-time poles.

## Examples
1.
```
outsys = Boeing707()
```
```
outsys = [2x2 state-space]

  A (matrix): [4x4 double]
  B (matrix): [4x2 double]
  C (matrix) = [1,0,0,0;0,0,0,1]
  D (matrix) = [0,0;0,0]
  X0 (initial state) = [0;0;0;0]
  dt (time domain) = "c"

outsys.A = [4x4 double]

  -0.046       0.1068142   0.     -0.1712168
  -0.1675902  -0.515       1.      0.0064206
   0.1543104  -0.547945   -0.906  -0.0015217
   0.          0.          1.      0.

outsys.B = [4x2 double]

   0.16023     0.0021118
   0.0081969  -0.03025  
   0.0917359  -0.7528307
   0.          0.     
```
2.
```
outsys = Boeing707(1)
```
```
at line     3 of function Boeing707 ( /Users/akashnandan/Desktop/Scilab/Boeing707.sci line 3 )

Wrong number of input arguments: This function has no input argument.
```
