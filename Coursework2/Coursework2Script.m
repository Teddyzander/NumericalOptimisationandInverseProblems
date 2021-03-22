%%
% main script for coursework 2
% Focuses on minimising general quadratic functions in the form of
%       Q(x) = 0.5*x^T*A*X+b^T + c
% numerically

%% Define function variables. Plot the function over some interval

% define variables for the specific function Q
A = [2, 1;
    1, 6];
b = [1; 1];
c = 0;

% set up quadratic function
Q = @(x) (1/2)*x.'*A*x + b.'*x + c;

% set up gradient of quadratic g
g = @(x) A*x + b;

H = @(x) A;

% set up bounds for the plot
lower = -1;
upper = 1;
step = 0.01;

% plot the function, and get the surface/contour
[f_mesh, Q_plot] = f(Q, lower, upper, step, true, 'c', 0.1);

x_0 = [0;0]; % initial guess

%% Q1 find an estimated minimiser of Q using steepest descent for 2 steps

steps = 2; % number of steps
tol = 0.0001; % some tolerance for acceptable gradient at x_min

% apply steepest descent
[SD_x_min, SD_p, SD_alpha] = SteepestDescent(x_0, A, g, steps, tol); 

% display values for each step
disp('Initial guess for x_0: [' + string(x_0(1)) + ' ' + ...
    string(x_0(2)) + ']')
for k=1:length(SD_alpha)
    disp('Values for step ' + string(k-1))
    disp('p: [' + string(SD_p(1, k)) + ' ' + string(SD_p(2, k)) + ']')
    disp('alpha: ' + string(SD_alpha(k)))
    disp('new min estimate: [' + string(SD_x_min(1, k+1)) + ' ' + ... 
        string(SD_x_min(2, k+1)) + ']')    
end
% make a plot to show how the descent behaved
figure(1)
hold on
plot(SD_x_min(1, :), SD_x_min(2, :), '-r', 'linewidth', 2);
legend('$f(x_1, x_2)$', 'Descent from $[0, 0]^T$', 'interpreter','latex', ...
    'FontSize',12,'FontWeight', 'bold');
grid on

%% Q2 find an estimated minimiser of Q using Newton Method for 1 step

steps = 1; % number of steps
tol = 0.0001; % some tolerance for acceptable gradient at x_min

% Apple the Newton Method
[NM_x_min, NM_g, NM_H, NM_p, NM_alpha] = NewtonMethodNSS(x_0, g, H, ... 
    steps, tol); 

% display values for each step
disp('Initial guess for x_0: [' + string(x_0(1)) + ' ' + ...
    string(x_0(2)) + ']')
for k=1:length(NM_alpha)
    disp('Values for step ' + string(k-1))
    disp('g: [' + string(NM_g(1, k)) + ' ' + string(NM_g(2, k)) + ']')
    disp('H:')
    NM_H
    disp('p: [' + string(NM_p(1, k)) + ' ' + string(NM_p(2, k)) + ']')
    disp('new min estimate: [' + string(NM_x_min(1, k+1)) + ' ' + ... 
        string(NM_x_min(2, k+1)) + ']')    
end
% make a plot to show how the descent behaved
figure(1)
hold on
plot(NM_x_min(1, :), NM_x_min(2, :), '-g', 'linewidth', 2);
legend('$f(x_1, x_2)$', 'Descent from $[0, 0]^T$', 'interpreter','latex', ...
    'FontSize',12,'FontWeight', 'bold');
grid on

%% Q3 find an estimated minimiser of Q using Conjugate Gradient Method 
% for 2 steps

steps = 2; % number of steps
tol = 0.0001; % some tolerance for acceptable gradient at x_min

% Apple the Conjugate Gradient Method
[CG_x_min, CG_g, CG_p, CG_beta, CG_alpha] = ConjugateGradient(x_0, A, ...
    b, steps, tol); 

% display values for each step
disp('Initial guess for x_0: [' + string(x_0(1)) + ' ' + ...
    string(x_0(2)) + ']')
for k=1:length(CG_alpha)
    disp('Values for step ' + string(k-1))
    disp('g: [' + string(CG_g(1, k)) + ' ' + string(CG_g(2, k)) + ']')
    disp('p: [' + string(CG_p(1, k)) + ' ' + string(CG_p(2, k)) + ']')
    disp('alpha: ' + string(CG_alpha(k)))
    disp('beta: ' + string(CG_beta(k)))
    disp('new min estimate: [' + string(CG_x_min(1, k+1)) + ' ' + ... 
        string(CG_x_min(2, k+1)) + ']')    
end
% make a plot to show how the descent behaved
figure(1)
hold on
plot(CG_x_min(1, :), CG_x_min(2, :), '--c', 'linewidth', 2);
legend('$f(x_1, x_2)$', 'Descent from $[0, 0]^T$', 'interpreter','latex', ...
    'FontSize',12,'FontWeight', 'bold');
grid on

%% Q3 find an estimated minimiser of Q using Conjugate Gradient Method 
% for 2 steps

steps = 2; % number of steps
tol = 0.0001; % some tolerance for acceptable gradient at x_min
H_0 = [2, 0; 0, 6]; % initial guess of hessian

% Apple the DFP Quasi-Newton method
[DFP_x_min, DFP_g, DFP_H, DFP_p] = DFP(x_0, H_0, A, ...
    g, steps, tol); 

% display values for each step
disp('Initial guess for x_0: [' + string(x_0(1)) + ' ' + ...
    string(x_0(2)) + ']')
for k=1:length(CG_alpha)
    disp('Values for step ' + string(k))
    disp('g(k): [' + string(DFP_g(1, k)) + ' ' + string(DFP_g(2, k)) + ']')
    disp('p(k+1): [' + string(DFP_p(1, k+1)) + ' ' + string(DFP_p(2, k+1)) + ']')
    disp('H(k+1):')
    DFP_H(:, :, k+1)
    disp('new min estimate: [' + string(DFP_x_min(1, k+1)) + ' ' + ... 
        string(DFP_x_min(2, k+1)) + ']')    
end
% make a plot to show how the descent behaved
figure(1)
hold on
plot(DFP_x_min(1, :), DFP_x_min(2, :), '-y', 'linewidth', 2);
legend('$f(x_1, x_2)$', 'Steepest Descent', 'Newton Method', ...
    'Conjugate Method', 'DFP Method', 'interpreter','latex', ...
    'FontSize',12,'FontWeight', 'bold');
grid on



