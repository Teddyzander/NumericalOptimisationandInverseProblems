%{
Function finds minimum closest to the initial point given
--------------------------------------------------------------------------
INPUTS:

x_k: (float) initial guess for minimum
f: (function) function that we are analysing
tol: (float) acceptable size of final interval
max_iter (positive int) maximum number of iterations

OUTPUTS:

x_k: (float) new minimum
%}

function [x_k] = newton_method(x_k, f_1, f_2, tol, max_iter)

    % evaluate values for function being analysed
    f1_x = f_1(x_k);
    f2_x = f_2(x_k);

    for n=1:max_iter
        
        % find better minimum
        x_k = x_k - (f1_x/f2_x);
        
        f1_x = f_1(x_k);
        %check tolerence
        if abs(f1_x) < tol
            
            break;
        end
        
        f2_x = f_2(x_k);          
    end
end
