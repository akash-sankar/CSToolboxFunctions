function ob = obsv (a, c)

  if (nargin == 1) then
    ob = ctrb (a.').';
  elseif (nargin == 2) then
    ob = ctrb (a.', c.').';
  else
    error("obsv: Invalid number of arguments")
  end

endfunction
