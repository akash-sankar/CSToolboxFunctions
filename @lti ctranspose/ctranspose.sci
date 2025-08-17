/*2025 Author: Akash S <akash.ktsn@gmail.com>*/
/*
Calling Sequence:
    [sysout, eout, sysn] = ctranspose(sys, ein)
Parameters:
    sys (State-space): System to be transposed.
    ein (Real matrix): Descriptor matrix (n-by-n).
    sysout (State-space): Conjugate transposed of sys.
    eout (Real matrix): Measurement matrix (p-by-n).
    sysn (Structure): System input, state and output names of sysout.
Description:
    Conjugate transpose or pertransposition of LTI objects. Used by Octave for "sys’". For a transfer-function matrix G, G’ denotes the conjugate of G given by G.’(-s) for a continuous-time system or G.’(1/z) for a discrete-time system. 
    The frequency response of the pertransposition of G is the Hermitian (conjugate) transpose of G(jw), i.e. freqresp (G’, w) = freqresp (G, w)’. WARNING: Do NOT use this for dual problems, use the transpose "sys.’" (note the dot) instead.
*/
function [sys, eout, sysn] = ctranspose(sys, ein)
    
    if argn(2) < 2 then
        ein = [];
    end
    if typeof(ein) <> "constant" then
        error("ctranspose: ein must be an array");
    end
    
    [p, m] = size_lti(sys);
    ct = (sys.dt == "c");   // fixed string compare
    
    [sys, sysn] = __ctranspose__(sys, ein, ct);
    
    sysn.inname  = repmat ({""}, p, 1);
    sysn.outname = repmat ({""}, m, 1);
    sysn.ingroup = struct();
    sysn.outgroup = struct();
endfunction

function [sys, eout, sysn] = __ctranspose__(sys, ein, ct)
    a = sys.a;
    b = sys.b;
    c = sys.c;
    d = sys.d;
    e = ein;
    
    if ct then
        sys.a = -a';
        sys.b = -c';
        sys.c = b';
        sys.d = d';
        eout = e';
        sysn.stname = repmat ({""}, size (a, 1), 1);
    else
        [n, m] = size(b);
        p = size(c, 1);
        if isempty(e) then
            e = eye(n, n);
        end
        sys.a = blockdiag(e', eye(p, p));
        sys.b = [zeros(n, p); -eye(p, p)];
        sys.c = [b', zeros(m, p)];
        sys.d = d';
        eout = [a', c'; zeros(p, n+p)];
        sysn.stname = repmat ({""}, n+p, 1);
    end
endfunction
