/*2025 Author: Akash S <akash.ktsn@gmail.com>*/
/*
Calling Sequence:
    nvec = size (sys)
    n = size (sys, dim)
    [p, m] = size (sys)
Parameters:
    nvec (Row vector): The first element is the number of outputs (rows) and the second element the number of inputs (columns).
    n (Real scalar): The size of the dimension dim.
    p (Real scalar): Number of outputs.
    m (Real scalar): Number of inputs.
    sys (State-space): LTI system.
    dim (Real scalar): If given a second argument, size will return the size of the corresponding dimension.
Description:
    LTI model size, i.e. number of outputs and inputs.
*/
function [n, varargout] = size_lti(sys, dim)

  if typeof(sys) <> "state-space" & typeof(sys) <> "rational" then
    error("Input must be an LTI system (state-space or transfer function).");
  end

  if argn(2) > 2 then
    error("Too many input arguments.");
  end

  if argn(2) < 2 then
    dim = 0;
  end

  [p, m] = size(sys);

  select dim
    case 0 then
      select argn(1)
        case 0 then
          stry = ""; stru = "";
          if p <> 1 then stry = "s"; end
          if m <> 1 then stru = "s"; end
          disp(msprintf("LTI model with %d output%s and %d input%s.", p, stry, m, stru));
        case 1 then
          n = [p, m];
        case 2 then
          n = p;
          varargout(1) = m;
        else
          error("Too many output arguments.");
      end

    case 1 then
      n = p;

    case 2 then
      n = m;

    else
      error("Invalid dimension.");
  end

endfunction
