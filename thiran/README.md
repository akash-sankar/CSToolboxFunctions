# thiran

## Calling Sequence
- `sys = thiran (tau, tsam))`

## Description
Approximation of continuous-time delay using a discrete-time allpass Thiran filter.

Thiran filters can approximate continuous-time delays that are non-integer multiples of the sampling time (fractional delays). This approximation gives a better matching of the phase shift between the continuous- and the discrete-time system. If there is no fractional part in the delay, then the standard discrete-time delay representation is used.

## Parameters
- `tau` (State-space): Transfer function model of the resulting filter. The order of the filter is determined automatically.
- `tau` (Real scalar): A continuous-time delay, given in time units (seconds).
- `b` (Real scalar): The sampling time of the resulting Thiran filter.

## Examples
1.
```
sys = thiran (2.4, 1)
```
```
 sys = [rational] of z

   1 +0.5294118z -0.0481283z^2 +0.0041592z^3  
   -----------------------------------------  
   0.0041592 -0.0481283z +0.5294118z^2 +z^3 
```
2.
```
sys = thiran (0.5, 0.1)
```
```
 sys = [rational] of z

    1   
   ---  
   z^5 
```

3.
```
sys = thiran (-1, 1)
```
```
at line     9 of function thiran ( C:\Users\KARTHIK\Desktop\Scilab\thiran.sci line 9 )

thiran: the delay parameter tau must be a non-negative scalar.
```

4.
```
sys = thiran (1, -1)
```
```
at line    13 of function thiran ( C:\Users\KARTHIK\Desktop\Scilab\thiran.sci line 13 )

thiran: the second parameter tsam is not a valid sampling time.
```

5.
```
sys = thiran ([1 2 3], 1)
```
```
at line     9 of function thiran ( C:\Users\KARTHIK\Desktop\Scilab\thiran.sci line 9 )

thiran: the delay parameter tau must be a non-negative scalar.
```

6.
```
sys = thiran (2.4)
```
```
at line     5 of function thiran ( C:\Users\KARTHIK\Desktop\Scilab\thiran.sci line 5 )

Usage: sys = thiran (tau, tsam)
```
