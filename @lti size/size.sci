function [n, varargout] = size_lti(sys, dim)
    if argn(2) < 2 then
        dim = 0;
    elseif argn(2) > 2 then
        error("Too many input arguments.");
    end
    
    p = size(sys.outname, "*");
    m = size(sys.inname, "*");
    
    select dim
    case 0 then
        select argn(1)
        case 0 then
            if p == 1 then
                stry = "";
            else
                stry = "s";
            end
            if m == 1 then
                stru = "";
            else
                stru = "s";
            end
            mprintf("LTI model with %d output%s and %d input%s.\n", p, stry, m, stru);
        case 1 then
            n = [p, m];
        case 2 then
            n = p;
            varargout = list(m);
        else
            error("Too many output arguments.");
        end
    case 1 then
        n = p;
    case 2 then
        n = m;
    else
        error("Invalid dimension argument.");
    end
endfunction
