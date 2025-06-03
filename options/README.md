# options

## Description
Create options struct opt from a number of key and value pairs. For use with order reduction and system identification functions. Option structs are a way to avoid typing the same key and value pairs over and over again.

## Calling Sequence
- `opt = options ('key1', value1, 'key2', value2, …)`

## Parameters
- `opt` (struct): Struct with fields for each key.
- `key` (string): The name of the property.
- `value`: The value of the property.

## Examples
1.
```
opt = options("color", "blue", "size", 10);
disp(opt);
```
```
  [struct] with fields:
  string: [struct] with fields:
      color = "blue"
      size = 10
```
2.
```
opt = options();
```
```
"Usage: options(key1, value1, key2, value2, ...)"
```

3.
```
opt = options("color", "red", "size");
```
```
Error: Properties and values must come in pairs
```

4.
```
opt = options("width", 5.5, "enabled", %t, "name", "sensorA");
```
```
  [struct] with fields:

  string: [struct] with fields:
      width = 5.5
      enabled = %t
      name = "sensorA"
```
5.
```
opt = options("mode", "auto", "mode", "manual");
```
```
  [struct] with fields:

  string: [struct] with fields:
      mode = "manual"
```
