function opt = options(varargin)
    if nargin == 0 then
        disp("Usage: options(key1, value1, key2, value2, ...)");
        return;
    end

    if modulo(nargin, 2) ~= 0 then
        error("Error: Properties and values must come in pairs");
    end
    
    for i = 1:2:nargin
        key = varargin(i);
        value = varargin(i+1);
        opt.(string(key)) = value;
    end
endfunction
