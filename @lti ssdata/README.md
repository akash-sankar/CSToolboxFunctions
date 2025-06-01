# @lti/ssdata

## Calling Sequence
- `[a, b, c, d, tsam] = ssdata (sys)`

## Description
Access state-space model data. Argument sys is not limited to state-space models. If sys is not a state-space model, it is converted automatically.

## Parameters
- `a` (Real matrix): State matrix (n-by-n).
- `b` (Real matrix): Input matrix (n-by-m).
- `c` (Real matrix): Measurement matrix (p-by-n).
- `d` (Real matrix): Feedthrough matrix (p-by-m).
- `tsam` (Real scalar): Sampling time in seconds. If sys is a continuous-time model, a zero is returned.
- `sys` (State-space): LTI system.

## Examples
1.
```
sys = syslin('c', [0 -0.6667; 1 -0.3333], [-0.3333; 0], [0 -1], 0)
[a, b, c, d, tsam] = ssdata(sys)
```
```
 a = [2x2 double]

   0.  -0.6667
   1.  -0.3333

 b = [2x1 double]

  -0.3333
   0.

 c = [1x2 double]

   0.  -1.

 d = 

   0.

 tsam = 

   0.
```

2.
```
sys = syslin('d', [0 -0.6667; 1 -0.3333], [-0.3333; 0], [0 -1], 0);
[a, b, c, d, tsam] = ssdata(sys, 2)
```
```
 a = [2x2 double]

   0.  -0.6667
   1.  -0.3333

 b = [2x1 double]

  -0.3333
   0.

 c = [1x2 double]

   0.  -1.

 d = 

   0.

 tsam = 

   2.
```

3.
```
sys = syslin('d', [0 -0.6667; 1 -0.3333], [-0.3333; 0], [0 -1], 0)
[a, b, c, d, tsam] = ssdata(sys)
```
```
at line     8 of function ssdata ( C:\Users\KARTHIK\Downloads\ssdata.sci line 8 )

ssdata: tsam not provided for the discrete time system
```

4.
```
sys = syslin('c', [0 1; -2 -3], [0; 1], [1 0], 0);
e = [1 0; 0 0];
[a, b, c, d, tsam] = ssdata(sys, 0, e)
```
```
 a = 

  -0.6666667

 b = 

   0.3333333

 c = 

   1.

 d = 

   0.

 tsam = 

   0.
```

5.
```
sys = syslin('c', [0 1; -2 -3], [0; 1], [1 0], 0);
e = [1 0; 0 0];
[a, b, c, d, tsam] = ssdata(sys, 1, e)
```
```
at line    21 of function ssdata ( C:\Users\KARTHIK\Downloads\ssdata.sci line 21 )

ssdata: tsam for a continuous time system should be zero
```
