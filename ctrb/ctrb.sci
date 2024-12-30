function co = ctrb(a, b)

  if nargin == 1 then
    if typeof(a) <> 'ltisys' then
      error("ctrb: argument must be an lti system");
    end
    [a, b, c, d] = ss2ss(a);
    elseif nargin == 2 then
      [m, n] = size(a);
      [p, q] = size(b);
      if m ~= n || p ~= m || ~isreal(a) || ~isreal(b) then
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
