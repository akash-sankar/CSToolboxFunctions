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
    if argn(2) < 1 then
        error("Wrong number of input arguments");
    end

    if argn(2) == 1 & typeof(y) == "st" & y.type == "iddata" then
        dat = y;
        return
    end

    if argn(2) < 2 then
        u = list();
    end
    if argn(2) < 3 then
        tsam = list();
    end

    // Convert cell (ce) to list of experiments
    if typeof(y) == "ce" then
        tmp = list();
        for i = 1:size(y, "*")
            if typeof(y{i}) <> "ce" & typeof(y{i}) <> "list" then
                tmp(i) = list(y{i});
            else
                tmp(i) = y{i};
            end
        end
        y = tmp;
    end

    if typeof(u) == "ce" then
        tmp = list();
        for i = 1:size(u, "*")
            if typeof(u{i}) <> "ce" & typeof(u{i}) <> "list" then
                tmp(i) = list(u{i});
            else
                tmp(i) = u{i};
            end
        end
        u = tmp;
    end

    [y, u] = __adjust_iddata__(y, u);
    [p, m, e] = __iddata_dim__(y, u);
    tsam = __adjust_iddata_tsam__(tsam, e);

    outname = list();
    for i = 1:p, outname($+1) = ""; end
    outunit = list();
    for i = 1:p, outunit($+1) = ""; end
    inname = list();
    for i = 1:m, inname($+1) = ""; end
    inunit = list();
    for i = 1:m, inunit($+1) = ""; end


    expname = list();
    for i = 1:e
        expname($+1) = "";
    end

    dat = struct("y", y, "outname", outname, "outunit", outunit, ...
                 "u", u, "inname", inname, "inunit", inunit, ...
                 "tsam", tsam, "timeunit", "", "timedomain", %t, ...
                 "w", list(), "expname", expname, "name", "", ...
                 "notes", list(), "userdata", [], "type", "iddata");

    // Optional arguments
    if argn(2) > 3 then
        for i = 1:2:length(varargin)
            key = varargin(i);
            value = varargin(i + 1);
            if or(key == ["outname", "inname", "expname", "outunit", "inunit"]) then
                if typeof(value) == "string" then
                    value = list(value);
                end
            end
            dat(string(key)) = value;
        end
    end
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
    
    if ly < p then
        warning("iddata: more outputs than samples - matrix ""y"" should probably be transposed");
    end
    if ~isempty(u) & lu < m then
        warning("iddata: more inputs than samples - matrix ""u"" should probably be transposed");
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
