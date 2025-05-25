function k = acker(A, b, p)

  if argn(2) <> 3 then
    error("Usage: k = acker(A, b, p)");
  end

  if ~isreal(A) | ~isreal(b) | ~issquare(A) | size(A,1) <> size(b,1) then
    error("acker: matrix A and vector b not conformal");
  end

  if ~isreal(p) | ~isvector(p) | size(p, '*') <> size(A,1) then
    error(msprintf("acker: p must be a vector of size %d", size(A,1)));
  end

  C = ctr_gram(A, b); // Controllability matrix
  phiA = polyvalm(poly(p), A); // Characteristic polynomial matrix
  k = inv(C)($, :) * phiA;

endfunction
