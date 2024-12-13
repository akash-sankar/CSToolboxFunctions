/*2024 Author: Akash S <akash.ktsn@gmail.com>*/
/*
Calling Sequence
      [u, t] = gensig (sigtype, tau)
      [u, t] = gensig (sigtype, tau, tfinal)
      [u, t] = gensig (sigtype, tau, tfinal, tsam)
Parameters
      sigtype: Type of signal to plot
          Sine wave: `sigtype = "sin"`
          Cosine wave: `sigtype = "cos"`
          Square wave: `sigtype = "square"`
          Periodic pulse: `sigtype = "pulse"`
      tau: Duration of one period in seconds.
      tfinal (Optional): Duration of the signal in seconds. Default duration is 5 periods.
      tsam (Optional): sampling time in seconds. Default spacing is tau/64.
Description:        
        Generates periodic signal.
*/
function [u,t]=gensig(sigtype,tau,tfinal,tsam)

  if argn(2)<2 | argn(2)>4 then
    error("Usage: gensig(sigtype, tau, [tfinal], [tsam])");
  end

  if typeof(sigtype)<>"string" then
    error("gensig: first argument must be a string");
  end

  if tau<=0 then
    error("gensig: second argument must be a positive number");
  end

  if argn(2)<3 then
    tfinal = 5 * tau;
  elseif tfinal <= 0 then
    error("gensig: third argument must be a positive number");
  end

  if argn(2)<4 then
    tsam=tau/64;
  elseif tsam<=0 then
    error("gensig: fourth argument must be a positive number");
  end

  t=(0:tsam:tfinal)';

  if size(t,'r')==0 then
    error("gensig: invalid time vector, check parameters");
  end

  sigtype_lower=convstr(sigtype,"l");

  select sigtype_lower
    case "sin" then
      u=sin(2 * %pi / tau * t);
    case "cos" then
      u=cos(2 * %pi / tau * t);
    case "square" then
      u=double(modulo(t, tau)>=tau/2);
    case "pulse" then
      u=double(modulo(t, tau)< (1 - 1000 * %eps) * tsam);
    else
      error("gensig: " + sigtype + " is an invalid signal type");
  end

endfunction
