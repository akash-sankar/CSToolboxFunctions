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
function [x, p, m, e] = size_iddata(dat, dim)

  if argn(2) > 2 then
    error("Too many input arguments.");
  end

  if argn(2) < 2 then
    dim = 0;
  end

  ylist = dat.y;
  e = size(ylist); // number of experiments
  n = zeros(1, e);   // number of samples

  for k = 1:e
    ymat = ylist(k); // each experiment
    n(k) = size(ymat, 1);
  end

  p = size(dat.outname); // number of outputs
  m = size(dat.inname);  // number of inputs

  select dim
    case 0 then
      select argn(1)
        case 0 then
          stry = ""; stru = ""; stre = "";
          if p <> 1 then stry = "s"; end
          if m <> 1 then stru = "s"; end
          if e <> 1 then stre = "s"; end
          msprintf("IDDATA set with [%s] samples, %d output%s, %d input%s and %d experiment%s.", strcat(string(n), " "), p, stry, m, stru, e, stre);
        case 1 then
          x = [sum(n), p, m, e];
        case 2 then
          x = n;
        case 3 then
          x = n;
        case 4 then
          x = n;
        else
          error("Too many output arguments.");
      end

    case 1 then
      x = n;
    case 2 then
      x = p;
    case 3 then
      x = m;
    case 4 then
      x = e;
    else
      error("Invalid dimension.");
  end
endfunction

