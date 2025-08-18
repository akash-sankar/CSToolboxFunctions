# covar

## Description
Return the steady-state covariance matrices of a linear time-invariant (LTI) system driven by Gaussian white noise inputs.

The function computes the output covariance `p` and the state covariance `q` assuming the system is excited by zero-mean white noise with intensity `w`.

NOTE: tf2ss function of GNU Octave uses Wolovich’s Observable Structure Theorem while Scilab uses a different approach (h=C*(seye()-A)^-1B+D(s)). So when a transfer function is given as input, the resultant state space representation may not match between GNU Octave & Scilab. But both forms produce identical input-output behavior.

## Calling Sequence
- `[p, q] = covar(sys, w)`

## Parameters
- `p`: Output covariance matrix.
- `q`: State covariance matrix.
- `sys`: LTI model in state-space form.
- `w`: Intensity (scalar or matrix) of the Gaussian white noise inputs which drive the system.

## Dependencies
[@lti/ssdata](https://github.com/akash-sankar/CSToolboxFunctions/tree/main/%40lti%20ssdata)

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
s = poly(0, 's');
sys = syslin('c', [1+2*s], [0.5+0.2*s+s*s]);
[p, q] = covar_control(sys, 5)
```
```
 p = 

   75.000000

 q = [2x2 double]

   45.   15. 
   15.   67.5
```

4.
```
z = poly(0, 'z');
sys = syslin('d', [1], [-0.5+z]);
[p, q] = covar_control(sys, 5)
```
```
 p = 

   6.6666667

 q = 

   6.6666667
```

5.
```
[p, q] = covar_control()
```
```
at line     4 of function covar_control ( C:\Users\Desktop\Scilab\covar1.sci line 4 )

Usage: [p, q] = covar(sys, w)
```

6.
```
sys = syslin("c", -1, 1, 1, 0);
[p, q] = covar_control(sys)
```
```
at line     4 of function covar_control ( C:\Users\Desktop\Scilab\covar1.sci line 4 )

Usage: [p, q] = covar(sys, w)
```

7.
```
sys = syslin("c", -1, 1, 1, 0);
[p, q] = covar_control(sys, [1 2])
```
```
at line     5 of function lyap          ( C:\Program Files\scilab-2025.0.0\modules\cacsd\macros\lyap.sci line 17 )
at line    18 of function covar_control ( C:\Users\Desktop\Scilab\covar1.sci line 18 )

lyap: Wrong type for input argument #2: Must be a square matrix.
```

8.
```
s = poly(0, 's');
sys = syslin('c', 1/(s - 1));
[p, q] = covar_control(sys, 5)
```
```
at line    12 of function covar_control ( C:\Users\KARTHIK\Downloads\CSToolboxFunctions-main\CSToolboxFunctions-main\covar\covar.sci line 26 )

covar: system must be stable
```
