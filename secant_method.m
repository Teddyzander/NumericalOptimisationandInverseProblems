%{
Function finds minimum closest to the initial point given, estimating f''
--------------------------------------------------------------------------
INPUTS:

x_k: (float) initial guess for minimum
f: (function) function that we are analysing
tol: (float) acceptable size of final interval
max_iter (positive int) maximum number of iterations

OUTPUTS:

x_k: (float) new minimum
%}

function [x_k] = secant_method(x_k, x_k1, f, tol, max_iter)

    % evaluate values for function being analysed
    f_x = f(x_k);
    f_x1 = f(x_k1);

    for n=1:max_iter
        
        x_temp = x_k;
        % find better minimum
        x_k = x_k - (f_x * (x_k - x_k1)/(f_x - f_x1));
        
        f_x = f(x_k);
        %check tolerence
        if abs(f_x) < tol
            
            break;
        end
        
        x_k1 = x_temp;
        f_x1 = f(x_k1);          
    end
end