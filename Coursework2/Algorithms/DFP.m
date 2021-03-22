% function to apply DFP Quasi-Newton Method (with exact line search)
% -------------------------------------------------------------------
% INPUTS
% x_0 is an initial guess at the minimum
% H_0 is an initial guess at the Hessian for Q
% grad is the gradient function of the quadratic Q
% A is the matrix coeffecient from Q
% steps is the maximum number of iterations
% tol is the tolerance for saying we have found a minimum
% -------------------------------------------------------------------
% OUTPUTS
% x is a matrix that holds every estimated minimiser
% g is a matrix that holds the gradient at each step
% p is a matrix that holds the conjugate vectors with respect to A
% beta is a vector that holds scalars for adjusting minimiser
% alpha is a vector that holds the step size taken at each step

function [x, g, H, p] = DFP(x_0, H_0, A, grad, ...
    steps, tol)

% allocate memory to hold values at each step
x = zeros(length(x_0), length(1:steps)+1);
H = zeros(length(x_0), length(x_0), length(1:steps)+1);
g = zeros(length(x_0), length(1:steps)+1);
p = zeros(length(x_0), length(1:steps)+1);
tau = zeros(1, length(1:steps)+1);

% initialise guesses
x(:, 1) = x_0;
H(:, :, 1) = H_0;
g(:, 1) = grad(x_0);

% initialise counter
iter = 0;
% get identity matrix
I = eye(length(x_0));

% Apply
for k=1:steps
    
    % compute Quasi-Newton step
    p(:, k+1) = -inv(H(:, :, k))* g(:, k);
    % get minimum of Q(x + tau * p)
    tau(k+1) = (-p(:, k+1).'*g(:, k))/(p(:, k+1).'*A*p(:, k+1));
    % estimate new minimum
    x(:, k+1) = x(:, k) + tau(k+1)*p(:, k+1);
    % find gradient at new minimum
    g(:, k+1) = grad(x(:, k+1));
    %find new estimate for the hessian
    s = x(:, k+1) - x(:, k);
    y = g(:, k+1) - g(:, k);
    H(:, :, k+1) = (I - (y * s.')/(y.'*s)) * ...
        H(:, :, k) * (I - (s*y.')/(y.'*s)) + (y*y.')/(y.'*s);
    iter = iter + 1;
    
    if norm(grad(x(:, k+1))) < tol
        break;
    end
end

% ensure we only keep vectors from steps we have actually taken!
x = x(:, 1:iter+1);
g = g(:, 1:iter+1);
H = H(:, :, 1:iter+1);
p = p(:, 1:iter+1);
end
