# augstate

## Description
Append state vector x of system sys to output vector y.

 .                  .
 x = A x + B u      x = A x + B u
 y = C x + D u  =>  y = C x + D u
                    x = I x + O u
                    
## Calling Sequence
- `augsys = augstate (sys)`

## Parameters
- `augsys` (State-space/Transfer function): Output system.
- `sys` (State-space/Transfer function): Input system.

## Dependencies
[@lti/size](https://github.com/akash-sankar/CSToolboxFunctions/tree/main/%40lti%20size)

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
