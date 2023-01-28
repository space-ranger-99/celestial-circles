# Celestial Circles :artificial_satellite:

### Description
This [MATLAB](https://www.mathworks.com/products/matlab.html) application models three-dimensional orbit trajectories around the Earth. The main script, main.m, requests the [Keplerian elements](https://en.wikipedia.org/wiki/Orbital_elements) of the satellite from the user: the semi-major axis, eccentricity, inclination, right ascension of the ascending node, argument of perigee, and mean anomaly at t0. These elements are utilized by the function initial state.m to compute the initial state vector of the orbit. The ode45 solver.m function is then invoked to solve the orbit differential equations defined in the function orbit.m. The position information is then taken from the solution and plotted in three dimensions. User inputs also determine the simulation's runtime and time step. The gravitational parameter utilized in the script is that of Earth.

MATLAB is a suitable technology for this application because of its extensive array of built-in tools for mathematical computation and visualization, which make it simple to execute complex calculations and display results in a clear and intuitive manner. In addition, the [ODE45 function](https://www.mathworks.com/help/matlab/ref/ode45.html) of MATLAB, which is utilized in this application, is a potent tool for solving systems of ordinary differential equations, making it ideal for simulating the movement of objects in space. In addition, MATLAB's support for object-oriented programming facilitates code reuse and structure.