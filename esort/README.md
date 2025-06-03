# esort

## Description
Sort continuous-time poles, `p`, by real part (in decreasing order).

## Calling Sequence
- `s = esort(p)`
- `[s, ndx] = esort(p)`

## Parameters
- `p` (vector): Continuous-time poles.

## Dependencies
gsort

## Examples
1.
```
p = [-2, -1, -3, 0, 1];
s = esort(p)
```
```
s = [1x5 double]

   1.   0.  -1.  -2.  -3.
```
2.
```
p = [-1 + %i, 2 - %i, 0.5, -3 - 0.2 * %i];
s = esort(p)
```
```
s = [1x4 double]

   2. - i     0.5 + 0.i  -1. + i    -3. - 0.2i
```
3.
```
p = [-1 + %i, 2 - %i, 0.5, -3 - 0.2 * %i];
s = esort(p)
```
```
s = [1x4 double]

   2. - i     0.5 + 0.i  -1. + i    -3. - 0.2i

ndx = [1x4 double]

   2.   3.   1.   4.
```
4.
```
p = [-1 + %i, 2 - %i; 0.5, -3 - 0.2 * %i];
s = esort(p)
```
```
at line     4 of function esort ( /Users/akashnandan/Desktop/Scilab/esort.sci line 4 )

esort: argument must be a vector
```
5.
```
p = [-1 + %i, 2 - %i; 0.5, -3 - 0.2 * %i];
s = esort(p, p)
```
```
at line     2 of function esort ( /Users/akashnandan/Desktop/Scilab/esort.sci line 2 )

Wrong number of input arguments.
```
5.
```
p = [-1 + %i, 0.5 - %i, 0.5, -3 - 0.2 * %i]; //Poles with same real part
s = esort(p)
```
```
 s = [1x4 double]

   0.5 - i     0.5 + 0.i  -1. + i    -3. - 0.2i
```
6.
```
p = [-1 + %i, 0.5 - %i, 0.5, -3 - 0.2 * %i]; //Poles with same real part
s = esort(p)
```
```
 s = [1x4 double]

   0.5 - i     0.5 + 0.i  -1. + i    -3. - 0.2i
```
7.
```
p = [-1 + %i,- %i, 0.5, - 0.2 * %i]; //Poles with zero real part
s = esort(p)
```
```
s = [1x4 double]

   0.5 + 0.i   0. - i     0. - 0.2i  -1. + i  
```
