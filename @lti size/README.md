# @lti/size

## Calling Sequence
- `nvec = size (sys)`
- `n = size (sys, dim)`
- `[p, m] = size (sys)`

## Description
LTI model size, i.e. number of outputs and inputs.

## Parameters
- `nvec` (Row vector): The first element is the number of outputs (rows) and the second element the number of inputs (columns).
- `n` (Real scalar): The size of the dimension dim.
- `p` (Real scalar): Number of outputs.
- `m` (Real scalar): Number of inputs.
- `sys` (State-space): LTI system.
- `dim (Real scalar): If given a second argument, size will return the size of the corresponding dimension.`val`: Key values of iddata objects.

## Examples
1.
```
sys = syslin('c', 1, [1 1], 1);
size_lti(sys)
```
```

```
2.
```
a = syslin('c', 1, [1 1], 1);
nvec = size_lti(sys)
```
```
 nvec = [1x2 double]

   1.   2.
```

3.
```
a = syslin('c', 1, [1 1], 1);
m = size_lti(sys, 2)
```
```
 m = 

   2.
```

4.
```
a = syslin('c', 1, [1 1], 1);
[p, m] = size_lti(sys)
```
```
 p = 

   1.

 m = 

   2.
```

5.
```
a = syslin('c', 1, [1 1], 1);
m = size_lti(sys, 4)
```
```
at line    41 of function size_lti ( C:\Users\KARTHIK\Desktop\Scilab\size_lti.sci line 41 )

Invalid dimension.
```
