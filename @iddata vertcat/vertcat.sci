function dat = vertcat(varargin)
    n = length(varargin);
    dat = struct(); // initialize

    for i = 1:n
        dat(i) = varargin(i);
    end
endfunction
