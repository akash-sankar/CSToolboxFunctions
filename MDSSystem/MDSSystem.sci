// =============================================================================
// Robust Control of a Mass-Damper-Spring System
// =============================================================================
// Reference: Gu, D.W., Petkov, P.Hr. and Konstantinov, M.M.
//            Robust Control Design with Matlab, Springer 2005
// ===============================================================================

// Clear workspace
clc; clear; close;

function [K, N, gam, info] = ncfsyn_sc(G, W1, W2, fact)
    // Equivalent to ncfsyn in Scilab
    if argn(2) < 4 then
        fact = 1; // Default value
    end
    
    if isempty(W1) then
        W1 = syslin('c', 1); // Identity if not specified
    end
    
    if isempty(W2) then
        W2 = syslin('c', 1); // Identity if not specified
    end
    
    // Step 1: Compute the shaped plant Gs = W2 * G * W1
    Gs = W2 * G * W1;
    
    // Step 2: Compute H-infinity controller Ks for shaped plant
    r = [size(Gs('A'),1), size(Gs('B'),2)]; // Partitioning
    romin = 0.1;
    romax = 10;
    nmax = 100;

    [Ks, ro] = H_inf(Gs, r, romin, romax, nmax);
    
    // Step 3: Compute the final controller K
    K = W1 * Ks * W2;
    
    // Step 4: Compute closed-loop system N
    N = lft(Gs, r, K);
    
    // Step 5: Compute gamma (H∞ norm)
    gam = norm(N, "inf");
    
    // Step 6: Additional info
    info.gamma = gam;
    info.Gs = Gs;
    info.Ks = Ks;
    info.rcond = rcond(K('A'));

endfunction

// =============================================================================
// System Model (Nominal)
// =============================================================================
//                +---------------+
//                | d_m   0    0  |
//          +-----|  0   d_c   0  |<----+
//      u_m |     |  0    0   d_k |     | y_m
//      u_c |     +---------------+     | y_c
//      u_k |                           | y_k
//          |     +---------------+     |
//          +---->|               |-----+
//                |     G_nom     |
//        u ----->|               |-----> y
//                +---------------+

//Nominal Values
m_nom = 3;     // Mass
c_nom = 1;     // Damping coefficient
k_nom = 2;     // Spring stiffness

// Perturbations (Uncertainty)
p_m = 0.4;     // 40% uncertainty in mass
p_c = 0.2;     // 20% uncertainty in damping
p_k = 0.3;     // 30% uncertainty in stiffness

// State-Space Representation
A = [  0,           1;
      -k_nom/m_nom, -c_nom/m_nom ];

B1 = [  0,           0,            0;
       -p_m,    -p_c/m_nom,   -p_k/m_nom ];

B2 = [  0;
        1/m_nom ];

C1 = [ -k_nom/m_nom, -c_nom/m_nom;
        0,            c_nom;
        k_nom,        0 ];

C2 = [  1,  0 ];

D11 = [ -p_m,   -p_c/m_nom,   -p_k/m_nom;
         0,      0,            0;
         0,      0,            0 ];

D12 = [  1/m_nom;
         0;
         0 ];

D21 = [  0,  0,  0 ];
D22 = [  0 ];

// Create State-Space System in Scilab
G_nom = syslin('c', A, [B1, B2], [C1; C2], [D11, D12; D21, D22]);

// Extract the system from 'u' (input) to 'y' (output)
G = G_nom(4,4);

// =============================================================================
// Frequency Analysis of Uncertain System
// =============================================================================

// Uncertainties: -1 <= delta_m, delta_c, delta_k <= 1
[delta_m, delta_c, delta_k] = ndgrid ([-1, 0, 1], [-1, 0, 1], [-1, 0, 1]);

// Bode Plots of Perturbed Plants
w = logspace(-1, 1, 100);

delta_m = delta_m(:);
delta_c = delta_c(:);
delta_k = delta_k(:);
Delta = cell(size(delta_m, 1), 1);
for idx = 1:size(delta_m, 1)
    Delta{idx} = list(diag([delta_m(idx); delta_c(idx); delta_k(idx)]));
end

G_per = list();
for i = 1:length(Delta)
    G_per(i) = list(lft(Delta(i), G_nom));
end

scf(1);
bode(G, w);
title("Bode Plot of Nominal MDS System");

// =============================================================================
// Mixed Sensitivity H-infinity Controller Design (S over KS Method)
// =============================================================================
//                                    +-------+
//             +--------------------->|  W_p  |----------> e_p
//             |                      +-------+
//             |                      +-------+
//             |                +---->|  W_u  |----------> e_u
//             |                |     +-------+
//             |                |    +---------+
//             |                |  ->|         |->
//  r   +    e |   +-------+  u |    |  G_nom  |
// ----->(+)---+-->|   K   |----+--->|         |----+----> y
//        ^ -      +-------+         +---------+    |
//        |                                         |
//        +-----------------------------------------+

// Weighting Functions
s = poly(0, 's');  // Define Laplace variable
Wp = 0.95 * (s^2 + 1.8*s + 10) / (s^2 + 8.0*s + 0.01);  // Performance weighting
Wu = 0.01;   // Control weighting

// Mixed-sensitivity H-infinity synthesis
[K_mix, temp, temp2] = h_inf(G, Wp, Wu, "mixsyn");

// Interconnections
L_mix = G * K_mix;
T_mix = feedback(L_mix);

// =============================================================================
// H-infinity Loop-Shaping Design (Normalized Coprime Factor Perturbations)
// =============================================================================
W1 = 8 * (2*s + 1) / (0.9*s);  // Precompensator
W2 = 1;                        // Postcompensator
fact = 1.1;                  

// Compute H-infinity loop-shaping controller
[K, N, gam, info] = ncfsyn_sc(G, W1, W2, 1);

// Adjust for negative feedback
K_ncf = -K_ncf;

// Closed-loop transfer function
L_ncf = G * K_ncf;
T_ncf = L_ncf/.1;

// =============================================================================
// Compare Controllers
// =============================================================================

// Bode plot of controllers
scf(2);
bode(K_mix, K_ncf, w);
legend("Mixed Sensitivity", "Loop Shaping");
title("Bode Plot of Controllers");

// Step Response Comparison
scf(3);
t = 0:0.1:10;
step(T_mix, T_ncf, t);
legend("Mixed Sensitivity", "Loop Shaping");
title("Step Response of Controllers");
