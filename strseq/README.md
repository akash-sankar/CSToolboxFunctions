# strseq

## Description
Return a cell vector of indexed strings by appending the indices idx to the string str.

## Calling Sequence
- `strvec = strseq (str, idx)`

## Parameters
- `strvec` (String vector): Sequence of indexed string.
- `str` (String): Input string.
- `idx` (Real vector): Integer values (1-by-n).

## Examples
1.
```
strvec = strseq("Scilab",[1 2 5 6])
```
```
strvec = [4x1 string]

  "Scilab1"
  "Scilab2"
  "Scilab5"
  "Scilab6"
```

2.
```
strvec = strseq("Scilab",1)
```
```
 strvec = 

  "Scilab1"
```

3.
```
strvec = strseq("Scilab",[1 2 5 6],[1 2])
```
```
at line     2 of function strseq ( /Users/akashnandan/Desktop/Scilab/strseq.sci line 2 )

Wrong number of input arguments.
```

4.
```
strvec = strseq([1 2 5 6],"Scilab")
```
```
at line     3 of function strseq ( /Users/akashnandan/Desktop/Scilab/strseq.sci line 3 )

Usage: strseq(str, idx)
```

5.
```
strvec = strseq("Scilab",["IITB", "FOSSEE"])
```
```
at line     3 of function strseq ( /Users/akashnandan/Desktop/Scilab/strseq.sci line 3 )

Usage: strseq(str, idx)
```

