# ctrb

## Calling Sequence
- `C = pidstd (Kp)`
- `C = pidstd (Kp, Ti)`
- `C = pidstd (Kp, Ti, Td)`
- `C = pidstd (Kp, Ti, Td, N)`

## Description
Return the transfer function C of the PID controller in standard form with first-order roll-off.

                    1        Td s
    C(s) = Kp (1 + ---- + ----------)
                   Ti s   Td/N s + 1

## Parameters
- `Kp`: Proportional gain.
- `Ti`: Integral time.
- `Td`: Derivative time.
- `N`: First-order derivative filter divisor.

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
