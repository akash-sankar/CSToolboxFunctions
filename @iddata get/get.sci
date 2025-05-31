/*2025 Author: Akash S <akash.ktsn@gmail.com>*/
/*
Calling Sequence:
    get (dat)
    value = get (dat, 'key')
    [val1, val2, …] = get (dat, 'key1', 'key2', …)
Parameters:
    val: Key values of iddata objects.
    dat (Structure): iddata set.
    key (String): Key of the required value.
Description:
    Access key values of iddata objects. Type get(dat) to display a list of available keys.
*/
function varargout = get_iddata(dat, varargin)
    rhs = argn(2);
    if rhs == 1 then
        [keys, vals] = __iddata_keys__(dat);
        nrows = size(keys, "*");
        str_keys = strjust(string(keys), "right");
        str_vals = string(vals);
        str = [];
        for i = 1:nrows
            str(i) = "   " + str_keys(i) + ":  " + str_vals(i);
        end
        disp(str);
    else
        if dat.type ~= "iddata" then
            error("Usage: get(dat, ""key"")");
        end

        keys = __iddata_keys__(dat, %t);

        for k = 1:(rhs-1)
            key = __match_key__(varargin(k), keys, "iddata: get");

            select key
                case "y" then
                    val = dat.y;
                case "outdata" then
                    val = dat.y;
                case "outputdata" then
                    val = dat.y;
                case "u" then
                    val = dat.u;
                case "indata" then
                    val = dat.u;
                case "inputdata" then
                    val = dat.u;
                case "outname" then
                    val = dat.outname;
                case "outputname" then
                    val = dat.outname;
                case "inname" then
                    val = dat.inname;
                case "inputname" then
                    val = dat.inname;
                case "outunit" then
                    val = dat.outunit;
                case "outputunit" then
                    val = dat.outunit;
                case "inunit" then
                    val = dat.inunit;
                case "inputunit" then
                    val = dat.inunit;
                case "tsam" then
                    val = dat.tsam;
                case "timeunit" then
                    val = dat.timeunit;
                case "expname" then
                    val = dat.expname;
                case "experimentname" then
                    val = dat.expname;
                case "name" then
                    val = dat.name;
                case "notes" then
                    val = dat.notes;
                case "userdata" then
                    val = dat.userdata;
                case "domain" then
                    val = dat.timedomain;
                case "timedomain" then
                    val = dat.timedomain;
                case "w" then
                    val = dat.w;
                case "frequency" then
                    val = dat.w;
                case "samplinginstants" then
                    val = dat.w;
                else
                    error("iddata: get: invalid key name ""%s""", varargin(k));
            end

            varargout(k) = val;
        end
    end
endfunction

function [keys, vals] = __iddata_keys__(dat, aliases)
    if argn(2) < 2 then
        aliases = %f;
    end

    [n, p, m, e] = size(dat);

    keys = ["y";
            "outname";
            "outunit";
            "u";
            "inname";
            "inunit";
            "tsam";
            "timeunit";
            "expname";
            "name";
            "notes";
            "userdata"];

    vals = [msprintf("(%dx1) cell vector of (nx%d) matrices", e, p);
            msprintf("(%dx1) cell vector of strings", p);
            msprintf("(%dx1) cell vector of strings", p);
            msprintf("(%dx1) cell vector of (nx%d) matrices", e, m);
            msprintf("(%dx1) cell vector of strings", m);
            msprintf("(%dx1) cell vector of strings", m);
            msprintf("(%dx1) cell vector of scalars", e);
            "string";
            msprintf("(%dx1) cell vector of strings", e);
            "string";
            "string or cell of strings";
            "any data type"];

    if aliases then
        ka = ["outdata";
              "outputdata";
              "outputname";
              "outputunit";
              "indata";
              "inputdata";
              "inputname";
              "inputunit";
              "experimentname";
              "w";
              "frequency";
              "samplinginstants";
              "domain";
              "timedomain"];
        keys = [keys; ka];
    end
endfunction

function key = __match_key__(str, props, caller)
    if argn(2) < 3 then
        caller = "match_key";
    end

    if typeof(str) ~= "string" then
        error("%s: key name must be a string", caller);
    end

    idx = convstr(props, "l") == convstr(str, "l");

    n = sum(idx);
    if n == 1 then
        key = convstr(str, "l");
        return;
    elseif n > 1 then
        error("%s: key name ""%s"" is ambiguous", caller, str);
    end

    idx = [];
    for i = 1:size(props, "*")
        s2 = props(i);
        match_len = min(length(str), length(s2));
        if convstr(part(str, 1:match_len), "l") == convstr(part(s2, 1:match_len), "l") then
            idx($+1) = i;
        end
    end

    n = length(idx);

    if n == 1 then
        key = convstr(props(idx(1)), "l");
    elseif n > 1 then
        err = "iddata: get: key name """+str+""" is ambiguous";
        error(err);
    else
        err = "iddata: get: key name """+str+""" is unknown";
        error(err);
    end
endfunction

function str_out = strjust(str_in, pos)
    if argn(2) < 2 then
        pos = "right";
    end

    if type(str_in) == 10 then
        str_in = matrix(str_in, -1, 1);
    else
        error("strjust: input must be a string matrix or cell array of strings");
    end

    for i = 1:size(str_in, "*")
        str_in(i) = strsubst(str_in(i), ascii(0), " ");
    end

    max_len = max(length(str_in));

    str_out = str_in;
    for i = 1:size(str_in, "*")
        s = str_in(i);
        pad_len = max_len - length(s);

        select pos
        case "right"
            str_out(i) = blanks(pad_len) + s;
        case "left"
            str_out(i) = s + blanks(pad_len);
        case "center"
            left_pad = floor(pad_len / 2);
            right_pad = pad_len - left_pad;
            str_out(i) = blanks(left_pad) + s + blanks(right_pad);
        else
            error("strjust: unknown justification ""%s""", pos);
        end
    end
endfunction
