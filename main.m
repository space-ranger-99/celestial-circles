clear;

% Keplerian elements
a = input('Enter the semi-major axis (km): ');
while ~isnumeric(a) || a < 6371 || a > 200000
    disp('Error: Input must be a number between 6371 and 200000.')
    a = input('Enter the semi-major axis (km): ');
end

e = input('Enter the eccentricity: ');
while ~isnumeric(e) || e < 0 || e >= 1
    disp('Error: Input must be a number between 0 and 1')
    e = input('Enter the eccentricity: ');
end

i = input('Enter the inclination (degrees): ');
while ~isnumeric(i) || i < 0 || i > 180
    disp('Error: Input must be a number between 0 and 180')
    i = input('Enter the inclination (degrees): ');
end

RAAN = input('Enter the right ascension of the ascending node (degrees): ');
while ~isnumeric(RAAN) || RAAN < 0 || RAAN > 360
    disp('Error: Input must be a number between 0 and 360')
    RAAN = input('Enter the right ascension of the ascending node (degrees): ');
end

w = input('Enter the argument of perigee (degrees): ');
while ~isnumeric(w) || w < 0 || w > 360
    disp('Error: Input must be a number between 0 and 360')
    w = input('Enter the argument of perigee (degrees): ');
end

M0 = input('Enter the mean anomaly at t0 (degrees): ');
while ~isnumeric(M0) || M0 < 0 || M0 > 360
    disp('Error: Input must be a number between 0 and 360')
    M0 = input('Enter the mean anomaly at t0 (degrees): ');
end

% Time vector for simulation
t0 = 0; % starting time (s)
tf = input('Enter the simulation run time (s): ');
dt = input('Enter the time step (s): ');
t = t0:dt:tf; % time vector

% Call initial state vector function
X0 = initial_state(a, e, i, RAAN, w, M0);

% Call ODE45 solver function
[T,X] = ode45_solver(@orbit,t,X0);

% Extract position data from solution
x = X(:,1);
y = X(:,2);
z = X(:,3);

% Plot the 3D orbit
plot3(x,y,z);
xlabel('X (km)');
ylabel('Y (km)');
zlabel('Z (km)');
