% function to apply Conjugate Method (with exact line search)
% -------------------------------------------------------------------
% INPUTS
% x_0 is an initial guess at the minimum
% A is the squared coeffecient from the standard Q
% b is the linear coeffeicent from the standard Q
% steps is the maximum number of iterations
% tol is the tolerance for saying we have found a minimum
% -------------------------------------------------------------------
% OUTPUTS
% x is a matrix that holds every estimated minimiser
% g is a matrix that holds the gradient at each step
% p is a matrix that holds the conjugate vectors with respect to A
% beta is a vector that holds scalars for adjusting minimiser
% alpha is a vector that holds the step size taken at each step

function [x, g, p, beta, alpha] = ConjugateGradient(x_0, A, b, steps, tol)

% allocate memory to save all minimums
x = zeros(length(x_0), length(1:steps));
g = zeros(length(x_0), length(1:steps));
p = zeros(length(x_0), length(1:steps));
beta = zeros(1, length(1:steps)-1);
alpha = zeros(1, length(1:steps)-1);
% initialise first guess at minimum, including gradient
x(:, 1) = x_0;
g(:, 1) = A * x_0 + b;
p(:, 1) = -g(:, 1);
% start counter
iter = 0;

% estimate minimiser
for k=1:steps
    
    % perform exact line search
    alpha(k) = -(g(:, k).'*p(:,k))/(p(:, k).'*A*p(:, k));
    % update gradient for next step
    g(:, k+1) = A*(x(:, k) + alpha(k)* p(:, k)) + b;
    %update the minimum
    x(:, k+1) = x(:, k) + alpha(k)*p(:, k);
    % calculate beta
    beta(k) = (g(:, k+1).'*g(:, k+1))/(g(:, k).'*g(:, k));
    % update direction
    p(:, k+1) = -g(:, k+1) + beta(k) * p(:, k);
    % increase count
    iter = iter + 1;
    % check to see if the gradient at the minimiser is small enough
    if norm(g(:, k+1)) < tol
        break;
    end
end

% ensure we only keep vectors from steps we have actually taken!
x = x(:, 1:iter+1);
g = g(:, 1:iter+1);
p = p(:, 1:iter+1);
alpha = alpha(1:iter);
beta = beta(1:iter);
end