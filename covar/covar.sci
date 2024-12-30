function [p, q] = covar(sys, w)
    if nargin ~= 2 then
        error("covar: Two arguments required")
    end
    
    if argn(2) ~= 2 then
        error("Usage: [p, q] = covar(sys, w)");
    end

    if ~(typeof(sys) == "rational") then
        error("covar: first argument must be an LTI model");
    end

    if ~isstable(sys) then
        error("covar: system must be stable");
    end

    [a, b, c, d] = ssdata(sys);

    if isct(sys) then
        if norm(d, 1) > 0 then
            error("covar: system is not strictly proper");
        end

        q = lyap(a, b*w*b');
        p = c*q*c';
    else
        q = dlyap(a, b*w*b');
        p = c*q*c' + d*w*d';
    end
endfunction

function [B, A] = sos2tf(sos, g)
    if argn(1) < 1 | argn(1) > 2 then
        error("Incorrect number of input arguments");
    end
    if argn(1) == 1 then
        g = 1;
    end

    [N, M] = size(sos);

    if M ~= 6 then
        error("sos2tf: sos matrix should be N by 6");
    end

    A = 1;
    B = 1;

    for i = 1:N
        B = conv(B, sos(i, 1:3));
        A = conv(A, sos(i, 4:6));
    end

    nA = length(A);
    nB = length(B);

    if nA ~= nB then
        error("Internal error: length(A) not equal to length(B)");
    end

    while nB > 0 & B(nB) == 0 & A(nB) == 0 do
        B = B(1:nB - 1);
        A = A(1:nB - 1);
        nB = length(B);
    end

    while nB > 0 & B(1) == 0 & A(1) == 0 do
        A = A(2:$);
        B = B(2:$);
        nB = nB - 1;
    end

    B = B * prod(g);
endfunction

function flag = isstable(b, varargin)
    if argn(1) == 1 then
        if size(b, 1) > 1 & size(b, 2) > 1 then
            [b, a] = sos2tf(b);
        else
            a = 1;
        end
    else
        a = varargin(1);
    end

    if isempty(a) | length(a) == 1 then
        flag = %t;
    else
        if a(1) ~= 1 then
            b = b ./ a(1);
            a = a ./ a(1);
        end
        r = roots(a);
        if or(abs(r) > 1) then
            flag = %f;
        else
            flag = %t;
        end
    end
endfunction


function bool = isct(ltisys)
    if argn(1) ~= 1 then
        error("Incorrect number of input arguments");
    end

    bool = (ltisys.tsam == 0);
endfunction
