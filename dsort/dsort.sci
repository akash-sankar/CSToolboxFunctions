/*2024 Author: Akash S <akash.ktsn@gmail.com>*/
/*
Dependencies:
        gsort
Calling Sequence:
        s = dsort(p)
        [s, ndx] = dsort(p)
Parameters:
        p (vector): Discrete-time poles.
Description:
        Sort discrete-time poles by magnitude (in decreasing order).
*/
function [s, ndx] = dsort(p)
    if nargin == 1 then
        if ~isvector(p) then
            error("esort: argument must be a vector");
        end
    else
        error('dsort: One input argument required');
    end
    [s, ndx] = gsort(p);
endfunction
