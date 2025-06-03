# acker

## Description
Calculates the state feedback matrix of a completely controllable SISO system using Ackermann’s formula.
Given the state-space system
$\dot x = Ax + bu$
and the desired eigenvalues of the closed loop in the vector p, the state feedback vector k is calculated in the form 
$k = (k_1 k_2 ... k_n)$
such that the closed loop system matrix 
$A - b\,k$
has the eigenvalues given in p.

## Calling Sequence
- `k = acker (A, b, p)`

## Parameters
- `k` (Real row vector): State Feedback Gain Vector.
- `A` (Real square matrix): State matrix of the system in state-space form (n-by-n).
- `b` (Real matrix): Input matrix.
- `P` (Real vector):Desired Poles.

## Dependecies
ctrb

## Examples
1.
```
A = [1 1; 1 2];
B = [1; 0];
P = roots ([1 11 30]);
K = acker(A,B,P)
```
```
 K = [1x2 double]

   14.   57.
```
2.
```
A = [1 1];
B = [1; 0];
P = roots ([1 11 30]);
K = acker(A,B,P)
```
```
at line     8 of function acker ( C:\Users\Desktop\Scilab\acker.sci line 8 )

acker: matrix A and vector b not conformal
```

3.
```
A = [1 1];
B = [1; 0];
K = acker(A,B)
```
```
at line     4 of function acker ( C:\Users\Desktop\Scilab\acker.sci line 4 )

Usage: k = acker(A, b, p)
```

4.
```
A = [1 2; 3 4];
B = [1 2];
P = [-2 -3];
K = acker(A, B, P)
```
```
at line     8 of function acker ( C:\Users\Desktop\Scilab\acker.sci line 8 )

acker: matrix A and vector b not conformal
```

5.
```
A = [1 0; 0 1];
B = [0; 1];
P = 'abc';
K = acker(A, B, P)
```
```
at line    12 of function acker ( C:\Users\Desktop\Scilab\acker.sci line 12 )

acker: p must be a vector of size 2
```
