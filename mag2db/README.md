# mag2db

## Description
Convert Magnitude to Decibels (dB).

## Calling Sequence
- `db = mag2db (mag)`

## Parameters
- `mag` (real-valued scalars and matrices): Magnitude value(s)

## Examples
1.
```
mag2db(10)
```
```
ans = 

   20.
```
2.
```
mag2db([10,20,30])
```
```
ans = [1x3 double]

   20.   26.0206   29.542425
```
3.
```
mag2db(-1)
```
```
ans = 

   Nan
```
4.
```
mag2db([10,20,30,complex(1,2),-1])
```
```
at line     8 of function mag2db ( /Users/akashnandan/Desktop/Scilab/mag2db.sci line 8 )

mag2db: first argument must be a real matrix
```
5.
```
mag2db([10,20,30,-1])
```
```
ans = [1x4 double]

   20.   26.0206   29.542425   Nan
```
6.
```
mag2db([10,20,30,0])
```
```
 ans = [1x4 double]

   20.   26.0206   29.542425  -Inf
```
