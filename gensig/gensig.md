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
   
3.
   ```
   [x,t]=gensig('square',3);
   plot(t,x);
   ```
   
4.
   ```
   [x,t]=gensig('pulse',3,2);
   plot(t,x);
   ```
   
