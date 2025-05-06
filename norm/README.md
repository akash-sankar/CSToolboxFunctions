# norm

## Calling Sequence
- `n = norm(A)`
- `n = norm(A, p)`
- `n = norm(A, p, opt)`

## Description
Compute the p-norm of a matrix or vector `A`.

If `p` is not specified, `p = 2` is used by default.

### If `A` is a matrix (or sparse matrix):

- `p = 1`:  
  **1-norm**, the largest column sum of the absolute values of `A`.

- `p = 2`:  
  **2-norm**, the largest singular value of `A`.

- `p = %inf` or `"inf"`:  
  **Infinity norm**, the largest row sum of the absolute values of `A`.

- `p = "fro"`:  
  **Frobenius norm**, computed as `sqrt(sum(diag(A'*A)))`.

- `p > 1` (other):  
  Maximum value of `norm(A*x, p)` such that `norm(x, p) == 1`.

### If `A` is a vector or scalar:

- `p = %inf` or `"inf"`:  
  Returns `max(abs(A))`.

- `p = -%inf`:  
  Returns `min(abs(A))`.

- `p = "fro"`:  
  Frobenius norm, `sqrt(sumsq(abs(A)))`.

- `p = 0`:  
  Hamming norm—the number of non-zero elements in `A`.

- `p > 1`:  
  p-norm of `A`, `(sum(abs(A).^p))^(1/p)`.

- `p < 1`:  
  p-pseudonorm, computed same as above (note: not a true norm).

### Optional Argument `opt`:

- `opt = "rows"`:  
  Compute the norm of each row, return as a column vector.

- `opt = "columns"` or `"cols"`:  
  Compute the norm of each column, return as a row vector.

## Parameters

- `A`: Real or complex matrix or vector.
- `p`: (optional) Type of norm. Can be numeric or string.
- `opt`: (optional) Dimension along which norms are computed.

## Examples

1.
```
```
```
```
