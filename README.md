# Celestial Circles :artificial_satellite:

### Description
This project is a simulation of an orbit using [MATLAB](https://www.mathworks.com/products/matlab.html). The main script, main.m, prompts the user to input the semi-major axis, eccentricity, inclination, right ascension of the ascending node, argument of perigee, and mean anomaly at t0. These elements are used to calculate the initial state vector of the orbit using the function initial_state.m. The ODE45 solver function, ode45_solver.m, is then called to solve the orbit differential equations defined in the function orbit.m. Finally, the position data is extracted from the solution and plotted in 3D. The simulation's run time, time step, and starting time are also defined by user inputs. The script uses the standard Matlab ODE45 solver, and the gravitational parameter used is that of Earth. The script can be used to simulate the motion of a spacecraft in Earth orbit, given the orbital elements as inputs.

