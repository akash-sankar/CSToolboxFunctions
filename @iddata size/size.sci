/*2024 Author: Akash S <akash.ktsn@gmail.com>*/
/*
Calling Sequence:
    nvec = size (dat)
    ndim = size (dat, dim)
    [n, p, m, e] = size (dat)
Parameters:
    nvec (Row vector): Row vector. The first element is the total number of samples (rows of dat.y and dat.u). The second element is the number of outputs (columns of dat.y) and the third element the number of inputs (columns of dat.u). The fourth element is the number of experiments.
    ndim (Real scalar): The size of the dimension dim.
    n (Row vector): Contains the number of samples of each experiment.
    p (Real scalar): Number of outputs.
    m (Real scalar): Number of inputs.
    e (Real scalar): Number of experiments.
    dat (Structure): iddata set.
    dim (Real scalar): If given a second argument, size will return the size of the corresponding dimension.
Description:
    Return dimensions of iddata set dat.
*/
function [x, p, m, e] = size(dat, dim)

  if argn(2) > 2 then
    error("Too many input arguments.");
  end

  if argn(2) < 2 then
    dim = 0;
  end

  e = size(dat.y, "*");       // number of experiments
  n = zeros(1, e);            // number of samples
  for k = 1:e
    n(k) = size(dat.y(k), 1);
  end

  p = size(dat.outname, "*"); // number of output channels
  m = size(dat.inname, "*");  // number of input channels

  select dim
    case 0 then                             // ... size (dat)
      select argn(1)
        case 0 then                         // size (dat)
          stry = ""; stru = ""; stre = "";
          if p <> 1 then stry = "s"; end
          if m <> 1 then stru = "s"; end
          if e <> 1 then stre = "s"; end
          msprintf("IDDATA set with [%s] samples, %d output%s, %d input%s and %d experiment%s.", strcat(string(n), " "), p, stry, m, stru, e, stre);
        case 1 then     // x = size (dat)
          x = [sum(n), p, m, e];
        case 2 then // [n, p, m, e] = size (dat)
          x = n;
        case 3 then
          x = n;
        case 4 then
          x = n;
        else // more than 4 return values
          error("Too many output arguments.");
      end

    case 1 then // nvec = size (dat, 1)
      x = n;
    case 2 then // p = size (dat, 2)
      x = p;
    case 3 then // m = size (dat, 3)
      x = m;
    case 4 then // e = size (dat, 4)
      x = e;
    else    // invalid dimension
      error("Invalid dimension.");
  end
endfunction
