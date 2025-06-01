# @iddata/size

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
dat = iddata((1:6)',(1:6)',-1,'outname','Output','inname','Input','expname','Experiment 1');
size_iddata(dat)
```
```

```
2.
```
dat = iddata((1:6)',(1:6)',-1,'outname','Output','inname','Input','expname','Experiment 1');
val = size_iddata(dat)
```
```
 val = [1x4 double]

   6.   1.   1.   1.
```

3.
```
dat = iddata((1:6)',(1:6)',-1,'outname','Output','inname','Input','expname','Experiment 1');
out = size_iddata(dat,2)
```
```
 out = 

   1.
```

4.
```
dat = iddata((1:6)',(1:6)',-1,'outname','Output','inname','Input','expname','Experiment 1');
[x, p, m, e] = size_iddata(dat)
```
```
 x = 

   6.

 p = 

   1.

 m = 

   1.

 e = 

   1.
```

5.
```
dat = iddata((1:6)',(1:6)',-1,'outname','Output','inname','Input','expname','Experiment 1');
[x, p, m, e] = size_iddata(dat,10)
```
```
at line    54 of function size_iddata ( C:\Users\KARTHIK\Desktop\Scilab\size_iddata.sci line 54 )

Invalid dimension.
```

6.
```
dat = iddata((1:6)',(1:6)',-1,'outname','Output','inname','Input','expname','Experiment 1');
[x, p, m, e, y] = size_iddata(dat)
```
```
Wrong number of output arguments.
```
