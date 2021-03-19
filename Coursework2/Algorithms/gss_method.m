function [x_min, iter, a, b] = gss_method(a, b, f, tol, max_iter)

    % store the golden ratio to find 2 points between each boundary
    % that are equidistant from each other
    g_ratio = (1+sqrt(5))/2;
    
    iter = 0;
    
    for n=1:max_iter
    
        % find two points where (c - b) = (b - d)
        c = b + (a - b)/g_ratio;
        d = a + (b - a)/g_ratio;
    
        % evaluate these points
        f_c = f(c);
        f_d = f(d);
        
        % check if our current bound meets requirements
        x_min = (a + b)/2;
        if abs(b - a) < tol
            break
        end
        
        % if f_c is smaller than f_d, eliminate the right interval
        
        if f_c < f_d
            
            b = d;
            d = c;
            f_d = f_c;
            c = b + (a-b)/g_ratio;
            f_c = f(c);
            
        % if f_d is smaller than f_c, elimate the left interval
        elseif f_c > f_d
            
             a = c;
             c = d;
             f_c = f_d;
             d = a + (b-a)/g_ratio;
             f_d = f(d);
             
        end
        
        iter = iter + 1;
                      
    end

end