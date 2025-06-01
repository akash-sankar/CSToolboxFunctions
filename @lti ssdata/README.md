# @lti/ssdata

## Calling Sequence
- `[a, b, c, d, tsam] = ssdata (sys)`

## Description
Access state-space model data. Argument sys is not limited to state-space models. If sys is not a state-space model, it is converted automatically.

## Parameters
- `a` (Real matrix): State matrix (n-by-n).
- `b` (Real matrix): Input matrix (n-by-m).
- `c` (Real matrix): Measurement matrix (p-by-n).
- `d` (Real matrix): Feedthrough matrix (p-by-m).
- `tsam` (Real scalar): Sampling time in seconds. If sys is a continuous-time model, a zero is returned.
- `sys` (State-space): LTI system.

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
