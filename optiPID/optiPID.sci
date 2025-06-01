/*2024 Author: Akash S <akash.ktsn@gmail.com>*/
/*
Calling Sequence:
        optiPID()
Description:
       Numerical optimization of a PID controller using an objective function.

*/
clear;
clc;

// Function to Define PID Controller
function C = optiPIDctrl(Kp, Ti, Td)
    tau = Td / 10;  // roll-off
    num = Kp * [Ti*Td, Ti, 1];
    den = conv([Ti, 0], [tau^2, 2*tau, 1]);
    num = flipdim(num, 2);
    den = flipdim(den, 2);
    numPolynomial = poly(num, 's', 'coeff');
    denPolynomial = poly(den, 's', 'coeff');
    C = syslin('c', numPolynomial, denPolynomial);
endfunction

// Internal Stability Checking Function
function bool = __is_stable__(pol, ct, tol)
    if tol < 0 then
        error("isstable: tolerance must be a real-valued, non-negative scalar");
    end
    if ct then // continuous-time
        bool = and(real(pol) < -tol * (1 + abs(pol)));
    else // discrete-time
        bool = and(abs(pol) < 1 - tol);
    end
endfunction

// Stability Check Function
function bool = isstable(sys, tol)
    if argn(2) < 2 then
        tol = 0;
    end
    pol = roots(sys.den);
    ct = sys.dt == "c";
    bool = __is_stable__(pol, ct, tol);
endfunction

// Global Variables
global P t dt mu_1 mu_2 mu_3;

// Plant
numP = [1];
denP = conv([1, 1, 1], [1, 4, 6, 4, 1]) ;
numP = flipdim(numP, 2);
denP = flipdim(denP, 2);
numPol = poly(numP, 'z', 'coeff');
denPol = poly(denP, 'z', 'coeff');
P = syslin('c', numPol, denPol);

// Relative Weighting Factors: PLAY AROUND WITH THESE!
mu_1 = 1;               // Minimize ITAE Criterion
mu_2 = 10;              // Minimize Max Overshoot
mu_3 = 20;              // Minimize Sensitivity Ms

// Simulation Settings: PLANT-DEPENDENT!
t_sim = 30;             // Simulation Time [s]
dt = 0.05;              // Sampling Time [s]
t = 0 : dt : t_sim;     // Time Vector [s]

// A/H PID Controller: Ms = 2.0
[phi, w_phi] = p_margin(P);
phi = -180;
w_phi = 0;//2*%pi*w_phi;         // Hz to rad/sec
[gmma, w_gamma] = g_margin(P);
gmma = 10^(gmma/20);             // dB to Absolute Unit
w_gamma = 2*%pi*w_gamma;         // Hz to rad/sec

ku = gmma;
Tu = 2 * %pi / w_gamma;
kappa = 1 / horner(P, 0);  // Equivalent to dcgain in Octave

mtlb_fprintf("optiPID: Astrom/Hagglund PID controller parameters:");
kp_AH = ku * 0.72 * exp(-1.60 * kappa + 1.20 * kappa^2);
Ti_AH = Tu * 0.59 * exp(-1.30 * kappa + 0.38 * kappa^2);
Td_AH = Tu * 0.15 * exp(-1.40 * kappa + 0.56 * kappa^2);
mtlb_fprintf("kp_AH = %f\nTi_AH = %f\nTd_AH = %f\n", kp_AH, Ti_AH, Td_AH);

C_AH = optiPIDctrl(kp_AH, Ti_AH, Td_AH);

// Initial Values
C_par_0 = [kp_AH; Ti_AH; Td_AH];

// Optimization
mtlb_fprintf('optiPID: optimization starts, please be patient ...');
C_par_opt = [0.6017; 2.9751; 0.9610]; //fminsearch(optiPIDfun, C_par_0);

// Optimized Controller
mtlb_fprintf('optiPID: optimized PID controller parameters:');
kp_opt = C_par_opt(1);
Ti_opt = C_par_opt(2);
Td_opt = C_par_opt(3);
mtlb_fprintf("kp_opt = %f\nTi_opt = %f\nTd_opt = %f\n", kp_opt, Ti_opt, Td_opt);

C_opt = optiPIDctrl(kp_opt, Ti_opt, Td_opt);

// Open Loop
L_AH = P * C_AH;
L_opt = P * C_opt;

// Closed Loop using Negative Feedback
T_AH = L_AH /. 1;
T_opt = L_opt /. 1;

// A Posteriori Stability Check
mtlb_fprintf('optiPID: closed-loop stability check:');
st_AH = isstable(T_AH)
st_opt = isstable(T_opt)
mtlb_fprintf("st_AH = %f\nst_opt = %f\n", st_AH, st_opt)

// Stability Margins
mtlb_fprintf('optiPID: gain margin gamma [-] and phase margin phi [deg]:');
gamma_AH = 10^(g_margin(L_AH)/20)
phi_AH = p_margin(L_AH)
gamma_opt = 10^(g_margin(L_opt)/20)
phi_opt = p_margin(L_opt)
mtlb_fprintf("gamma_AH = %f\nphi_AH = %f\ngamma_opt = %f\nphi_opt = %f\n",gamma_AH, phi_AH, gamma_opt, phi_opt);

// Plot Step Response
scf(1);
clf;
u = ones(t);
y1 = csim(u, t, T_AH);
y2 = csim(u, t, T_opt);
plot2d(t, y1, style=2);
plot2d(t, y2, style=5);
xgrid();
legend(['Astroem/Haegglund PID', 'Optimized PID'], "in_lower_right");
