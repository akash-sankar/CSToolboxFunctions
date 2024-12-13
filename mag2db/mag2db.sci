/*2024 Author: Akash S <akash.ktsn@gmail.com>*/
/*
Calling Sequence
      db = mag2db (mag)
Parameters
      mag (real-valued scalars and matrices): Magnitude value(s).
Description:        
       Convert Magnitude to Decibels (dB).
*/
function db = mag2db(mag)
    
    if argn(1)<>1 then
        error("Usage: mag2db(mag)");
    end
    
    if ismatrix(mag)==%f | isreal(mag)==%f then
        error("mag2db: first argument must be a real matrix");
    end
    
    mag(mag<0)=%nan;
    db=20.*log10(mag)
endfunction
