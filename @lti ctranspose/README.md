# @lti/ctranspose

## Description
Conjugate transpose or pertransposition of LTI objects. Used by Octave for "sys’". For a transfer-function matrix G, G’ denotes the conjugate of G given by G.’(-s) for a continuous-time system or G.’(1/z) for a discrete-time system. The frequency response of the pertransposition of G is the Hermitian (conjugate) transpose of G(jw), i.e. freqresp (G’, w) = freqresp (G, w)’. WARNING: Do NOT use this for dual problems, use the transpose "sys.’" (note the dot) instead.

## Calling Sequence
- `[sysout, eout, sysn] = ctranspose(sys, ein)` - For typeof(sys) == "state-space"
- `sysout = ctranspose(sys)` - For typeof(sys) == "rational"

## Parameters
- `sys` (State-space/Rational): System to be transposed.
- `ein` (Real matrix): Descriptor matrix (n-by-n).
- `sysout` (State-space/Rational): Conjugate transposed of sys.
- `eout` (Real matrix): Measurement matrix (p-by-n).
- `sysn` (Structure): System input, state and output names of sysout.

## Dependencies
[@lti/size](https://github.com/akash-sankar/CSToolboxFunctions/tree/main/%40lti%20size)

## Examples
1.
```
sys = syslin('c',[0 1; -2 -3], [1 0; 0 1], [1 0; 0 1], [0 0;0 0]);
[sys, eout, sysn] = ctranspose(sys)
```
```
 sys = [2x2 state-space]

  A (matrix) = [0,2;-1,3]
  B (matrix) = [-1,0;0,-1]
  C (matrix) = [1,0;0,1]
  D (matrix) = [0,0;0,0]
  X0 (initial state) = [0;0]
  dt (time domain) = "c"

 eout = 

    []

 sysn = [struct] with fields:

  stname = {"";""}
  inname = {"";""}
  outname = {"";""}
  ingroup: [0x0 struct] with no field
  outgroup: [0x0 struct] with no field
```

2.
```
sys = syslin('c',[0 1; -2 -3], [1 0; 0 1], [1 0; 0 1], [0 0;0 0]);
[sys, eout, sysn] = ctranspose(sys, [1 0; 0 0])
```
```
 sys = [2x2 state-space]

  A (matrix) = [0,2;-1,3]
  B (matrix) = [-1,0;0,-1]
  C (matrix) = [1,0;0,1]
  D (matrix) = [0,0;0,0]
  X0 (initial state) = [0;0]
  dt (time domain) = "c"

 eout = [2x2 double]

   1.   0.
   0.   0.

 sysn = [struct] with fields:

  stname = {"";""}
  inname = {"";""}
  outname = {"";""}
  ingroup: [0x0 struct] with no field
  outgroup: [0x0 struct] with no field
```

3.
```
s = poly(0, 's');
sys = syslin('c', 1 / (s^2 + 3*s + 2));
sys = ctranspose(sys)
```
```
 sys = [rational] of s

   1 +2.587D-16s  
   -------------  
    2 -3s +s^2 
```

4.
```
sys = syslin('c', [1+%i, 2; 0, 3-%i], [0; 1+2*%i], [1-%i, 0], 0.5*%i); 
ein = [1, 0; 0, 2+%i];
[sysout, eout, sysn] = ctranspose(sys, ein)
```
```
 sysout = [state-space]

  A (matrix) = [-1-%i,0;-2,-3+%i]
  B (matrix) = [-1+%i;0]
  C (matrix) = [0,1+%i*2]
  D (matrix) = %i*0.5
  X0 (initial state) = [0;0]
  dt (time domain) = "c"

 eout = [2x2 double]

   1. + 0.i   0. + 0.i
   0. + 0.i   2. + i  

 sysn = [struct] with fields:

  stname = {"";""}
  inname = {""}
  outname = {""}
  ingroup: [0x0 struct] with no field
  outgroup: [0x0 struct] with no field
```

5.
```
sys1 = syslin('c',[0 1; -2 -3], [1 0; 0 1], [1 0; 0 1], [0 0;0 0]);
sys2 = syslin('c',[4 5; 6 7], [1 0; 0 1], [1 0; 0 0], [1 0; 0 1]);
[sys, eout, sysn] = ctranspose(sys1, sys2)
```
```
at line     8 of function ctranspose ( C:\Users\Desktop\ctranspose.sci line 8 )

ctranspose: ein must be an array
```

6.
```
sys1 = syslin('c',[0 1; -2 -3], [1 0; 0 1], [1 0; 0 1], [0 0;0 0]);
sys2 = syslin('c',[4 5; 6 7], [1 0; 0 1], [1 0; 0 0], [1 0; 0 1]);
[sys, eout, sysn] = ctranspose(sys1, [1 0; 0 0], sys2, [1 0; 0 1])
```
```
at line     3 of function ctranspose ( C:\Users\Desktop\ctranspose.sci line 3 )

Wrong number of input arguments.
```
