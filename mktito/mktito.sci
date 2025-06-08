function [P, P_sys] = mktito(P, nmeas, ncon)

    if argn(2) <> 3 then
        error("Usage: P = mktito(P, nmeas, ncon)");
    end

    if typeof(P) <> "state-space" then
        error("mktito: first argument must be an LTI system");
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

    P_sys = struct();
    P_sys.outgroup = outgroup;
    P_sys.ingroup = ingroup;
    P_sys.outname = outname;
    P_sys.inname = inname;

endfunction

function bool = is_index(idx, s)
    bool = and([type(idx) == 1, size(idx, "*") == 1, int(idx) == idx, idx > 0, idx < s]);
endfunction
