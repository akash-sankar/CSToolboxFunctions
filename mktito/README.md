# mktito

## Description
Partition LTI plant P for robust controller synthesis. If a plant is partitioned this way, one can omit the inputs nmeas and ncon when calling the functions hinfsyn and h2syn.
```
 min||N(K)||             N = lft (P, K)
  K         norm

                +--------+  
   w = u1 ----->|        |-----> z = y1
                |  P(s)  |
   u = u2 +---->|        |-----+ y = y2
          |     +--------+     |
          |                    |
          |     +--------+     |
          +-----|  K(s)  |<----+
                +--------+

                +--------+      
   w = u1 ----->|  N(s)  |-----> z = y1
                +--------+
```
Reference: [1] Skogestad, S. and Postlethwaite, I. (2005) Multivariable Feedback Control: Analysis and Design: Second Edition. Wiley, Chichester, England.

NOTE: LTI system in Scilab cannot store `outgroup`, `ingroup`, `inname` and `outname`. So a separate structure, `P_inout`, is used to store those fields.

## Calling Sequence
- `P_out = mktito (P, nmeas, ncon)`

## Parameters
- `P_out` (State-space/Transfer function): Partitioned plant. The input/output groups and names are overwritten with designations according to [1].
- `P` (State-space/Transfer function): Generalized plant.
- `nmeas` (Real scalar): Number of measured outputs v. The last nmeas outputs of P are connected to the inputs of controller K. The remaining outputs z (indices 1 to p-nmeas) are used to calculate the H-2/H-infinity norm.
- `ncon` (Real scalar): Number of controlled inputs u. The last ncon inputs of P are connected to the outputs of controller K. The remaining inputs w (indices 1 to m-ncon) are excited by a harmonic test signal.

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
[P, P_inout]=mktito(SYS,1,2)
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
at line    18 of function mktito ( C:\Users\KARTHIK\Desktop\Scilab\mktito.sci line 18 )

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
at line    22 of function mktito ( C:\Users\KARTHIK\Desktop\Scilab\mktito.sci line 22 )

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
at line     4 of function mktito ( C:\Users\KARTHIK\Desktop\Scilab\mktito.sci line 4 )

Usage: P = mktito(P, nmeas, ncon)
```
