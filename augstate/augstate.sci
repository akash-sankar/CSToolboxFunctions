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

    // Form augmented output matrix: [C; I]
    C_aug = [C; eye(n, n)];
    D_aug = [D; zeros(n, m)];

    augsys = syslin(sys("dt"), A, B, C_aug, D_aug);
endfunction
