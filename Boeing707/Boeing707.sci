/*2024 Author: Akash S <akash.ktsn@gmail.com>*/
/*
Calling Sequence:
        outsys = Boeing707()
Description:
        Creates a linearized state-space model of a Boeing 707-321 aircraft at v=80 m/s (M = 0.26, Ga0 = -3 deg, alpha0 = 4 deg, kappa = 50 deg).

        System inputs: Thrust, Elevator angle
        System outputs: Airspeed, Pitch angle
Reference: 
        R. Brockhaus: Flugregelung (Flight Control), Springer, 1994.
*/
function outsys = Boeing707()

    A = [-0.46E-01,            0.10681415316, 0.0,   -0.17121680433;
         -0.1675901504661613, -0.515,         1.0,    0.6420630320636088E-02;
          0.1543104215347786, -0.547945,     -0.906, -0.1521689385990753E-02;
          0.0,                 0.0,           1.0,    0.0];

    B = [0.1602300107479095,      0.2111848453E-02;
         0.8196877780963616E-02, -0.3025E-01;
         0.9173594317692437E-01, -0.75283075;
         0.0,                     0.0];

    C = [1.0, 0.0, 0.0, 0.0;
         0.0, 0.0, 0.0, 1.0];

    D = zeros(2, 2);

    outsys = syslin("c", A, B, C, D);

endfunction
