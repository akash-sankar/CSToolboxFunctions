/*2024 Author: Akash S <akash.ktsn@gmail.com>*/
/*
Calling Sequence:
        ob = ctrb (sys)
        ob = ctrb (a, c)
Parameters:
        sys (State-space): LTI model.
        a (Real matrix): State matrix (n-by-n).
        b (Real matrix): Input matrix (p-by-n).
Description:
        Return controlability matrix.
*/
function co = ctrb(a, b)

  if nargin == 1 then
    if typeof(a) <> 'state-space' then
      error("ctrb: argument must be an lti system");
    end
    A = a.A;
    B = a.B;
  end
  if nargin == 2 then
    [m, n] = size(a);
    [p, q] = size(b);
    if m ~= n || p ~= m || ~isreal(a) || ~isreal(b) then
      error("ctrb: invalid arguments (a, b)");
    end
    A = a;
    B = b;
  end
  if nargin<1 || nargin > 2 then
      error("Incorrect number of arguments");
  end

  n = size(A,1);
  co = B;

  for k = 1:n-1
    co = [co, A^k * B];
  end

endfunction
