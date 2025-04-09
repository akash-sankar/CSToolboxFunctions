function C = pidstd(Kp, Ti, Td, N)

    if nargin < 4 then
        N = %inf;
    end
    if nargin < 3 then
        Td = 0;
    end
    if nargin < 2 then
        Ti = %inf;
    end
    if nargin < 1 then
        Kp = 1;
    end
    
    if ~isreal(Kp) | ~isscalar(Kp) | ~isreal(Ti) | ~isscalar(Ti) | ~isreal(Td) | ~isscalar(Td) | ~isreal(N) | ~isscalar(N) then
        disp("Error: Inputs must be real scalars.");
        return;
    end

    if Kp == 0 then
        num = flipdim([0], 2);
        den = flipdim([1], 2);
        numPoly = poly(num, 's', 'coeff');
        denPoly = poly(den, 's', 'coeff');
        C = syslin('c', numPoly, denPoly);
        
    elseif Ti == %inf & N == %inf then
        num = flipdim(Kp*[Td, 1], 2);
        den = flipdim([1], 2);
        numPoly = poly(num, 's', 'coeff');
        denPoly = poly(den, 's', 'coeff');
        C = syslin('c', numPoly, denPoly);
        
    elseif Ti == %inf then
        num = flipdim(Kp * [N * Td + Td, N], 2);
        den = flipdim([Td, N], 2);
        numPoly = poly(num, 's', 'coeff');
        denPoly = poly(den, 's', 'coeff');
        C = syslin('c', numPoly, denPoly);
        
    elseif N == %inf then
        num = flipdim(Kp * [Td * Ti, Ti, 1], 2);
        den = flipdim([Ti, 0], 2);
        numPoly = poly(num, 's', 'coeff');
        denPoly = poly(den, 's', 'coeff');
        C = syslin('c', numPoly, denPoly);
        
    else
        num = flipdim( Kp * [N * Td * Ti + Td * Ti, N * Ti + Td, N], 2);
        den = flipdim([Td * Ti, N * Ti, 0], 2);
        numPoly = poly(num, 's', 'coeff');
        denPoly = poly(den, 's', 'coeff');
        C = syslin('c', numPoly, denPoly);
    end
endfunction
