# gensig
## Calling Sequence
- `[u, t] = gensig (sigtype, tau)`
- `[u, t] = gensig (sigtype, tau, tfinal)`
- `[u, t] = gensig (sigtype, tau, tfinal, tsam)`

## Description
Generates periodic signal.

## Parameters
- `sigtype`: Type of signal to plot
    - Sine wave: `sigtype = "sin"`
    - Cosine wave: `sigtype = "cos"`
    - Square wave: `sigtype = "square"`
    - Periodic pulse: `sigtype = "pulse"`
- `tau`: Duration of one period in seconds.
- `tfinal` (Optional): Duration of the signal in seconds. Default duration is 5 periods.
- `tsam` (Optional): sampling time in seconds. Default spacing is tau/64.

## Examples
1.
```
[x,t]=gensig('sin',1,1);
plot(t,x);
```
![image](https://github.com/user-attachments/assets/8cc6d4ad-c194-4bb6-985a-2ea4acded40f)
  
2.
```
[x,t]=gensig('cos',3);
plot(t,x);
```
![image](https://github.com/user-attachments/assets/0f67c1fb-0775-4242-ba6c-171bea244358)

3.
```
[x,t]=gensig('square',3);
plot(t,x);
```
![image](https://github.com/user-attachments/assets/31538433-e134-4e9f-acf2-7d62e0f5cab7)

4.
```
[x,t]=gensig('pulse',3,2);
plot(t,x);
```
![image](https://github.com/user-attachments/assets/e09363f8-47ba-4e7e-b197-9beb9082854f)

5. 
```
[x,t]=gensig('sin');
```
```
at line     4 of function gensig ( /Users/akashnandan/Desktop/Scilab/Gen_Sig.sci line 4 )

Usage: gensig(sigtype, tau, [tfinal], [tsam])
```

6.
```
[x,t]=gensig(sin,1);
```
```
at line     8 of function gensig ( /Users/akashnandan/Desktop/Scilab/Gen_Sig.sci line 8 )

gensig: first argument must be a string
```

7.
```
[x,t]=gensig('cos',-11);
```
```
at line    14 of function gensig ( /Users/akashnandan/Desktop/Scilab/Gen_Sig.sci line 14 )

gensig: second argument must be a positive number
```

8.
```
[x,t]=gensig('square',3,-1);
```
```
at line    20 of function gensig ( /Users/akashnandan/Desktop/Scilab/Gen_Sig.sci line 20 )

gensig: third argument must be a positive number
```

9.
```
[x,t]=gensig('pulse',3,2,0);
```
```
at line    26 of function gensig ( /Users/akashnandan/Desktop/Scilab/Gen_Sig.sci line 26 )

gensig: fourth argument must be a positive number
```

10.
```
[x,t]=gensig('pul',3,2)
```
```
at line    45 of function gensig ( /Users/akashnandan/Desktop/Scilab/Gen_Sig.sci line 45 )

gensig: pul is an invalid signal type
```
