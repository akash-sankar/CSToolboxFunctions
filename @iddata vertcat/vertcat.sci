/*2025 Author: Akash S <akash.ktsn@gmail.com>*/
/*
Calling Sequence:
    dat = vertcat (dat1, dat2, …)
Parameters:
    dat (Structure): Concatenated iddata set.
    dat1, dat2, ... (Structure): iddata sets to be concatenated.
Description:
    Vertical concatenation of iddata datasets. The samples are concatenated in the following way: 
dat.y{e} = [dat1.y{e}; dat2.y{e}; …] dat.u{e} = [dat1.u{e}; dat2.u{e}; …] 
where e denotes the experiment. The number of experiments, outputs and inputs must be equal for all datasets.
*/
function dat = vertcat(varargin)
    n = length(varargin);
    dat = struct(); // initialize

    for i = 1:n
        dat(i) = varargin(i);
    end
endfunction
