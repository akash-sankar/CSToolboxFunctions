/*2025 Author: Akash S <akash.ktsn@gmail.com>*/
/*
Calling Sequence:
        P_out = mktito (P, nmeas, ncon)
Parameters:
        P_out (State-space/Transfer function): Partitioned plant. The input/output groups and names are overwritten with designations according to [1].
        P (State-space/Transfer function): Generalized plant.
        nmeas (Real scalar): Number of measured outputs v. The last nmeas outputs of P are connected to the inputs of controller K. The remaining outputs z (indices 1 to p-nmeas) are used to calculate the H-2/H-infinity norm.
        ncon (Real scalar): Number of controlled inputs u. The last ncon inputs of P are connected to the outputs of controller K. The remaining inputs w (indices 1 to m-ncon) are excited by a harmonic test signal.
Description:
        Partition LTI plant P for robust controller synthesis. If a plant is partitioned this way, one can omit the inputs nmeas and ncon when calling the functions hinfsyn and h2syn.

             min||N(K)||             N = lft (P, K)
              K         norm
            
                            +--------+  
               w = u1 ----->|        |-----> z = y1
                            |  P(s)  |
               u = u2 +---->|        |-----+ y = y2
                      |     +--------+     |
                      |                    |
                      |     +--------+     |
                      +-----|  K(s)  |<----+
                            +--------+
            
                            +--------+      
               w = u1 ----->|  N(s)  |-----> z = y1
                            +--------+

        Reference: [1] Skogestad, S. and Postlethwaite, I. (2005) Multivariable Feedback Control: Analysis and Design: Second Edition. Wiley, Chichester, England.

        NOTE: LTI system in Scilab cannot store outgroup, ingroup, inname and outname. So a separate structure, P_inout, is used to store those fields.
*/
function [P, P_inout] = mktito(P, nmeas, ncon)

    if argn(2) <> 3 then
        error("Usage: P = mktito(P, nmeas, ncon)");
    end

    if typeof(P) <> "state-space" then
        error("mktito: first argument must be an LTI system");
    end
    
    if typeof(P) <> "rational" then
        P = tf2ss(P);
    end

    [p, m] = size_lti(P);

    if ~is_index(nmeas, p) then
        error("mktito: second argument ''nmeas'' invalid");
    end

    if ~is_index(ncon, m) then
        error("mktito: third argument ''ncon'' invalid");
    end

    outgroup = struct();
    outgroup("Y1") = 1:(p - nmeas);
    outgroup("Y2") = (p - nmeas + 1):p;

    ingroup = struct();
    ingroup("U1") = 1:(m - ncon);
    ingroup("U2") = (m - ncon + 1):m;

    outname = [];
    for i = 1:p
        outname($+1) = "y" + string(i);
    end

    inname = [];
    for i = 1:m
        inname($+1) = "u" + string(i);
    end

    P_inout = struct();
    P_inout.outgroup = outgroup;
    P_inout.ingroup = ingroup;
    P_inout.outname = outname;
    P_inout.inname = inname;

endfunction

function bool = is_index(idx, s)
    bool = and([type(idx) == 1, size(idx, "*") == 1, int(idx) == idx, idx > 0, idx < s]);
endfunction
