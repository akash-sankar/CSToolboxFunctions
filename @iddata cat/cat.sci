/*2025 Author: Akash S <akash.ktsn@gmail.com>*/
/*
Calling Sequence:
    dat = cat_iddata (dim, dat1, dat2, …)
Parameters:
    dat (Structure): Concatenated iddata set.
    dim (Real scalar): Dimension along which the concatenation takes place
        - dim = 1: Concatenate samples. The samples are concatenated in the following way: dat.y{e} = [dat1.y{e}; dat2.y{e}; …] dat.u{e} = [dat1.u{e}; dat2.u{e}; …] 
                   where e denotes the experiment. The number of experiments, outputs and inputs must be equal for all datasets. Equivalent to vertcat.
        - dim = 2: Concatenate inputs and outputs. The outputs and inputs are concatenated in the following way: dat.y{e} = [dat1.y{e}, dat2.y{e}, …] dat.u{e} = [dat1.u{e}, dat2.u{e}, …] 
                   where e denotes the experiment. The number of experiments and samples must be equal for all datasets. Equivalent to horzcat.
        - dim = 3: Concatenate experiments. The experiments are concatenated in the following way: dat.y = [dat1.y; dat2.y; …] dat.u = [dat1.u; dat2.u; …].
                   The number of outputs and inputs must be equal for all datasets. Equivalent to merge.
    dat1, dat2, … (Structure): iddata sets to be concatenated.
Description:
    Concatenate iddata sets along dimension dim.
*/
function dat = cat_iddata(dim, varargin)
    if ~(size(dim,'*') == 1 && isreal(dim)) then
        error("cat_iddata: dim must be real and scalar");
    end
    
    nargs = argn(2) - 1;
    tmp = varargin;
    
    n = list();
    p = list();
    m = list();
    e = list();
    
    for k = 1:nargs
        [nk, pk, mk, ek] = size_iddata(varargin(k));
        n(k) = nk;
        p(k) = pk;
        m(k) = mk;
        e(k) = ek;
    end
    
    tsam = tmp(1).tsam;
    expname = tmp(1).expname;
    outname = tmp(1).outname;
    outunit = tmp(1).outunit;
    inname = tmp(1).inname;
    inunit = tmp(1).inunit;
    timedomain = tmp(1).timedomain;
    
    check_domain(tmp);
    
        select dim
    case 1 then
        check_experiments(e);
        [p, m] = get_output_input_sizes(tmp);
        check_outputs(tmp, p);
        check_inputs(tmp, m);

        ycat = tmp(1).y(1);
        ucat = tmp(1).u(1);
        for i = 2:nargs
            ycat = [ycat; tmp(i).y(1)];
            ucat = [ucat; tmp(i).u(1)];
        end
        y = list(ycat); u = list(ucat);

    case 2 then
        check_experiments(e);
        check_samples(tmp);
        [p, m] = get_output_input_sizes(tmp);

        ycat = tmp(1).y(1);
        ucat = tmp(1).u(1);
        for i = 2:nargs
            ycat = [ycat, tmp(i).y(1)];
            ucat = [ucat, tmp(i).u(1)];
        end
        y = list(ycat); u = list(ucat);

        outname = list();
        outunit = list();
        inname = list();
        inunit = list();
        for i = 1:nargs
            outname($+1) = tmp(i).outname(1);
            outunit($+1) = tmp(i).outunit(1);
            inname($+1) = tmp(i).inname(1);
            inunit($+1) = tmp(i).inunit(1);
        end

    case 3 then
        [p, m] = get_output_input_sizes(tmp);
        check_outputs(tmp, p);
        check_inputs(tmp, m);

        y = list(); u = list();
        tsam = list(); expname = list();
        for i = 1:nargs
            for j = 1:length(tmp(i).y)
                if type(tmp(i).y(j)) == 15 then
                    y($+1) = tmp(i).y(j)(1);
                else
                    y($+1) = tmp(i).y(j);
                end
                
                if type(tmp(i).u(j)) == 15 then
                    u($+1) = tmp(i).u(j)(1);
                else
                    u($+1) = tmp(i).u(j);
                end
                tsam($+1) = tmp(i).tsam(j);
                expname($+1) = tmp(i).expname(j);
             end
        end

    else
        error(msprintf("iddata: cat: ""%d"" is an invalid dimension", dim));
    end
    disp(y, u, tsam);
    dat = iddata(y, u, tsam);
    dat.expname = expname;
    dat.outname = outname;
    dat.outunit = outunit;
    dat.inname = inname;
    dat.inunit = inunit;
    dat.timedomain = timedomain;
    
endfunction

function check_domain(tmp)
    td = tmp(1).timedomain;
    for i = 2:length(tmp)
        if tmp(i).timedomain <> td then
            error("iddata: cat: cannot mix time- and frequency-domain datasets");
        end
    end
endfunction

function check_experiments(e)
    for i = 2:length(e)
        if e(i) <> e(1) then
            error("iddata: cat: number of experiments do not match");
        end
    end
endfunction

function [p, m] = get_output_input_sizes(tmp)
    p = list(); m = list();
    for i = 1:length(tmp)
        if type(tmp(i).y(1)) == 15 then
            y = tmp(i).y(1)(1);
        else
            y = tmp(i).y(1);
        end
        
         if type(tmp(i).u(1)) == 15 then
            u = tmp(i).u(1)(1);
        else
            u = tmp(i).u(1);
        end
        
        p($+1) = size(y, 2);
        m($+1) = size(u, 2);
    end
endfunction

function check_outputs(tmp, p)
    for i = 2:length(p)
        if p(i) <> p(1) then
            error("iddata: cat: number of outputs do not match");
        end
    end
    if ~compare_strings(tmp, "outname") then
        warning("iddata: cat: output names do not match\n");
    end
    if ~compare_strings(tmp, "outunit") then
        warning("iddata: cat: output units do not match\n");
    end
endfunction

function check_inputs(tmp, m)
    for i = 2:length(m)
        if m(i) <> m(1) then
            error("iddata: cat: number of inputs do not match");
        end
    end
    if ~compare_strings(tmp, "inname") then
        warning("iddata: cat: input names do not match\n");
    end
    if ~compare_strings(tmp, "inunit") then
        warning("iddata: cat: input units do not match\n");
    end
endfunction

function check_samples(tmp)
    n = size(tmp(1).y(1), 1);
    for i = 2:length(tmp)
        if size(tmp(i).y(1), 1) <> n then
            error("iddata: cat: number of samples do not match");
        end
    end
endfunction

function result = compare_strings(tmp, field)
    first = tmp(1)(field)(1);
    for i = 2:length(tmp)
        if tmp(i)(field)(1) <> first then
            result = %f;
            return;
        end
    end
    result = %t;
endfunction
