# @lti/size

## Description
LTI model size, i.e. number of outputs and inputs.

## Calling Sequence
- `nvec = size (sys)`
- `n = size (sys, dim)`
- `[p, m] = size (sys)`

## Parameters
- `nvec` (Row vector): The first element is the number of outputs (rows) and the second element the number of inputs (columns).
- `n` (Real scalar): The size of the dimension dim.
- `p` (Real scalar): Number of outputs.
- `m` (Real scalar): Number of inputs.
- `sys` (State-space): LTI system.
- `dim` (Real scalar): If given a second argument, size will return the size of the corresponding dimension.

## Examples
1.
```
sys = syslin('c', 1, [1 1], 1);
size_lti(sys)
```
```
 ans = [1x2 double]

   1.   2.
```
Even if the number of output variables are zero, the value of nargout (or) argn(1) is 1. So the output of test case 1 & 2 are same.

2.
```
A=[0 1;-2 -3];B=[0;1];C=[1 0;0 1];D=[0;0];
sys=syslin("c",A,B,C,D);
nvec = size_lti(sys)
```
```
 nvec = [1x2 double]

   2.   1.
```

3.
```
A=0;B=[1 0];C=1;D=[0 0];
sys=syslin("c",A,B,C,D);
m = size_lti(sys,2)
```
```
 m = 

   2.
```

4.
```
sys = syslin('d',[0 -0.6667; 1 -0.3333], [-0.3333; 0], [0 -1], 0);
[p, m] = size_lti(sys)
```
```
 p = 

   1.

 m = 

   1.
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
