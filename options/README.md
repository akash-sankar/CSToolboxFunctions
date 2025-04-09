# options

## Calling Sequence
- `opt = options ('key1', value1, 'key2', value2, …)`

## Description
Return controllability matrix.

Create options struct opt from a number of key and value pairs. For use with order reduction and system identification functions. Option structs are a way to avoid typing the same key and value pairs over and over again.

## Parameters
- `opt` (struct): Struct with fields for each key.
- `key` (string): The name of the property.
- `value`: The value of the property.

## Examples
1.
```
opt = options ("method", "spa", "tol", 1e-6)
```
```
ans = [struct] with fields:
  string: [struct] with fields:
      method = "spa"
      tol = 1e-6
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
