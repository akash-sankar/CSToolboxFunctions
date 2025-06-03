# pidstd

## Description
Return the transfer function C of the PID controller in standard form with first-order roll-off.

                    1        Td s
    C(s) = Kp (1 + ---- + ----------)
                   Ti s   Td/N s + 1
                   
## Calling Sequence
- `C = pidstd (Kp)`
- `C = pidstd (Kp, Ti)`
- `C = pidstd (Kp, Ti, Td)`
- `C = pidstd (Kp, Ti, Td, N)`

## Parameters
- `Kp`: Proportional gain.
- `Ti`: Integral time.
- `Td`: Derivative time.
- `N`: First-order derivative filter divisor.

## Examples
1.
```
Kp = 1;
Ti = %inf;
Td = 3;
N = 6;
C = pidstd(Kp,Ti,Td,N)
```
```
 C = [rational] of s

   6 +21s  
   ------  
   6 +3s 
```
2.
```
Kp = 1;
Ti = 1;
Td = 1;
C = pidstd(Kp,Ti,Td)
```
```
 C = [rational] of s

   1 +s +s^2  
   ---------  
       s    
```

3.
```
 C = pidstd(1,1,[1 0])
```
```
at line    17 of function pidstd ( /Users/akashnandan/Desktop/Scilab/pidstd_2.sci line 17 )

Error: Inputs must be real scalars.
```

4.
```
C = pidstd(1,4*%i,[1 0])
```
```
at line    17 of function pidstd ( /Users/akashnandan/Desktop/Scilab/pidstd_2.sci line 17 )

Error: Inputs must be real scalars.
```

5.
```
C = pidstd()
```
```
 C = [rational] of s

   1  
   -  
   1  
```
