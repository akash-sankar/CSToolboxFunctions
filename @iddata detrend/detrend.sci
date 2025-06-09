/*2025 Author: Akash S <akash.ktsn@gmail.com>*/
/*
Calling Sequence:
    datout = detrend (dat)
    datout = detrend (dat, ord)
Parameters:
    datout (Structure): Output iddata set
    dat (Structure): Input iddata set
    ord (Real scalar/String): The order of the polynomial
        - ord = 0 (or) "constant"
        - ord = 1 (or) "linear"
Description:
    Detrend outputs and inputs of dataset dat by removing the best fit of a polynomial of order ord. If ord is not specified, default value 0 is taken. This corresponds to removing a constant.
*/
function dat = detrend_iddata(dat, ord)
    if argn(2) > 2 then
        error("Usage: dat = detrend(dat)\nUsage: dat = detrend(dat, ord)");
    end
    if argn(2) < 2 then
        ord = 0;
    end
    
    if dat.type <> "iddata" then
        error("Input must be an iddata set");
    end
    
    if type(ord) == 1 then
        if (~isreal(ord) | size(ord, "*") <> 1 | int(ord) <> ord) & ~ischar(ord) then
            error("iddata: detrend: second argument must be a positive integer or a character");
        end

        if ord == 0 then
            flag = "constant";
        elseif ord == 1 then
            flag = "linear";
        else
            error("Only ord = 0 or 1 are supported in Scilab''s detrend()");
        end
    end
    
    if type(ord) == 10 then
        flag = ord;
    end

    [n, p, m] = size_iddata(dat);

    for k = 1:length(dat.y)
        yk = dat.y(k);
        uk = dat.u(k);

        if type(yk) == 15 then
            yk = yk(1);
        end
        if type(uk) == 15 then
            uk = uk(1);
        end

        if size(yk, 1) > 1 then
            dat.y(k) = list(detrend(yk, flag));
        else
            dat.y(k) = list(zeros(1, p));
        end

        if size(uk, 1) > 1 then
            dat.u(k) = list(detrend(uk, flag));
        else
            dat.u(k) = list(zeros(1, m));
        end
    end
endfunction

