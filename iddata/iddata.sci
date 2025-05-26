/*2024 Author: Akash S <akash.ktsn@gmail.com>*/
/*
iddata - Create identification dataset of output and input signals
Calling Sequence
   dat = iddata(y)
   dat = iddata(y, u)
   dat = iddata(y, u, tsam)
   dat = iddata(y, u, tsam, 'key1', value1, ..., 'keyN', valueN)

Parameters
   dat       : Struct or object with fields y, u, tsam, expname, etc.

   y         : Real matrix or cell array
               - Single experiment: n-by-p matrix (n samples, p outputs)
               - Multiple experiments: e-by-1 or 1-by-e cell of n(i)-by-p matrices

   u         : (Optional) Real matrix or cell array
               - Single experiment: n-by-m matrix (m inputs)
               - Multiple experiments: cell of n(i)-by-m matrices
               - If not provided or [], dataset is treated as time series.

   tsam      : (Optional) Real scalar or cell
               - Scalar: uniform sampling time
               - Cell: one tsam per experiment
               - Default is -1 (unspecified)

   'key',val : (Optional) Property-value pairs
               - 'expname'   : Cell of experiment names
               - 'outname'   : Cell of output channel names
               - 'outunit'   : Cell of output channel units
               - 'inname'    : Cell of input channel names
               - 'inunit'    : Cell of input channel units
               - 'timeunit'  : Cell of time unit strings
               - 'name'      : Name of the dataset
               - 'notes'     : String or cell of strings
               - 'userdata'  : Any user-defined data

Description
   This function generates an identification dataset object bundling input and output signals, sampling time, and optional metadata.
   It supports single and multiple experiments and is typically used forsystem identification tasks. Output
*/
function dat = iddata(y, u, tsam, varargin)
    // Handle default arguments
    if argn(2) < 1 then
        error("Wrong number of input arguments");
    end

    if argn(2) == 1 & typeof(y) == "iddata" then
        dat = y;
        return
    end

    if argn(2) < 2 then
        u = list();
    end
    if argn(2) < 3 then
        tsam = list();
    end

    [y, u] = __adjust_iddata__(y, u);
    [p, m, e] = __iddata_dim__(y, u);
    tsam = __adjust_iddata_tsam__(tsam, e);

    outname = list();
    inname = list();
    expname = list();
    for i = 1:p
        outname($+1) = "";
    end
    for i = 1:m
        inname($+1) = "";
    end
    for i = 1:e
        expname($+1) = "";
    end

    dat = struct("y", y, "outname", outname, "outunit", outname, "u", u, "inname", inname, "inunit", inname, "tsam", tsam, "timeunit", "", "timedomain", %t, "w", list(), "expname", expname, "name", "", "notes", list(), "userdata", [], "type", "iddata");
endfunction

function [y, u] = __adjust_iddata__(y, u)
    if typeof(y) <> "list" then
        y = list(y);
    end
    if isempty(u) then
        u = list();
    elseif typeof(u) <> "list" then
        u = list(u);
    end
endfunction

function [p, m, e] = __iddata_dim__(y, u)
    e = length(y);

    pList = list(); mList = list();
    if isempty(u) then
        for i = 1:e
            [pi, mi] = __experiment_dim__(y(i));
            pList($+1) = pi;
            mList($+1) = 0;
        end
    elseif length(u) == e then
        for i = 1:e
            [pi, mi] = __experiment_dim__(y(i), u(i));
            pList($+1) = pi;
            mList($+1) = mi;
        end
    else
        error("iddata: require input and output data with matching number of experiments");
    end

    if e > 1 then
        for i = 2:e
            if pList(1) <> pList(i) then
                error("iddata: require identical number of output channels for all experiments");
            end
            if mList(1) <> mList(i) then
                error("iddata: require identical number of input channels for all experiments");
            end
        end
    end

    p = pList(1);
    m = mList(1);
endfunction

function [p, m] = __experiment_dim__(y, u)
    if typeof(y) == "list" then
        y = y(1);
    end
    if typeof(u) == "list" then
        u = u(1);
    end

    [ly, p] = size(y);
    if ~isempty(u) then
        [lu, m] = size(u);
        if ly <> lu then
            error("iddata: matrices y and u must have same number of rows");
        end
    else
        m = 0;
    end
endfunction

function tsam = __adjust_iddata_tsam__(tsam, e)
    if isempty(tsam) then
        tsam = list();
        for i = 1:e
            tsam($+1) = -1;
        end
    elseif typeof(tsam) <> "list" then
        tsam = list(tsam);
    end

    if length(tsam) == 1 & e > 1 then
        val = tsam(1);
        tsam = list();
        for i = 1:e
            tsam($+1) = val;
        end
    elseif length(tsam) <> e then
        error("iddata: there are %d experiments, but only %d sampling times", e, length(tsam));
    end
endfunction
