% MATH46132/66132 Sheet 2 Problem 3
% Second derivative of F
function F2prime=fun2primeP3(x)
F2prime = 2*(x-3)^2*(x-5)^2+4*(x-1)*(x-3)*(x-5)^2+4*(x-1)*(x-3)^2*(x-5)...
+4*(x-1)*(x-3)*(x-5)^2+2*(x-1)^2*(x-5)^2+4*(x-1)^2*(x-3)*(x-5)...
+4*(x-1)*(x-3)^2*(x-5)+4*(x-1)^2*(x-3)*(x-5)+2*(x-1)^2*(x-3)^2;
end