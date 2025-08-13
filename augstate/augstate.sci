/*2025 Author: Akash S <akash.ktsn@gmail.com>*/
/*
Calling Sequence:
    augsys = augstate (sys)
Parameters:
    augsys (State-space/Transfer function): Output system.
    augsysn (Structure): Output system information.
    sys (State-space/Transfer function): Input system.
    inn, stn, outn, ing, outg (Vector): Input variable names, State variable names, Output variable names, Input grouping information and Output grouping information.
Description:
    Append state vector x of system sys to output vector y.
         .                  .
         x = A x + B u      x = A x + B u
         y = C x + D u  =>  y = C x + D u
                            x = I x + O u
*/
function [augsys, augsysn] = augstate(sys, inn, stn, outn, ing, outg)
    if argn(2) == 1 then
        [inn, stn, outn, ing, outg] = [[], [], [], [], []];
    elseif argn(2) == 2 then
        [stn, outn, ing, outg] = [[], [], [], []];
    elseif argn(2) == 3 then
        [outn, ing, outg] = [[], [], []];
    elseif argn(2) == 4 then
        [ing, outg] = [[], []];
    elseif argn(2) == 5 then
        outg = [];
    elseif  argn(2) < 1 | argn(2) > 6 then
        error("Usage: [augsys, augsysn] = augstate(sys, inn, stn, outn, ing, outg);")
    end

    if typeof(sys) <> "state-space" & typeof(sys) == 'rational' then
        warning("augstate: system not in state-space form. Converting to syslin.");
        sys = tf2ss(sys);
    end

    [A, B, C, D] = abcd(sys);
    n = size(A, 'r');
    [p, m] = size(D);

    C_aug = [C; eye(n, n)];
    D_aug = [D; zeros(n, m)];

    augsys = syslin(sys("dt"), A, B, C_aug, D_aug);
    
    augsysn.inname = inn;
    augsysn.stname = stn;
    augsysn.outname = outn;
    augsysn.ingroup = ing;
    augsysn.outgroup = outg;
endfunction
