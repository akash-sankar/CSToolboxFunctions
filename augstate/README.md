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
- `[augsys, augsysn] = augstate(sys, inn, stn, outn, ing, outg)`

## Parameters
- `augsys` (State-space/Transfer function): Output system.
- `augsysn` (Structure): Output system information.
- `sys` (State-space/Transfer function): Input system.
- `inn`, `stn`, `outn`, `ing`, `outg` (Vectors): Input variable names, State variable names, Output variable names, Input grouping information and Output grouping information.

## Examples
1.
```
A = [0 1; -2 -3];
B = [0; 1];
C = [1 0];
D = [0];
sys = syslin('c', A, B, C, D);
[augsys, augsysn] = augstate(sys)
```
```
 augsys = [3x1 state-space]

  A (matrix) = [0,1;-2,-3]
  B (matrix) = [0;1]
  C (matrix) = [1,0;1,0;0,1]
  D (matrix) = [0;0;0]
  X0 (initial state) = [0;0]
  dt (time domain) = "c"

 augsysn = [struct] with fields:

  inname = {"u1"}
  stname = {"x1","x2"}
  outname = {"y1","y2","y3"}
  ingroup: [0x0 struct] with no field
  outgroup: [0x0 struct] with no field
```

2.
```
sys = syslin('c',[0 1; -2 -3], [1 0; 0 1], [1 0; 0 1], [0 0;0 0]);
inn = {'Force', 'Torque'};
stn = {'Position', 'Velocity'};
outn = {'Displacement', 'Speed'};
ing = struct('MechanicalForces', 1, 'RotationalForces', 2);
outg = struct('PositionMeasurements', 1, 'VelocityMeasurements', 2);
[augsys, augsysn] = augstate(sys, inn, stn, outn, ing, outg)
augsysn.outname
```
```
 augsys = [4x2 state-space]

  A (matrix) = [0,1;-2,-3]
  B (matrix) = [1,0;0,1]
  C (matrix) = [1,0;0,1;1,0;0,1]
  D (matrix) = [0,0;0,0;0,0;0,0]
  X0 (initial state) = [0;0]
  dt (time domain) = "c"

 augsysn = [struct] with fields:

  inname = {"Force","Torque"}
  stname = {"Position","Velocity"}
  outname: {1x4 cell}
  ingroup: [struct] with fields:
      MechanicalForces = 1
      RotationalForces = 2
  outgroup: [struct] with fields:
      PositionMeasurements = 1
      VelocityMeasurements = 2

 ans = {1x4 cell}

  "Displacement"    "Speed"    "Position"    "Velocity"
```

3.
```
A = [0 1; -2 -3];
B = [0 1; 1 0];
C = [1 0; 0 1];
D = zeros(2,2);
sys = syslin('d', A, B, C, D);
inn = {'Force', 'Torque'};
stn = {'Position', 'Velocity'};
outn = {'Displacement', 'Speed'};
[augsys, augsysn] = augstate(sys, inn, stn, outn)
augsysn.outname
```
```
 augsys = [4x2 state-space]

  A (matrix) = [0,1;-2,-3]
  B (matrix) = [0,1;1,0]
  C (matrix) = [1,0;0,1;1,0;0,1]
  D (matrix) = [0,0;0,0;0,0;0,0]
  X0 (initial state) = [0;0]
  dt (time domain) = "d"

 augsysn = [struct] with fields:

  inname = {"Force","Torque"}
  stname = {"Position","Velocity"}
  outname: {1x4 cell}
  ingroup: [0x0 struct] with no field
  outgroup: [0x0 struct] with no field

 ans = {1x4 cell}

  "Displacement"    "Speed"    "Position"    "Velocity"
```

4.
```
s = poly(0, 's');
sys = syslin('c', 1 / (s^2 + 3*s + 2));
[augsys, augsysn] = augstate(sys)
```
```
WARNING: augstate: system not in state-space form. Converting to syslin.

 augsys = [3x1 state-space]

  A (matrix) = [0,1;-2,-3]
  B (matrix) = [0;1]
  C (matrix) = [1,0;1,0;0,1]
  D (matrix) = [0;0;0]
  X0 (initial state) = [0;0]
  dt (time domain) = "c"

 augsysn = [struct] with fields:

  inname = {"u1"}
  stname = {"x1","x2"}
  outname = {"y1","y2","y3"}
  ingroup: [0x0 struct] with no field
  outgroup: [0x0 struct] with no field
```

5.
```
z = poly(0, 'z');
sys = syslin('d', 1 / (z^2 + 3*z + 2));
[augsys, augsysn] = augstate(sys)
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

 augsysn = [struct] with fields:

  inname = {"u1"}
  stname = {"x1","x2"}
  outname = {"y1","y2","y3"}
  ingroup: [0x0 struct] with no field
  outgroup: [0x0 struct] with no field
```

6.
```
A = [0 1; -2 -3];
B = [0; 1];
C = [1 0];
D = [0];
sys1 = syslin('c', A, B, C, D);
s = poly(0, 's');
sys2 = syslin('c', 1 / (s^2 + 3*s + 2));
[augsys, augsysn] = augstate(sys1, sys2)
```
```
at line    44 of function augstate ( C:\Users\Downloads\CSToolboxFunctions-main\CSToolboxFunctions-main\augstate\augstate.sci line 58 )

augstate: inn should be a cell
```

