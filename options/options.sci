/*2025 Author: Akash S <akash.ktsn@gmail.com>*/
/*
Calling Sequence:
        opt = options ('key1', value1, 'key2', value2, …)
Parameters:
        key (String): The name of the property.
        value: The value of the property.
Description:
        Create options struct opt from a number of key and value pairs. For use with order reduction and system identification functions. Option structs are a way to avoid typing the same key and value pairs over and over again.
*/
funct
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
