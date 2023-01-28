function dXdt = orbit(t,X)
    %% Unpack state vector
    x = X(1);
    y = X(2);
    z = X(3);
    vx = X(4);
    vy = X(5);
    vz = X(6);

    %% Define differential equations
    dXdt = [vx; vy; vz; -(398600.4418/((x^2 + y^2 + z^2)^(3/2)))*x; -(398600.4418/((x^2 + y^2 + z^2)^(3/2)))*y; -(398600.4418/((x^2 + y^2 + z^2)^(3/2)))*z];
end
