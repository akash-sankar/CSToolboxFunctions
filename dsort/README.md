# dsort

## Description
Sorts the input vector discrete-time poles, `p`, by magnitude (in decreasing order).

## Calling Sequence
- `s = dsort(p)`
- `[s, ndx] = dsort(p)`

## Parameters
- `p` (Complex vector): Discrete-time poles.

## Examples
1.
```
p = [0.5, 0.9, 0.3, 1.2];
s = dsort(p)
```
```
s = [1x4 double]

   1.2   0.9   0.5   0.3
```
2.
```
p = [0.5 + %i, -0.7, 1 - %i, 0.9 + 0.1 * %i];
s = dsort(p)
```
```
s = [1x4 double]

   1. - i     0.5 + i     0.9 + 0.1i  -0.7 + 0.i
```
3.
```
p = [0.5, 0.9, 0.3, 1.2];
s = dsort(p)
```
```
s = [1x4 double]

   1.2   0.9   0.5   0.3

ndx = [1x4 double]

   4.   2.   1.   3.
```
4.
```
p = [0.5, 0.9; 0.3, 1.2];
s = dsort(p)
```
```
at line     4 of function dsort ( /Users/akashnandan/Desktop/Scilab/dsort.sci line 4 )

esort: argument must be a vector
```
5.
```
s = dsort()
```
```
at line     7 of function dsort ( /Users/akashnandan/Desktop/Scilab/dsort.sci line 7 )

dsort: One input argument required
```
6.
```
p = [0.5, 0.9; 0.3, 1.2];
[s, ndx] = dsort(p,p)
```
```
at line     2 of function dsort ( /Users/akashnandan/Desktop/Scilab/dsort.sci line 2 )

Wrong number of input arguments.
```
