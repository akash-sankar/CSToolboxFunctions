Function Reference: mag2db

Function File: db = mag2db (mag)

Convert Magnitude to Decibels (dB).

**Inputs**

1)mag: Magnitude value(s). Both real-valued scalars and matrices are accepted.

**Outputs**

1)db: Decibel (dB) value(s).

**Test case**

1) 
*Input*
mag2db(10)

*Output*
 ans = 

   20.

2) 
*Input*
mag2db([10,20,30])

*Output*
 ans = [1x3 double]

   20.   26.0206   29.542425

3)
mag2db(-1)

*Output* 
 ans = 

   Nan

4)
*Input*
mag2db([10,20,30,complex(1,2),-1])

*Output*
at line     8 of function mag2db ( /Users/akashnandan/Desktop/Scilab/mag2db.sci line 8 )

mag2db: first argument must be a real matrix


5) 
*Input*
mag2db([10,20,30,-1])

*Output*
 ans = [1x4 double]

   20.   26.0206   29.542425   Nan

6)
*Input*
mag2db([10,20,30,0])

*Output*
 ans = [1x4 double]

   20.   26.0206   29.542425  -Inf