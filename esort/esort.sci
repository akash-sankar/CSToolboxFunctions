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
