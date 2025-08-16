/*2025 Author: Akash S <akash.ktsn@gmail.com>*/
/*
Calling Sequence:
    augsys = augstate (sys)
Parameters:
    augsys (State-space/Transfer function): Output system.
    augsysn (Structure): Output system information.
    sys (State-space/Transfer function): Input system.
    inn, stn, outn, ing, outg (Vector): Input variable names, State variable names, Output variable names, Input grouping information and Output grouping information.
Description:
    Append state vector x of system sys to output vector y.
         .                  .
         x = A x + B u      x = A x + B u
         y = C x + D u  =>  y = C x + D u
                            x = I x + O u
*/
function [augsys, augsysn] = augstate(sys, inn, stn, outn, ing, outg)
    
    if argn(2) < 1 | argn(2) > 6 then
        error("Usage: [augsys, augsysn] = augstate(sys, inn, stn, outn, ing, outg);")
    end
    
    if typeof(sys) <> "state-space" & typeof(sys) == 'rational' then
        warning("augstate: system not in state-space form. Converting to syslin.");
        sys = tf2ss(sys);
    end
    
    [A, B, C, D] = abcd(sys);
    
    n = size(A, 'r');
    [p, m] = size(D);

    C_aug = [C; eye(n, n)];
    D_aug = [D; zeros(n, m)];

    augsys = syslin(sys("dt"), A, B, C_aug, D_aug);
    
    nx = size(A, 1);
    nu = size(B, 2);
    ny = size(C_aug, 1); 

    select argn(2)
    case 1
        inn  = {};
        for i = 1:nu
            inn{1, i} = 'u'+string(i)
        end
        stn  = {};
        for i = 1:nx
            stn{1, i} = 'x'+string(i)
        end
        outn = {};
        for i = 1:ny
            outn{1, i} = 'y'+string(i)
        end
        ing  = struct();
        outg = struct();
    case 2
        stn  = {};
        for i = 1:nx
            stn{1, i} = 'x'+string(i)
        end
        outn = {};
        for i = 1:ny
            outn{1, i} = 'y'+string(i)
        end
        ing  = struct();
        outg = struct();
    case 3
        outn = {};
        for i = 1:ny
            outn{1, i} = 'y'+string(i)
        end
        ing  = struct();
        outg = struct();
    case 4
        for i = size(outn,2)+1:ny
            outn{1, i} = stn{1, i - size(outn, 2)};
        end
        ing  = struct();
        outg = struct();
    case 5
        for i = size(outn,2)+1:ny
            outn{1, i} = stn{1, i - size(outn, 2)};
        end
        outg = struct();
    case 6
        for i = size(outn,2)+1:ny
            outn{1, i} = stn{1, i - size(outn, 2)};
        end
    end
    
    augsysn.inname = inn;
    augsysn.stname = stn;
    augsysn.outname = outn;
    augsysn.ingroup = ing;
    augsysn.outgroup = outg;
endfunction
