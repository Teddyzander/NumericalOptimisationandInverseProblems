%{
Function finds the interval for a local minimum between two points
--------------------------------------------------------------------------
INPUTS:

a: (float) lower bound for initial interval
b: (float) upper bound for initial interval
f: (function) function that we are analysing
tol: (float) acceptable size of final interval
max_iter (positive int) maximum number of iterations

OUTPUTS:

x_a: (float) lower bound for final interval
x_b: (float) upper bound for final interval
%}

function [x_a, x_b] = oneD_bisection(a, b, f, tol, max_iter)

    %set bounds and point
    x_a = a;
    x_b = b;
    x_m = 0.5 * (a + b);
    
    %evaluate these points
    f_a = f(x_a);
    f_b = f(x_b);
    f_m = f(x_m);

    for n = 1:max_iter
        
        %find the mid points between the mid point and each bound
        x_l = 0.5 * (x_a + x_m);
        x_r = 0.5 * (x_m + x_b);
        
        %evaluate these points
        f_l = f(x_l);
        f_r = f(x_r);
        
        %find the minimum of all of these points
        f_min = min([f_a, f_b, f_m, f_l, f_r]);
        
        %reassign values depending on the minimum, shrinking the interval
        
        if f_min == f_a || f_min == f_l
            
           x_b = x_m;
           x_m = x_l;
           f_b = f_m;
           f_m = f_l;
        
        elseif f_min == f_m
        
            x_a = x_l;
            x_b = x_r;
            f_a = f_l;
            f_b = f_r;
            
        elseif f_min == f_r || f_min == f_b
            
            x_a = x_m;
            x_m = x_r;
            f_a = f_m;
            f_m = f_r;
        end
        
        %check if we meet tolerance requirements
        if abs(x_b - x_a) <= tol
            break
        end
    end
end

