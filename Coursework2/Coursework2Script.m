%%
% main script for coursework 2
% Focuses on minimising general quadratic functions in the form of
%       Q(x) = 0.5*x^T*A*X+b^T + c
% numerically

%% Define function variables. Plot the function over some interval

% define variables for the specific function f
A = [2, 1;
    1, 6];
b = [1; 1];
c = 0;

% set up quadratic function
Q = @(x) (1/2)*x.'*A*x + b.'*x + c;

% set up gradient of quadratic
g = @(x) A*x + b;

% set up bounds for the plot
lower = -1;
upper = 1;
step = 0.01;

% plot the function, and get the surface
[f_mesh, Q_plot] = f(Q, lower, upper, step, true, 'c', 0.25);

%% Q1 find an estimated minimiser of Q using steepest descent for 2 steps

x_0 = [0;0]; % initial guess
steps = 20; % number of steps
tol = 0.000001; % some tolerance for acceptable gradient at x_min
[SD_x_min, SD_p, SD_alpha] = SteepestDescent(x_0, A, g, steps, tol); % apply steepest descent

% make a plot to show how the descent behaved
figure(1)
hold on
plot(SD_x_min(1, :), SD_x_min(2, :), '-r', 'linewidth', 2);
legend('$f(x_1, x_2)$', 'Descent from $[0, 0]^T$', 'interpreter','latex', ...
    'FontSize',12,'FontWeight', 'bold');



