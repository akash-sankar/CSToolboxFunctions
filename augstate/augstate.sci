/*2025 Author: Akash S <akash.ktsn@gmail.com>*/
/*
Calling Sequence:
    augsys = augstate (sys)
Parameters:
    augsys (State-space/Transfer function): Output system.
    sys (State-space/Transfer function): Input system.
Description:
    Append state vector x of system sys to output vector y.
         .                  .
         x = A x + B u      x = A x + B u
         y = C x + D u  =>  y = C x + D u
                            x = I x + O u
*/
function augsys = augstate(sys)
    if argn(2) <> 1 then
        error("augstate: Exactly one input argument expected.");
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
endfunction
