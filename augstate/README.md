# augstate

## Description
Append state vector x of system sys to output vector y.
```
 .                  .
 x = A x + B u      x = A x + B u
 y = C x + D u  =>  y = C x + D u
                    x = I x + O u
```

NOTE: tf2ss function of GNU Octave uses Wolovich’s Observable Structure Theorem while Scilab uses a different approach (h=C*(s*eye()-A)^-1*B+D(s)). So when a transfer function is given as input, the resultant state space representation may not match between GNU Octave & Scilab. But both forms produce identical input-output behavior.

## Calling Sequence
- `augsys = augstate (sys)`

## Parameters
- `augsys` (State-space/Transfer function): Output system.
- `sys` (State-space/Transfer function): Input system.

## Examples
1.
```
A = [0 1; -2 -3];
B = [0; 1];
C = [1 0];
D = [0];
sys = syslin('c', A, B, C, D);
augsys = augstate(sys)
```
```
 aug_sys1 = [3x1 state-space]

  A (matrix) = [0,1;-2,-3]
  B (matrix) = [0;1]
  C (matrix) = [1,0;1,0;0,1]
  D (matrix) = [0;0;0]
  X0 (initial state) = [0;0]
  dt (time domain) = "c"
```

2.
```
A = [0 1; -2 -3];
B = [0 1; 1 0];
C = [1 0; 0 1];
D = zeros(2,2);
sys = syslin('d', A, B, C, D);
augsys = augstate(sys)
```
```
 augsys = [4x2 state-space]

  A (matrix) = [0,1;-2,-3]
  B (matrix) = [0,1;1,0]
  C (matrix) = [1,0;0,1;1,0;0,1]
  D (matrix) = [0,0;0,0;0,0;0,0]
  X0 (initial state) = [0;0]
  dt (time domain) = "d"
```

3.
```
s = poly(0, 's');
sys = syslin('c', 1 / (s^2 + 3*s + 2));
augsys = augstate(sys)
```
```
WARNING: augstate: system not in state-space form. Converting to syslin.

 aug_sys5 = [3x1 state-space]

  A (matrix) = [0,1;-2,-3]
  B (matrix) = [0;1]
  C (matrix) = [1,0;1,0;0,1]
  D (matrix) = [0;0;0]
  X0 (initial state) = [0;0]
  dt (time domain) = "c"
```

4.
```
z = poly(0, 'z');
sys = syslin('d', 1 / (z^2 + 3*z + 2));
augsys = augstate(sys)
```
```
WARNING: augstate: system not in state-space form. Converting to syslin.

 augsys = [3x1 state-space]

  A (matrix) = [0,1;-2,-3]
  B (matrix) = [0;1]
  C (matrix) = [1,0;1,0;0,1]
  D (matrix) = [0;0;0]
  X0 (initial state) = [0;0]
  dt (time domain) = "d"
```

5.
```
A = [0 1; -2 -3];
B = [0; 1];
C = [1 0];
D = [0];
sys1 = syslin('c', A, B, C, D);
s = poly(0, 's');
sys2 = syslin('c', 1 / (s^2 + 3*s + 2));
augsys = augstate(sys1, sys2)
```
```
at line     2 of function augstate ( C:\Users\KARTHIK\Desktop\Scilab\augstate.sci line 2 )

Wrong number of input arguments.
```

