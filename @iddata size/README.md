# size

## Calling Sequence
- `nvec = size (dat)`
- `ndim = size (dat, dim)`
- `[n, p, m, e] = size (dat)`

## Description
Return dimensions of iddata set dat.

## Parameters
- `nvec` (Row vector): Row vector. The first element is the total number of samples (rows of dat.y and dat.u). The second element is the number of outputs (columns of dat.y) and the third element the number of inputs (columns of dat.u). The fourth element is the number of experiments.
- `ndim` (Real scalar): The size of the dimension dim.
- `n` (Row vector): Contains the number of samples of each experiment.
- `p` (Real scalar): Number of outputs.
- `m` (Real scalar): Number of inputs.
- `e` (Real scalar): Number of experiments.
- `dat` (Structure): iddata set.
- `dim` (Real scalar): If given a second argument, size will return the size of the corresponding dimension.

## Examples
1.
```

```
```

```
2.
```

```
```

```

3.
```

```
```

```

4.
```

```
```

```

5.
```

```
```

```
