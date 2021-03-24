% function to apply Newton Method (with natural alpha)
% -------------------------------------------------------------------
% INPUTS
% x_0 is an initial guess at the minimum
% grad is the gradient function of the quadratic Q
% Hess is the Hessian of Q, the grad of grad
% steps is the maximum number of iterations
% tol is the tolerance for saying we have found a minimum
% -------------------------------------------------------------------
% OUTPUTS
% x is a matrix that holds every estimated minimiser
% g is a matrix that holds the gradient at each step
% H is a matrix that holds the value of the Hessian at each step
% p is a matrix that holds the direction at each step
% alpha is a vector that holds the step size taken at each step

function [x, g, H, p, alpha] = NewtonMethodNSS(x_0, grad, Hess, steps, tol)

% allocate memory to save all minimums
x = zeros(length(x_0), length(1:steps));
g = zeros(length(x_0), length(1:steps));
p = zeros(length(x_0), length(1:steps));
H = zeros(length(x_0), length(x_0), length(1:steps));
alpha = zeros(1, length(1:steps));
% initialise first guess at minimum
x(:, 1) = x_0;
% start counter
iter = 0;

% estimate minimiser
for k = 1:steps
    
    % get the search direction
    g(:, k) = grad(x(:, k));
    H(:, :, k) = Hess(x(:, k));
    % calculate the newton step
    p(:, k) = -inv(H(:, :, k)) * g(:, k);
    % natural step size
    alpha(k) = 1;
    % update the minimiser
    x(:, k+1) = x(:, k) + alpha(k) * p(:, k);
    
    % increase count
    iter = iter + 1;
    % check to see if the gradient at the minimiser is small enough
    if norm(grad(x(:, k+1))) < tol
        break;
    end
end

% ensure we only keep vectors from steps we have actually taken!
x = x(:, 1:iter+1);
g = g(:, 1:iter);
H = H(:, :, 1:iter);
p = p(:, 1:iter);
alpha = alpha(1:iter);
end
