# @lti/ctranspose

## Description
Conjugate transpose or pertransposition of LTI objects. Used by Octave for "sys’". For a transfer-function matrix G, G’ denotes the conjugate of G given by G.’(-s) for a continuous-time system or G.’(1/z) for a discrete-time system. The frequency response of the pertransposition of G is the Hermitian (conjugate) transpose of G(jw), i.e. freqresp (G’, w) = freqresp (G, w)’. WARNING: Do NOT use this for dual problems, use the transpose "sys.’" (note the dot) instead.

## Calling Sequence
- `[sysout, eout, sysn] = ctranspose(sys, ein)`

## Parameters
- `sys` (State-space/Rational): System to be transposed.
- `ein` (Real matrix): Descriptor matrix (n-by-n).
- `sysout` (State-space): Conjugate transposed of sys.
- `eout` (Real matrix): Measurement matrix (p-by-n).
- `sysn` (Structure): System input, state and output names of sysout.

## Dependencies
[@lti/size](https://github.com/akash-sankar/CSToolboxFunctions/tree/main/%40lti%20size)

## Examples
1.
```
A = [0 1; -2 -3];
B = [0 1 0 0; 1 0 1 1];
C = [1 0; 0 1; 1 1];
D = zeros(3,4);
P = syslin("c", A, B, C, D);
[P, P_inout] = mktito(P, 1, 2)
```
```
 P = [3x4 state-space]

  A (matrix) = [0,1;-2,-3]
  B (matrix) = [0,1,0,0;1,0,1,1]
  C (matrix) = [1,0;0,1;1,1]
  D (matrix) = [0,0,0,0;0,0,0,0;0,0,0,0]
  X0 (initial state) = [0;0]
  dt (time domain) = "c"

 P_inout = [struct] with fields:

  outgroup: [struct] with fields:
      Y1 = [1,2]
      Y2 = 3
  ingroup: [struct] with fields:
      U1 = [1,2]
      U2 = [3,4]
  outname = ["y1";"y2";"y3"]
  inname = ["u1";"u2";"u3";"u4"]
```

2.
```
A = [0 1; -2 -3];
B = [0 1 0 0; 1 0 1 1];
C = [1 0; 0 1; 1 1];
D = zeros(3,4);
P = syslin("c", A, B, C, D);
P = ss2tf(P);
[P, P_inout]=mktito(P,1,2)
```
```
 P = [3x4 state-space]

  A (matrix) = [-0.4615385,0.5704768;-1.4521228,-2.5384615]
  B (matrix) = [0,-0.6793662,0,0;-1.1908744,-0.5496343,-1.1908744,-1.1908744]
  C (matrix) = [-1.4719601,2.776D-17;0.6793662,-0.8397191;-0.7925939,-0.8397191]
  D (matrix) = [0,0,0,0;0,0,0,0;0,0,0,0]
  X0 (initial state) = [0;0]
  dt (time domain) = "c"

 P_inout = [struct] with fields:

  outgroup: [struct] with fields:
      Y1 = [1,2]
      Y2 = 3
  ingroup: [struct] with fields:
      U1 = [1,2]
      U2 = [3,4]
  outname = ["y1";"y2";"y3"]
  inname = ["u1";"u2";"u3";"u4"]
```

3.
```
A = [0 1; -2 -3];
B = [0 1 0 0; 1 0 1 1];
C = [1 0; 0 1; 1 1];
D = zeros(3,4);
P = syslin("c", A, B, C, D);
[P, P_inout] = mktito(P, 0, 2)
```
```
at line    18 of function mktito ( C:\Users\Desktop\Scilab\mktito.sci line 18 )

mktito: second argument 'nmeas' invalid
```

4.
```
A = [0 1; -2 -3];
B = [0 1 0 0; 1 0 1 1];
C = [1 0; 0 1; 1 1];
D = zeros(3,4);
P = syslin("c", A, B, C, D);
[P, P_inout] = mktito(P, 1, 0)
```
```
at line    22 of function mktito ( C:\Users\Desktop\Scilab\mktito.sci line 22 )

mktito: third argument 'ncon' invalid
```

5.
```
A = [0 1; -2 -3];
B = [0 1 0 0; 1 0 1 1];
C = [1 0; 0 1; 1 1];
D = zeros(3,4);
P = syslin("c", A, B, C, D);
[P, P_inout] = mktito(P)
```
```
at line     4 of function mktito ( C:\Users\Desktop\Scilab\mktito.sci line 4 )

Usage: P = mktito(P, nmeas, ncon)
```
