/*2024 Author: Akash S <akash.ktsn@gmail.com>*/
/*
Calling Sequence
      P = covar(sys,W)
      [P,Q] = covar(sys,W)
Parameters
      P: Output covariance.
      Q: State covariance.
      sys: LTI model.
      w: Intensity of Gaussian white noise inputs which drive sys.
Description:        
        Return the steady-state covariance.
        covar calculates the stationary covariance of the output y of an LTI model sys driven by Gaussian white noise inputs w. This function handles both continuous- and discrete-time cases.
*/
function [p, q] = covar_control(sys, w)

    if nargin ~= 2 then
        error("Usage: [p, q] = covar(sys, w)");
    end

    if ~(typeof(sys) == "state-space" | typeof(sys) == "rational") then
        error("covar: First argument must be an LTI model.");
    end
    
    if (~(isstable (sys))) then
        error("covar: system must be stable");
    end

    //[A, B, C, D] = abcd(sys);
    [A, B, C, D] = ssdata (sys);
    is_continuous = sys.dt == "c";

    if is_continuous then
        if norm(D, 1) > 0 then
            error("covar: System is not strictly proper.");
        end
        q = lyap(A', -(B * w * B'), 'c');
        p = C * q * C';
    else
        qT = lyap(A', -B * w * B', 'd');
        q  = qT';
        p = C * q * C' + D * w * D';
    end

endfunction

function bool = __is_stable__(pol, ct, tol)

    if argn(2) < 2 then
        ct = %t;
    end
    if argn(2) < 3 then
        tol = 0;
    end
    
    if ~isreal(tol) | size(tol,"*")<>1 | tol < 0 then
        error("isstable: tolerance must be a real-valued, non-negative scalar");
    end
    
    if ct then
        bool = and(real(pol) < -tol .* (1 + abs(pol)));
    else
        bool = and(abs(pol) < 1 - tol);
    end
endfunction

function bool = isstable(sys, tol)
    if argn(2) < 2 then
        tol = 0;
    end
    
    if argn(2) > 2 then
        error("isstable: Wrong number of input arguments.");
    end
    
    if typeof(sys) == "state-space" then
        [zero, pol, k] = ss2zp(sys);
    elseif typeof(sys) == "rational" then
        [zero, pol, k] = tf2zp(sys);
    end
    
    if sys.dt == 'c' then
        ct = %t;
    else
        ct = %f;
    end
    
    bool = __is_stable__(pol, ct, tol);
endfunction
