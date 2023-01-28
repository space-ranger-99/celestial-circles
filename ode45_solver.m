function [T,X] = ode45_solver(func, t, X0)
    % Solve    
    [T,X] = ode45(func,t,X0);
end
