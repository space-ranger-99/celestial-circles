function X0 = initial_state(a, e, i, RAAN, w, M0)
    %% Convert angle elements to radians
    i = i*pi/180;
    RAAN = RAAN*pi/180;
    w = w*pi/180;
    M0 = M0*pi/180;

    %% Calculate initial radial distance
    r0 = (a*(1-e^2))/(1+e*cos(M0)); % initial radial distance (km)

    %% Calculate initial position
    x0 = r0*(cos(RAAN)*cos(w+M0) - sin(RAAN)*sin(w+M0)*cos(i)); % initial x position (km)
    y0 = r0*(sin(RAAN)*cos(w+M0) + cos(RAAN)*sin(w+M0)*cos(i)); % initial y position (km)
    z0 = r0*sin(w+M0)*sin(i); % initial z position (km)

    %% Calculate initial velocity
    vx0 = -sqrt(398600.4418/(a*(1-e^2)))*(e+cos(w+M0)); % initial x velocity (km/s)
    vy0 = sqrt(398600.4418/(a*(1-e^2)))*(sin(w+M0))*(cos(i)); % initial y velocity (km/s)
    vz0 = sqrt(398600.4418/(a*(1-e^2)))*(sin(w+M0))*(sin(i)); % initial z velocity (km/s)

    %% Compose initial state vector
    X0 = [x0; y0; z0; vx0; vy0; vz0];
end
