% function to apply steepest descent (with exact alpha)
% INPUTS
% x_0 is an initial guess at the minimum
% A is the matrix of values from the standard quadratic form of Q
% g is the derivate of Q, the function we are evaluating
% steps is the maximum number of iterations
% tol is the tolerance for saying we have found a minimum

function [x, p, alpha] = SteepestDescent(x_0, A, g, steps, tol)
    
% allocate memory to save all minimums
x = zeros(length(x_0), length(1:steps));
p = zeros(length(x_0), length(1:steps)-1);
alpha = zeros(1, length(1:steps)-1);
% initialise first guess at minimum
x(:, 1) = x_0;
for k = 1:steps
    
    % get the search direction
    p(:, k) = -g(x(:, k));
    % calculate how far to descend
    alpha(k) = (-p(:, k).'*g(x(:, k)))/(p(:, k).'*A*p(:, k));
    % update the minimiser
    x(:, k+1) = x(:, k) + alpha(k) * p(:, k);
    
    % check to see if the gradient at the minimiser is small enough
    if abs(g(x(:, k+1))) < tol
        break;
    end
end
end

