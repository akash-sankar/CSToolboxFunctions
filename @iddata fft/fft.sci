/*2025 Author: Akash S <akash.ktsn@gmail.com>*/
/*
Calling Sequence:
    dat_fft = fft (dat)
    dat_fft = fft (dat, n)
Parameters:
    dat_fft (Structure): ddata identification dataset in frequency-domain. In order to preserve signal power and noise level, the FFTs are normalized by dividing each transform by the square root of the signal length. 
                         The frequency values are distributed equally from 0 to the Nyquist frequency. The Nyquist frequency is only included for even signal lengths.
    n (Real scalar/vector): Length of the FFT transformations. If n does not match the signal length, the signals in dat are shortened or padded with zeros. 
                            n is a vector with as many elements as there are experiments in dat or a scalar with a common length for all experiments. 
                            If not specified, the signal lengths are taken as default values.
    dat (Structure): iddata set containing signals in time-domain.
Description:
    Transform iddata objects from time to frequency domain using a Fast Fourier Transform (FFT) algorithm.
*/
function dat = fft_iddata(dat, n)

    if argn(2) > 2 then
        error("Usage: dat = fft(dat)\n       dat = fft(dat, n)");
    end

    if argn(2) == 1 then
        n = [];
    end

    if dat.type <> "iddata" then
        error("fft: first argument must be an iddata structure");
    end

    if ~dat.timedomain then
        return;
    end

    [x, p, m, e] = size_iddata(dat); 

    if isempty(n) then
        nlist = list();
        for i = 1:e
            nlist(i) = x(i);
        end
    elseif isreal(n) & size(n, "*") == 1 & int(n) == n then
        nlist = list();
        for i = 1:e
            nlist(i) = n;
        end
    elseif isreal(n) & size(n, "*") == e & and(int(n) == n) then
        nlist = list();
        for i = 1:e
            nlist(i) = n(i);
        end
    else
        error("iddata: fft: second argument invalid");
    end
    
    // All three cellfun() combined in a single loop
    for i = 1:e
        ni = nlist(i);
        
        //dat.y = cellfun (@(y, n) fft (y, n, 1)(1:fix(n/2)+1, :) / sqrt (n), dat.y, n, "uniformoutput", false);
        if type(dat.y(i)) == 15 then
            y = dat.y(i)(1);
        else
            y = dat.y(i);
        end

        ny = size(y, 1);
        if ny < ni then
            y_pad = [y; zeros(ni - ny, size(y, 2))];
        else
            y_pad = y(1:ni, :);
        end

        fy = fft(y_pad, -1, 1);
        fy = fy(1:int(ni/2)+1, :) / sqrt(ni);
        dat.y(i) = list(fy); 
        
        //dat.u = cellfun (@(u, n) fft (u, n, 1)(1:fix(n/2)+1, :) / sqrt (n), dat.u, n, "uniformoutput", false);
        if type(dat.u(i)) == 15 then
            u = dat.u(i)(1);
        else
            u = dat.u(i);
        end
        
        nu = size(u, 1);
        if nu < ni then
            u_pad = [u; zeros(ni - nu, size(u, 2))];
        else
            u_pad = u(1:ni, :);
        end
        
        fu = fft(u_pad, -1, 1);
        fu = fu(1:int(ni/2)+1, :) / sqrt(ni);
        dat.u(i) = list(fu);
        
        //dat.w = cellfun (@(n, tsam) (0:fix(n/2)).' * (2*pi/abs(tsam)/n), n, dat.tsam, "uniformoutput", false);
        tsam = dat.tsam(i);
        dat.w(i) = (2 * %pi / abs(tsam) / ni) * (0:int(ni/2))';
    end

    dat.timedomain = %f;

endfunction
