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
