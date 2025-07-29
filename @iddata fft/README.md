# @iddata/fft

## Description
Transform iddata objects from time to frequency domain using a Fast Fourier Transform (FFT) algorithm.

## Calling Sequence
- `dat_fft = fft (dat)`
- `dat_fft = fft (dat, n)`

## Parameters
- `dat_fft` (Structure): ddata identification dataset in frequency-domain. In order to preserve signal power and noise level, the FFTs are normalized by dividing each transform by the square root of the signal length. The frequency values are distributed equally from 0 to the Nyquist frequency. The Nyquist frequency is only included for even signal lengths.
- `n` (Real scalar/vector): Length of the FFT transformations. If n does not match the signal length, the signals in dat are shortened or padded with zeros. n is a vector with as many elements as there are experiments in dat or a scalar with a common length for all experiments. If not specified, the signal lengths are taken as default values.
- `dat` (Structure): iddata set containing signals in time-domain.

## Dependencies
[iddata](https://github.com/akash-sankar/CSToolboxFunctions/tree/main/iddata), [@iddata/size](https://github.com/akash-sankar/CSToolboxFunctions/tree/main/%40iddata%20size)

## Examples
1.
```
DAT = iddata ({[(1:10).', (1:2:20).'], [(10:-1:1).', (20:-2:1).']}, {[(41:50).', (46:55).'], [(61:70).', (-66:-1:-75).']});
DAT_FFT = fft_iddata(DAT, [])
DAT_FFT.y(1)(1)
DAT_FFT.y(2)(1)
DAT_FFT.u(1)(1)
DAT_FFT.u(2)(1)
```
```
 DAT_FFT = [struct] with fields:

  y: (2-elements list)
      (1): (1-element list)
          (1): [6x2 double]
      (2): (1-element list)
          (1): [6x2 double]
  outname: (2-elements list)
      (1) = ""
      (2) = ""
  outunit: (2-elements list)
      (1) = ""
      (2) = ""
  u: (2-elements list)
      (1): (1-element list)
          (1): [6x2 double]
      (2): (1-element list)
          (1): [6x2 double]
  inname: (2-elements list)
      (1) = ""
      (2) = ""
  inunit: (2-elements list)
      (1) = ""
      (2) = ""
  tsam: (2-elements list)
      (1) = -1
      (2) = -1
  timeunit = ""
  timedomain = %f
  w: (2-elements list)
      (1) = [0;0.6283185;1.2566371;1.8849556;2.5132741;3.1415927]
      (2) = [0;0.6283185;1.2566371;1.8849556;2.5132741;3.1415927]
  expname: (2-elements list)
      (1) = ""
      (2) = ""
  name = ""
  notes: (empty list)
  userdata = []
  type = "iddata"

 DAT_FFT.y(1)(1) = [6x2 double]

   17.392527 + 0.i          31.622777 + 0.i       
  -1.5811388 + 4.8662449i  -3.1622777 + 9.7324899i
  -1.5811388 + 2.1762509i  -3.1622777 + 4.3525018i
  -1.5811388 + 1.1487646i  -3.1622777 + 2.2975292i
  -1.5811388 + 0.5137431i  -3.1622777 + 1.0274863i
  -1.5811388 + 0.i         -3.1622777 + 0.i

 DAT_FFT.y(2)(1) = [6x2 double]

   17.392527 + 0.i          34.785054 + 0.i       
   1.5811388 - 4.8662449i   3.1622777 - 9.7324899i
   1.5811388 - 2.1762509i   3.1622777 - 4.3525018i
   1.5811388 - 1.1487646i   3.1622777 - 2.2975292i
   1.5811388 - 0.5137431i   3.1622777 - 1.0274863i
   1.5811388 + 0.i          3.1622777 + 0.i       

 DAT_FFT.u(1)(1) = [6x2 double]

   143.88363 + 0.i          159.69502 + 0.i       
  -1.5811388 + 4.8662449i  -1.5811388 + 4.8662449i
  -1.5811388 + 2.1762509i  -1.5811388 + 2.1762509i
  -1.5811388 + 1.1487646i  -1.5811388 + 1.1487646i
  -1.5811388 + 0.5137431i  -1.5811388 + 0.5137431i
  -1.5811388 + 0.i         -1.5811388 + 0.i       

 DAT_FFT.u(2)(1) = [6x2 double]

   207.12919 + 0.i         -222.94058 + 0.i       
  -1.5811388 + 4.8662449i   1.5811388 - 4.8662449i
  -1.5811388 + 2.1762509i   1.5811388 - 2.1762509i
  -1.5811388 + 1.1487646i   1.5811388 - 1.1487646i
  -1.5811388 + 0.5137431i   1.5811388 - 0.5137431i
  -1.5811388 + 0.i          1.5811388 + 0.i       

```
2.
```
DAT = iddata ({[(1:10).', (1:2:20).'], [(10:-1:1).', (20:-2:1).']}, {[(41:50).', (46:55).'], [(61:70).', (-66:-1:-75).']});
DAT_FFT = fft_iddata(DAT, 16)
DAT_FFT.y(1)(1)
DAT_FFT.y(2)(1)
DAT_FFT.u(1)(1)
DAT_FFT.u(2)(1)
DAT_FFT.w(1)
DAT_FFT.w(2)
```
```
 DAT_FFT = [struct] with fields:

  y: (2-elements list)
      (1): (1-element list)
          (1): [9x2 double]
      (2): (1-element list)
          (1): [9x2 double]
  outname: (2-elements list)
      (1) = ""
      (2) = ""
  outunit: (2-elements list)
      (1) = ""
      (2) = ""
  u: (2-elements list)
      (1): (1-element list)
          (1): [9x2 double]
      (2): (1-element list)
          (1): [9x2 double]
  inname: (2-elements list)
      (1) = ""
      (2) = ""
  inunit: (2-elements list)
      (1) = ""
      (2) = ""
  tsam: (2-elements list)
      (1) = -1
      (2) = -1
  timeunit = ""
  timedomain = %f
  w: (2-elements list)
      (1): [9x1 double]
      (2): [9x1 double]
  expname: (2-elements list)
      (1) = ""
      (2) = ""
  name = ""
  notes: (empty list)
  userdata = []
  type = "iddata"

 DAT_FFT.y(1)(1) = [9x2 double]

   13.75     + 0.i          25.       + 0.i       
  -6.5939666 - 5.3274658i  -12.956963 - 9.4937676i
   3.017767  + 0.6464466i   5.6087572 + 1.4696699i
  -2.3616872 + 0.4389416i  -4.6277035 + 1.0210648i
   1.25      - 1.5i         2.25      - 2.75i     
  -0.2240993 + 1.4744755i  -0.5438694 + 2.8850258i
  -0.517767  - 1.3535534i  -1.1087572 - 2.5303301i
   1.1797531 + 0.7080681i   2.1285362 + 1.3701935i
  -1.25      + 0.i         -2.5       + 0.i       

 DAT_FFT.y(2)(1) = [9x2 double]

   13.75     + 0.i          27.5      + 0.i       
   4.0532979 - 7.4453384i   8.1065958 - 14.890677i
   1.6767767 - 2.5909903i   3.3535534 - 5.1819805i
   1.3093077 - 2.0139388i   2.6186155 - 4.0278775i
   1.5       - 1.25i        3.        - 2.5i      
   1.2764787 - 0.7712981i   2.5529574 - 1.5425961i
   1.3232233 - 0.5909903i   2.6464466 - 1.1819805i
   1.3609156 - 0.2026977i   2.7218313 - 0.4053954i
   1.25      + 0.i          2.5       + 0.i       

 DAT_FFT.u(1)(1) = [9x2 double]

   113.75    + 0.i          126.25    + 0.i       
  -15.832762 - 51.774026i  -16.987611 - 57.579846i
   20.088835 - 6.4246212i   22.222718 - 7.3085047i
  -6.1885215 - 5.2883207i  -6.6668758 - 6.0042285i
   11.25     - 11.5i        12.5      - 12.75i    
   3.6027351 + 4.0314845i   4.0810894 + 4.3511106i
   2.4111652 - 8.4246212i   2.7772818 - 9.3085047i
   10.418548 + 2.5457788i   11.573398 + 2.7754926i
  -1.25      + 0.i         -1.25      + 0.i       

 DAT_FFT.u(2)(1) = [9x2 double]

   163.75    + 0.i         -176.25    + 0.i       
  -20.45216  - 74.997307i   21.607009 + 80.803127i
   28.624369 - 9.9601551i  -30.758252 + 10.844039i
  -8.1019387 - 8.1519518i   8.580293  + 8.8678596i
   16.25     - 16.5i       -17.5      + 17.75i    
   5.5161522 + 5.309989i   -5.9945065 - 5.6296151i
   3.8756313 - 11.960155i  -4.2417479 + 12.844039i
   15.037946 + 3.4646341i  -16.192795 - 3.6943479i
  -1.25      + 0.i          1.25      + 0.i

 DAT_FFT.w(1) = [9x1 double]

   0.
   0.3926991
   0.7853982
   1.1780972
   1.5707963
   1.9634954
   2.3561945
   2.7488936
   3.1415927

 DAT_FFT.w(2) = [9x1 double]

   0.
   0.3926991
   0.7853982
   1.1780972
   1.5707963
   1.9634954
   2.3561945
   2.7488936
   3.1415927

```

3.
```
DAT = iddata ({[(1:10).', (1:2:20).'], [(10:-1:1).', (20:-2:1).']}, {[(41:50).', (46:55).'], [(61:70).', (-66:-1:-75).']});
DAT_FFT = fft_iddata(DAT, [8 12])
DAT_FFT.y(1)(1)
DAT_FFT.y(2)(1)
DAT_FFT.u(1)(1)
DAT_FFT.u(2)(1)
DAT_FFT.w(1)
DAT_FFT.w(2)
```
```

 DAT_FFT = [struct] with fields:

  y: (2-elements list)
      (1): (1-element list)
          (1): [5x2 double]
      (2): (1-element list)
          (1): [7x2 double]
  outname: (2-elements list)
      (1) = ""
      (2) = ""
  outunit: (2-elements list)
      (1) = ""
      (2) = ""
  u: (2-elements list)
      (1): (1-element list)
          (1): [5x2 double]
      (2): (1-element list)
          (1): [7x2 double]
  inname: (2-elements list)
      (1) = ""
      (2) = ""
  inunit: (2-elements list)
      (1) = ""
      (2) = ""
  tsam: (2-elements list)
      (1) = -1
      (2) = -1
  timeunit = ""
  timedomain = %f
  w: (2-elements list)
      (1): [5x1 double]
      (2): [7x1 double]
  expname: (2-elements list)
      (1) = ""
      (2) = ""
  name = ""
  notes: (empty list)
  userdata = []
  type = "iddata"

 DAT_FFT.y(1)(1) = [5x2 double]

   12.727922 + 0.i          22.627417 + 0.i       
  -1.4142136 + 3.4142136i  -2.8284271 + 6.8284271i
  -1.4142136 + 1.4142136i  -2.8284271 + 2.8284271i
  -1.4142136 + 0.5857864i  -2.8284271 + 1.1715729i
  -1.4142136 + 0.i         -2.8284271 + 0.i       

 DAT_FFT.y(2)(1) = [7x2 double]

   15.877132 + 0.i          31.754265 + 0.i       
   1.9820508 - 6.319764i    3.9641016 - 12.639528i
   1.8763884 - 2.75i        3.7527767 - 5.5i      
   1.7320508 - 1.4433757i   3.4641016 - 2.8867513i
   1.5877132 - 0.75i        3.1754265 - 1.5i      
   1.4820508 - 0.319764i    2.9641016 - 0.6395281i
   1.4433757 + 0.i          2.8867513 + 0.i       

 DAT_FFT.u(1)(1) = [5x2 double]

   125.86501 + 0.i          140.00714 + 0.i       
  -1.4142136 + 3.4142136i  -1.4142136 + 3.4142136i
  -1.4142136 + 1.4142136i  -1.4142136 + 1.4142136i
  -1.4142136 + 0.5857864i  -1.4142136 + 0.5857864i
  -1.4142136 + 0.i         -1.4142136 + 0.i       

 DAT_FFT.u(2)(1) = [7x2 double]

   189.08221 + 0.i         -203.51597 + 0.i       
  -29.980018 - 21.678203i   31.951706 + 23.649891i
  -1.8763884 - 32.75i       1.8763884 + 35.25i    
   18.763884 - 19.052559i  -20.207259 + 20.495935i
   18.908221 + 0.75i       -20.351597 - 0.75i     
   6.0199819 + 7.8217968i  -6.5482941 - 8.3501089i
  -1.4433757 + 0.i          1.4433757 + 0.i       

 DAT_FFT.w(1) = [5x1 double]

   0.
   0.7853982
   1.5707963
   2.3561945
   3.1415927

 DAT_FFT.w(2) = [7x1 double]

   0.
   0.5235988
   1.0471976
   1.5707963
   2.0943951
   2.6179939
   3.1415927
```

4.
```
DAT = iddata ({[(1:10).', (1:2:20).'], [(10:-1:1).', (20:-2:1).']}, {[(41:50).', (46:55).'], [(61:70).', (-66:-1:-75).']});
DAT_FFT = fft_iddata(DAT, 1 + %i)
```
```
at line    38 of function fft_iddata ( C:\Users\Desktop\fft_iddata.sci line 38 )

iddata: fft: second argument invalid
```

5.
```
DAT = iddata ({[(1:10).', (1:2:20).'], [(10:-1:1).', (20:-2:1).']}, {[(41:50).', (46:55).'], [(61:70).', (-66:-1:-75).']});
DAT_FFT = fft_iddata(DAT, 8, 12)
```
```
at line     3 of function fft_iddata ( C:\Users\KARTHIK\Desktop\fft_iddata.sci line 3 )

Wrong number of input arguments.
```
