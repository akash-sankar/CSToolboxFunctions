function [gamma_r, phi_r, w_gamma_r, w_phi_r] = margin(sys, tol)
    if argn(1) < 1 | argn(1) > 2 then
        error("Incorrect number of input arguments");
    end

    if typeof(sys) <> "ltisys" then
        error("margin: argument sys must be an LTI system");
    end

    if ~issiso(sys) then
        error("margin: argument sys must be a SISO system");
    end

    if argn(1) < 2 then
        tol = sqrt(%eps);
    end

    [num, den, tsam] = tfdata(sys, "v");
    continuous = isct(sys);
    tsam = abs(tsam);

    if continuous then
        l_num = length(num);
        l_den = length(den);
        num_jw = num .* %i .^ (l_num - 1:-1:0);
        den_jw = den .* %i .^ (l_den - 1:-1:0);

        gm_poly = imag(conv(num_jw, conj(den_jw)));
        w = roots(gm_poly);
        [gamma, w_gamma] = gm_filter(w, num, den, tsam, tol, continuous);

        poly_1 = conv(num_jw, conj(num_jw));
        poly_2 = conv(den_jw, conj(den_jw));
        [poly_1, poly_2] = poly_equalizer(poly_1, poly_2);
        pm_poly = real(poly_1 - poly_2);
        w = roots(pm_poly);
        [phi, w_phi] = pm_filter(w, num, den, tsam, tol, continuous);
    else
        l_num = length(num);
        l_den = length(den);
        num_rev = flip(num);
        den_rev = flip(den);

        num_div = zeros(1, l_num);
        den_div = zeros(1, l_den);
        num_div(1) = 1;
        den_div(1) = 1;

        num_inv = conv(num_rev, den_div);
        den_inv = conv(den_rev, num_div);

        poly_1 = conv(num, den_inv);
        poly_2 = conv(num_inv, den);
        [poly_1, poly_2] = poly_equalizer(poly_1, poly_2);
        gm_poly = poly_1 - poly_2;

        z = roots(gm_poly);
        idx = find(abs(abs(z) - 1) < tol);

        if size(idx, "*") > 0 then
            z_gm = z(idx);
            w = log(z_gm) / (%i * tsam);
            [gamma, w_gamma] = gm_filter(w, num, den, tsam, tol, continuous);
        else
            gamma = Inf;
            w_gamma = NaN;
        end

        poly_1 = conv(num, num_inv);
        poly_2 = conv(den, den_inv);
        [poly_1, poly_2] = poly_equalizer(poly_1, poly_2);
        pm_poly = poly_1 - poly_2;

        z = roots(pm_poly);
        idx = find(abs(abs(z) - 1) < tol);

        if size(idx, "*") > 0 then
            z_gm = z(idx);
            w = log(z_gm) / (%i * tsam);
            [phi, w_phi] = pm_filter(w, num, den, tsam, tol, continuous);
        else
            phi = 180;
            w_phi = NaN;
        end
    end

    if argn(2) == 0 then
        [H, w] = __frequency_response__("margin", {sys}); // Needs replacement in Scilab
        H = H{1};
        w = w{1};

        H = matrix(H, size(H, "*"), 1);
        mag_db = 20 * log10(abs(H));
        pha = unwrap(angle(H)) * 180 / %pi;
        gamma_db = 20 * log10(gamma);

        wv = [min(w), max(w)];
        ax_vec_mag = __axis_limits__([w, mag_db]); // Needs replacement in Scilab
        ax_vec_mag(1:2) = wv;
        ax_vec_pha = __axis_limits__([w, pha]); // Needs replacement in Scilab
        ax_vec_pha(1:2) = wv;

        wgm = [w_gamma, w_gamma];
        mgmh = [-gamma_db, ax_vec_mag(3)];
        mgm = [0, -gamma_db];
        pgm = [ax_vec_pha(4), -180];

        wpm = [w_phi, w_phi];
        mpm = [0, ax_vec_mag(3)];
        ppmh = [ax_vec_pha(4), phi - 180];
        ppm = [phi - 180, -180];

        title_str = msprintf("GM = %g dB (at %g rad/s),   PM = %g deg (at %g rad/s)", gamma_db, w_gamma, phi, w_phi);
        if continuous then
            xl_str = "Frequency [rad/s]";
        else
            xl_str = msprintf("Frequency [rad/s]     w_N = %g", %pi / tsam);
        end

        subplot(2, 1, 1);
        semilogx(w, mag_db, "b", wv, [0, 0], "-.k", wgm, mgmh, "-.k", wgm, mgm, "r", wpm, mpm, "-.k");
        axis(ax_vec_mag);
        grid("on");
        title(title_str);
        ylabel("Magnitude [dB]");

        subplot(2, 1, 2);
        semilogx(w, pha, "b", wv, [-180, -180], "-.k", wgm, pgm, "-.k", wpm, ppmh, "-.k", wpm, ppm, "r");
        axis(ax_vec_pha);
        grid("on");
        xlabel(xl_str);
        ylabel("Phase [deg]");
    else
        gamma_r = gamma;
        phi_r = phi;
        w_gamma_r = w_gamma;
        w_phi_r = w_phi;
    end
end
