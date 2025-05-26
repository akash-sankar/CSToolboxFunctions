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

    if typeof(sys) <> "state-space" then
        error("covar: First argument must be an LTI model.");
    end

    [A, B, C, D] = abcd(sys);
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
