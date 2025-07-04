# optiPID

## Description
Numerical optimization of a PID controller using an objective function.

In this example called optiPID, loosely based on [1], it is assumed that the plant 

                      1
    P(s) = -----------------------
           (s^2 + s + 1) (s + 1)^4 

is controlled by a PID controller with second-order roll-off

                    1                1
    C(s) = Kp (1 + ---- + Td s) -------------
                   Ti s         (tau s + 1)^2

in the usual negative feedback structure

             L(s)       P(s) C(s)
    T(s) = -------- = -------------
           1 + L(s)   1 + P(s) C(s)

The plant P(s) is of higher order but benign. The initial values for the controller parameters Kp, Ti and Td are obtained by applying the Astroem and Haegglund rules [2]. These values are to be improved using a numerical optimization as shown below. As with all numerical methods, this approach can never guarantee that a proposed solution is a global minimum. Therefore, good initial guesses for the parameters to be optimized are very important. The Octave function fminsearch minimizes the objective function J, which is chosen to be

                        inf 
    J(Kp, Ti, Td) = mu1 INT t |e(t)|dt  +  mu2 (||y(t)||   - 1)  +  mu3 ||S(jw)||
                         0                               inf                       inf

This particular objective function penalizes the integral of time-weighted absolute error

           inf 
    ITAE = INT t |e(t)|dt
            0             

and the maximum overshoot

    y    - 1 = ||y(t)||   - 1
     max               inf

to a unity reference step in the time domain. In the frequency domain, the sensitivity

    Ms = ||S(jw)||
                  inf

is minimized for good robustness, where S(jw) denotes the sensitivity transfer function

              1            1
    S(s) = -------- = -------------
           1 + L(s)   1 + P(s) C(s)

The constants mu1, mu2 and mu3 are relative weighting factors or «tuning knobs» which reflect the importance of the different design goals. Varying these factors corresponds to changing the emphasis from, say, high performance to good robustness. The main advantage of this approach is the possibility to explore the tradeoffs of the design problem in a systematic way. In a first approach, all three design objectives are weigthed equally. In subsequent iterations, the parameters mu1 = 1, mu2 = 10 and mu3 = 20 are found to yield satisfactory closed-loop performance. This controller results in a system with virtually no overshoot and a phase margin of 64 degrees.

References:
- [1] Guzzella, L. Analysis and Design of SISO Control Systems, VDF Hochschulverlag, ETH Zurich, 2007
- [2] Astroem, K. and Haegglund, T. PID Controllers: Theory, Design and Tuning, Second Edition, Instrument Society of America, 1995

## Calling Sequence
- `optiPID()`

## Examples
1.
```
optiPID()
```
```
optiPID: Astrom/Hagglund PID controller parameters: 
kp_AH = 0.846609
Ti_AH = 2.279034
Td_AH = 0.627673
optiPID: optimization starts, please be patient ... 
optiPID: optimized PID controller parameters: 
kp_opt = 0.601700
Ti_opt = 2.975100
Td_opt = 0.961000
optiPID: closed-loop stability check: 
st_AH = 1.000000
st_opt = 1.000000
optiPID: gain margin gamma [-] and phase margin phi [deg]: 
gamma_AH = 1.587728
phi_AH = 31.391352
gamma_opt = 2.882235
phi_opt = 64.250430
```
![image](https://github.com/user-attachments/assets/18a662dd-6199-4b8d-a26d-fd3ea2a2358f)

2.
```
optiPID(1)
```
```
at line     2 of function optiPID ( /Users/akashnandan/Desktop/Scilab/optiPID.sci line 39 )

Wrong number of input arguments: This function has no input argument.
``` 
