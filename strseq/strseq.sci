/*2024 Author: Akash S <akash.ktsn@gmail.com>*/
/*
Calling Sequence:
        strvec = strseq (str, idx)
Parameters:
        strvec (String vector): Sequence of indexed string.
        str (String): Input string.
        idx (Real vector): Integer values (1-by-n).
Description:
        Return a cell vector of indexed strings by appending the indices idx to the string str.
*/
function strvec = strseq(str, idx)
    if nargin ~= 2 | typeof(str) ~= "string" | typeof(idx) ~= "constant" then
       // error( "Usage: strseq(str, idx)");
       disp("Error");
    end

    idx = matrix(idx, 1, -1);
    
    for i = 1:length(idx)
        strvec(i) = str + string(idx(i));
    end
endfunction
