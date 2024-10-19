function co = ctrb(a, b)

  if argn(2) == 1 then
    if typeof(a) <> 'ltisys' then
      error("ctrb: argument must be an lti system");
    end
    [a, b, c, d] = ss2ss(a);
  elseif argn(2) == 2 then
    if size(a,1) <> size(a,2) | size(a,1) <> size(b,1) then
      error("ctrb: invalid arguments (a, b)");
    end
  else
    error("Incorrect number of arguments");
  end

  n = size(a,1);
  co = b;

  for k = 1:n-1
    co = [co, a^k * b];
  end

endfunction
