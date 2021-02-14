%{
Function finds minimum by
using 3 points on f(x) to estimate a parabola P(x), finding its minimum y,
then ditching point 1, and using f(y) to create 3 new points to estimate
a new parabola. Repeat until tolerence is found
--------------------------------------------------------------------------
INPUTS:

x_0: (float) initial point one for parabola
x_1: (float) initial point two for parabola
x_2: (float) initial point three for parabola
f: (function) function we are evaluating
tol: (float) tolerance 
max_iter (positive int) maximum number of iterations

OUTPUTS:

x_k: (float) new minimum
iter: (int) number of iterations to solve
%}

function [x_k, iter] = three_point_lag(x_0, x_1, x_2, f, tol, max_iter)
    syms P(x)
    
    % data for some plots
    data = [x_0:0.01:x_2];
    
    % preallocate matrices
    iter = 0;
    x_pol = zeros(max_iter, 1);
    f_x_pol = zeros(max_iter, 1);
    
    % define intial points and analyse the function at these points
    x_pol(1:3) = [x_0, x_1, x_2];
    f_x_pol(1:3) = f(x_pol(1:3));
    
    for n = 1:max_iter
        
        % set values to define parabola
        fx_0 = f_x_pol(0 + n);
        fx_1 = f_x_pol(1 + n);
        fx_2 = f_x_pol(2 + n);
    
        x_0 = x_pol(0 + n);
        x_1 = x_pol(1 + n);
        x_2 = x_pol(2 + n);
        
        % define parabola
        P(x) = fx_0.*((x - x_1)./(x_0 - x_1)).* ((x - x_2)./(x_0 - x_2)) + ...
        fx_1.* ((x - x_0)./(x_1 - x_0)).* ((x - x_2)./(x_1 - x_2)) + ...
        fx_2.* ((x - x_0)./(x_2 - x_0)).* ((x - x_1)./(x_2 - x_1));
    
        % find roots of P
        roots = solve(P(x) == 0, x);
        
        % since P is symmetric, use half way point between roots as minimum
        x_k = double(sum(roots)/2);
        
        % save this data and analyse the point in the function f
        x_pol(3 + n) = double(x_k);
        f_x_pol(3 + n) = f(x_pol(3 + n));
        
        %increase iteration count
        iter = iter + 1;
        
        hold on
        plot(data, P(data));
        
        % check if we have met requirements
        if abs(x_pol(2 + n) - x_pol(3 + n)) < tol
            break
        end
    end

end

