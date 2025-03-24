function [gain, varargout] = norm_sc(sys, ntype, tol)
    
    if argn(2) < 2 then
        ntype = "2"; // Default norm type
    end
    
    if argn(2) < 3 then
        tol = 0.01; // Default tolerance
    end

    // Handling norm type
    if typeof(ntype) == "constant" & isinf(ntype) then
        ntype = "inf";
    elseif typeof(ntype) == "string" then
        ntype = convstr(ntype, "l"); // Convert to lowercase
    elseif ntype == 2 then
        ntype = "2";
    else
        error("lti: norm: invalid norm type");
    end

    // Compute the required norm
    select ntype
        case "2" then
            gain = h2norm_sc(sys);
        case "inf" then
            [gain, wpeak] = linfnorm_sc(sys, tol);
            varargout(1) = wpeak;
        else
            error("lti: norm: invalid norm type");
    end
endfunction


function gain = h2norm_sc(sys)
    if is_stable(sys) then
        [A, B, C, D] = syslin('c', sys); // Get state-space data
        discrete = ~is_ct(sys); // Check if system is discrete
        
        if ~discrete & norm(D, 1) > 0 then
            gain = %inf; // Infinite gain for continuous system with direct transmission
        else
            gain = ab13bd(A, B, C, D, discrete); // Equivalent function
        end
    else
        gain = %inf;
    end
endfunction


function [gain, wpeak] = linfnorm_sc(sys, tol)
    [A, B, C, D] = syslin('c', sys);
    discrete = ~is_ct(sys);
    
    if rcond(A) < %eps then
        gain = %inf;
        wpeak = %inf;
        return;
    end
    
    // Compute H∞ norm using a Scilab equivalent function
    [fpeak, gpeak] = ab13dd(A, B, C, D, discrete, tol);
    
    // Peak frequency
    if fpeak(2) > 0 then
        wpeak = fpeak(1);
    else
        wpeak = %inf;
    end
    
    // Gain value
    if gpeak(2) > 0 then
        gain = gpeak(1);
    else
        gain = %inf;
    end
endfunction
