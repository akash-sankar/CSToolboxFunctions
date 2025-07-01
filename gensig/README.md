# gensig

## Description
Generates periodic signal.

## Calling Sequence
- `[u, t] = gensig (sigtype, tau)`
- `[u, t] = gensig (sigtype, tau, tfinal)`
- `[u, t] = gensig (sigtype, tau, tfinal, tsam)`

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
![1](https://github.com/user-attachments/assets/5ecdb8a1-1a9c-4bdf-85bb-fc9230018e1a)
  
2.
```
[x,t]=gensig('cos',3);
plot(t,x);
```
![2](https://github.com/user-attachments/assets/e6f89cc1-dba4-45ae-9329-210ca9ca3692)

3.
```
[x,t]=gensig('square',3);
plot(t,x);
```
![3](https://github.com/user-attachments/assets/999c118a-5989-4205-a2d0-265eea1767c6)

4.
```
[x,t]=gensig('pulse',3,2);
plot(t,x);
```
![4](https://github.com/user-attachments/assets/3e46a81c-a06c-42b4-b224-b006ffda82a4)

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
