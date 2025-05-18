# size

## Calling Sequence
- `nvec = size (dat)`
- `ndim = size (dat, dim)`
- `[n, p, m, e] = size (dat)`

## Description
Return dimensions of iddata set dat.

## Parameters
- `nvec` (Row vector): Row vector. The first element is the total number of samples (rows of dat.y and dat.u). The second element is the number of outputs (columns of dat.y) and the third element the number of inputs (columns of dat.u). The fourth element is the number of experiments.
- `ndim` (Real scalar): The size of the dimension dim.
- `n` (Row vector): Contains the number of samples of each experiment.
- `p` (Real scalar): Number of outputs.
- `m` (Real scalar): Number of inputs.
- `e` (Real scalar): Number of experiments.
- `dat` (Structure): iddata set.
- `dim` (Real scalar): If given a second argument, size will return the size of the corresponding dimension.

## Examples
1.
```
A = [1, 0; 0, -0.5];
B = [8; 8];
co = ctrb(A, B);
```
```
 co =
   8.   8.
   8.  -4.
```
2.
```
A = [-1 1 + %i; 0 -2];
B = [1; 0];
co = ctrb(A, B);
```
```
at line    13 of function ctrb ( /Users/akashnandan/Desktop/Scilab/Akash_S_CStoolboxfunction/ctrb/ctrb.sci line 13 )

ctrb: invalid arguments (a, b)
```

3.
```
sys = syslin('c',[-2 1;0 -3], [4; 1], [1 0], 0);
co = ctrb(sys);
```
```
co = [2x2 double]

   4.  -7.
   1.  -3.
```

4.
```
A = [1 2 1; 0 1 0; 1 -4 3];
B = [0; 0; 1];
co = ctrb(A, B);
```
```
co = [3x3 double]

   0.   1.   4. 
   0.   0.   0. 
   1.   3.   10.
```

5.
```
co = ctrb();
```
```
at line    20 of function ctrb ( /Users/akashnandan/Desktop/Scilab/Akash_S_CStoolboxfunction/ctrb/ctrb.sci line 20 )

Incorrect number of arguments
```
