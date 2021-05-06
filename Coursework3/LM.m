tk = [0.5, 1, 2, 4, 5, 6, 8];
yk = [50, 3.2939, 4.2699, 7.1749, 9.3008, 30, 20.259];
a=[exp(b(1)); b(2)];
GNnab2Fex(a(1), a(2), tk, yk) + GNnab2F(a(1), a(2), tk)
nabF(a(1), a(2), tk, yk)
for n=1:500
    p = (GNnab2Fex(a(1), a(2), tk, yk) + GNnab2F(a(1), a(2), tk))...
        \(-nabF(a(1), a(2), tk, yk));
    a = a + 1*p;
end
disp('estimated minimiser for nonlinear systen')
a
disp('gradient for newton step')
nabF(a(1), a(2), tk, yk)
disp('gradient at linear solution')
nabF(exp(b(1)), b(2), tk, yk)
exp(b(1))
b(2)
% find grad for a1 and a2
function [F] = nabF(a1, a2, tk, yk)
    F = zeros(2,1);
    for n=1:length(tk)
        F(1) = F(1) + exp(a2*tk(n))*(a1*exp(a2*tk(n)) - yk(n));
        F(2) = F(2) + tk(n)*a1*exp(a2*tk(n))*(a1*exp(a2*tk(n))-yk(n));
    end
end

% find Gauss newton approx of hessian
function [F] = GNnab2F(a1, a2, tk)
    F = zeros(2,2);
    for n=1:length(tk)
        F(1, 1) = F(1, 1) + (exp(a2*tk(n)))^2;
        F(1, 2) = F(1, 2) + (exp(a2*tk(n)))^2*tk(n)*a1;
        F(2, 1) = F(2, 1) + (exp(a2*tk(n)))^2*tk(n)*a1;
        F(2, 2) = F(2, 2) + (exp(a2*tk(n)))^2*tk(n)^2*a1^2;
    end
end

% extension to full hessian
function [F] = GNnab2Fex(a1, a2, tk, yk)
    F = zeros(2,2);
    for n=1:length(tk)
        F(1, 2) = F(1, 2) + tk(n)*exp(a2*tk(n))*(a1*exp(a2*tk(n))-yk(n));
        F(2, 1) = F(2, 1) + tk(n)*exp(a2*tk(n))*(a1*exp(a2*tk(n))-yk(n));
        F(2, 2) = F(2, 2) + tk(n)^2*exp(a2*tk(n))*(a1*exp(a2*tk(n))-yk(n));
    end
end
