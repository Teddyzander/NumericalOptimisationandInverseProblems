% function to apply steepest descent (with exact alpha)
% -------------------------------------------------------------------
% INPUTS
% x_0 is an initial guess at the minimum
% A is the matrix of values from the standard quadratic form of Q
% g is the derivate of Q, the function we are evaluating
% steps is the maximum number of iterations
% tol is the tolerance for saying we have found a minimum
% -------------------------------------------------------------------
% OUTPUTS
% x is a matrix that holds every estimated minimiser
% p is a matrix hat holds the direction taken at each step
% alpha is a vector that holds the step size taken at each step

function [x, p, alpha] = SteepestDescent(x_0, A, g, steps, tol)
    
% allocate memory to save all minimums
x = zeros(length(x_0), length(1:steps));
p = zeros(length(x_0), length(1:steps)-1);
alpha = zeros(1, length(1:steps)-1);
% initialise first guess at minimum
x(:, 1) = x_0;
% start counter
iter = 0;

% estimate minimiser
for k = 1:steps
    
    % get the search direction
    p(:, k) = -g(x(:, k));
    % calculate how far to descend
    alpha(k) = (-p(:, k).'*g(x(:, k)))/(p(:, k).'*A*p(:, k));
    % update the minimiser
    x(:, k+1) = x(:, k) + alpha(k) * p(:, k);
    
    %increase iterator (so we can cut off excess if we find the min early)
    iter = iter + 1;
    % check to see if the gradient at the minimiser is small enough
    if norm(g(x(:, k+1))) < tol
        break;
    end
end

% ensure we only keep vectors from steps we have actually taken!
x = x(:, 1:iter+1);
p = p(:, 1:iter);
alpha = alpha(1:iter);
end

