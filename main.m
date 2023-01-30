clear; clc;

% Define gravitational parameter (km^3/s^2)
mu = 398600;

% Define orbital elements (classical)
a = input('Enter semi-major axis (km): ');
e = input('Enter eccentricity: ');
inc = deg2rad(input('Enter inclination (degrees): '));
RA = deg2rad(input('Enter right ascension of the ascending node (degrees): '));
w = deg2rad(input('Enter argument of perigee (degrees): '));
nu = deg2rad(input('Enter true anomaly (degrees): '));

% Convert to Cartesian state vector
r = a*(1-e^2)/(1+e*cos(nu));
x = r*(cos(RA)*cos(nu+w) - sin(RA)*sin(nu+w)*cos(inc));
y = r*(sin(RA)*cos(nu+w) + cos(RA)*sin(nu+w)*cos(inc));
z = r*sin(nu+w)*sin(inc);
vx = -sqrt(mu/a/(1-e^2))*sin(nu);
vy = sqrt(mu/a/(1-e^2))*(e+cos(nu));
vz = 0;

% Define initial state vector
X0 = [x, y, z, vx, vy, vz];

% Define time interval
t0 = 0;
tf = input('Enter final time (in seconds): ');
dt = input('Enter time step (in seconds): ');
t = linspace(t0, tf, dt);

% Define satellite motion function
dXdt = @(t,X) [X(4); X(5); X(6); -mu*X(1)/norm(X(1:3))^3; -mu*X(2)/norm(X(1:3))^3; -mu*X(3)/norm(X(1:3))^3];

% Integrate using ode45
[T, X] = ode45(dXdt, t, X0);

% Plot results in 3D
figure
plot3(X(:,1), X(:,2), X(:,3))
xlabel('x (km)'); ylabel('y (km)'); zlabel('z (km)');
title('Satellite Orbit in ECI Frame');
