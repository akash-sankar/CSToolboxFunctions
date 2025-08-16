# covar

## Description
Return the steady-state covariance matrices of a linear time-invariant (LTI) system driven by Gaussian white noise inputs.

The function computes the output covariance `p` and the state covariance `q` assuming the system is excited by zero-mean white noise with intensity `w`.

## Calling Sequence
- `[p, q] = covar(sys, w)`

## Parameters
- `p`: Output covariance matrix.
- `q`: State covariance matrix.
- `sys`: LTI model in state-space form.
- `w`: Intensity (scalar or matrix) of the Gaussian white noise inputs which drive the system.

## Examples
1.
```
sys = syslin("c", -1, 1, 1, 0);
[p, q] = covar_control(sys, 5)
```
```
 p = 

   2.5

 q = 

   2.5
```
2.
```
sys = syslin("d", [-0.2, -0.5; 1, 0], [2; 0], [1, 0.5], [0]);
[p, q] = covar_control(sys, 5)
```
```
 p = 

   30.316742

 q = [2x2 double]

   27.149321  -3.6199095
  -3.6199095   27.149321
```

3.
```
[p, q] = covar_control()
```
```
at line     4 of function covar_control ( C:\Users\Desktop\Scilab\covar1.sci line 4 )

Usage: [p, q] = covar(sys, w)
```

4.
```
sys = syslin("c", -1, 1, 1, 0);
[p, q] = covar_control(sys)
```
```
at line     4 of function covar_control ( C:\Users\Desktop\Scilab\covar1.sci line 4 )

Usage: [p, q] = covar(sys, w)
```

5.
```
sys = syslin("c", -1, 1, 1, 0);
[p, q] = covar_control(sys, [1 2])
```
```
at line     5 of function lyap          ( C:\Program Files\scilab-2025.0.0\modules\cacsd\macros\lyap.sci line 17 )
at line    18 of function covar_control ( C:\Users\Desktop\Scilab\covar1.sci line 18 )

lyap: Wrong type for input argument #2: Must be a square matrix.
```
