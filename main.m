% Keplerian elements
a = input('Enter the semi-major axis (km): ');
e = input('Enter the eccentricity: ');
i = input('Enter the inclination (degrees): ');
RAAN = input('Enter the right ascension of the ascending node (degrees): ');
w = input('Enter the argument of perigee (degrees): ');
M0 = input('Enter the mean anomaly at t0 (degrees): ');

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
