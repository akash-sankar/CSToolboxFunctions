# @iddata/get

## Description
Return dimensions of iddata set dat.

## Calling Sequence
- `get (dat)`
- `value = get (dat, 'key')`
- `[val1, val2, …] = get (dat, 'key1', 'key2', …)`

## Parameters
- `value, val1, val2, ...` (Scalar/Vector/Matrix/String): Key values of iddata objects.
- `dat` (Structure): iddata set.
- `key, key1, key2` (String): Key of the required value.

## Examples
1.
```
dat = iddata((1:6)',(1:6)',-1,'outname','Output','inname','Input','expname','Experiment 1');
get_iddata(dat)
```
```
  "          y:  (1x1) cell vector of (nx1) matrices"
  "    outname:  (1x1) cell vector of strings"       
  "    outunit:  (1x1) cell vector of strings"       
  "          u:  (1x1) cell vector of (nx1) matrices"
  "     inname:  (1x1) cell vector of strings"       
  "     inunit:  (1x1) cell vector of strings"       
  "       tsam:  (1x1) cell vector of scalars"       
  "   timeunit:  string"                             
  "    expname:  (1x1) cell vector of strings"       
  "       name:  string"                             
  "      notes:  string or cell of strings"          
  "   userdata:  any data type"
```
2.
```
dat = iddata((1:6)',(1:6)',-1,'outname','Output','inname','Input','expname','Experiment 1');
value = get_iddata(dat, 'tsam')
```
```
 value = (1-element list)

  (1) = -1
```

3.
```
dat = iddata((1:6)',(1:6)',-1,'outname','Output','inname','Input','expname','Experiment 1');
value = get_iddata(dat, 'expname')
```
```
 value = 

  "Experiment 1"
```

4.
```
dat = iddata((1:6)',(1:6)',-1,'outname','Output','inname','Input','expname','Experiment 1');
[val1, val2, val3] = get_iddata(dat, 'expname', 'tsam', 'name')
```
```
 val1 = 

  "Experiment 1"

 val2 = (1-element list)

  (1) = -1

 val3 = 

  ""
```

5.
```
dat = iddata((1:6)',(1:6)',-1,'outname','Output','inname','Input','expname','Experiment 1');
value = get_iddata(dat, 'output')
```
```
at line    35 of function __match_key__ ( C:\Users\KARTHIK\Desktop\Scilab\get_iddata.sci line 171 )
at line    21 of function get_iddata    ( C:\Users\KARTHIK\Desktop\Scilab\get_iddata.sci line 21 )

iddata: get: key name "output" is ambiguous
```
