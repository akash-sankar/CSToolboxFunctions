/*2024 Author: Akash S <akash.ktsn@gmail.com>*/
/*
Dependencies:
        gsort
Calling Sequence:
        s = esort(p)
        [s, ndx] = esort(p)
Parameters:
        p (vector): Continuous-time poles.
Description:
        Sort continuous-time poles by real part (in decreasing order).
*/
function [s, ndx] = esort(p)
    if nargin == 1 then
        if ~(isvector(p)) then
            error("esort: argument must be a vector");
        end
    else
        error('esort: One input argument required');
    end
    [p_sorted, ndx] = gsort(real(p), 'g', 'd');
    s = p(ndx);
endfunction
