/*2024 Author: Akash S <akash.ktsn@gmail.com>*/
/*
Calling Sequence:
        k = acker (A, b, p)
Parameters:
        k (Real row vector): State Feedback Gain Vector.
        A (Real square matrix): State matrix of the system in state-space form (n-by-n).
        b (Real matrix): Input matrix.
        P (Real vector):Desired Poles.
Description:
        Calculates the state feedback matrix of a completely controllable SISO system using Ackermann’s formula.
        Given the state-space system and the desired eigenvalues of the closed loop in the vector p, the state feedback vector k is calculated in the form such that the closed loop system matrix has the eigenvalues given in p.
*/
function k = acker(A, b, p)

  if argn(2) <> 3 then
    error("Usage: k = acker(A, b, p)");
  end

  if ~isreal(A) | ~isreal(b) | ~issquare(A) | size(A,1) <> size(b,1) then
    error("acker: matrix A and vector b not conformal");
  end

  if  ~isvector(p) | size(p, '*') <> size(A,1) then
    error(msprintf("acker: p must be a vector of size %d", size(A,1)));
  end

  C = ctrb(A, b);
  phiA = polyvalm(poly_custom(p), A);
  k = inv(C)($, :) * phiA;

endfunction

function y = poly_custom(x)

  if argn(2) < 1 then
    error("Usage: y = poly(x)");
  end

  if typeof(x) <> "constant" then
    error("poly: input must be numeric, not type " + typeof(x));
  elseif ndims(x) > 2 then
    error("poly: input must be a vector or a square matrix");
  elseif isempty(x) then
    y = 1;
    return;
  end

  if isvector(x) then
    v = x(:);
    n = length(v);
  elseif size(x, 1) <> size(x, 2) then
    error("poly: input matrix must be square");
  else
    v = spec(x);
    n = length(v);
  end

  y = zeros(1, n+1);
  y(1) = 1;
  for j = 1:n
    y(2:j+1) = y(2:j+1) - v(j) * y(1:j);
  end

  if isreal(x) then
    y = real(y);
  else
    pos_imag = gsort(v(imag(v) > 0), "g", "i");
    neg_imag = gsort(conj(v(imag(v) < 0)), "g", "i");
    if size(pos_imag, "*") == size(neg_imag, "*") then
      is_equal = (pos_imag == neg_imag);
      if ~isempty(is_equal) & and(is_equal) then
        y = real(y);
      end
    end
  end

endfunction

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

function y = polyvalm(c, x)

  if argn(2) <> 2 then
    error("Usage: y = polyvalm(c, x)");
  end

  if ~isvector(c) & ~isempty(c) then
    error("polyvalm: first argument must be a vector");
  end

  if size(x, 1) <> size(x, 2) then
    error("polyvalm: second argument must be a square matrix");
  end

  n = length(c);

  if n == 0 then
    y = zeros(size(x, 1), size(x, 2));
  else
    id = eye(size(x, 1), size(x, 2));
    y = c(1) * id;
    for i = 2:n
      y = y * x + c(i) * id;
    end
  end

endfunction

