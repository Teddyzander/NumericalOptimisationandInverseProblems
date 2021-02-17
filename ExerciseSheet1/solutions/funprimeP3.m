% MATH46132/66132 Sheet 2 Problem 3
% First derivative of F
function Fprime=funprimeP3(x)
Fprime = 2*(x-1)*(x-3)^2*(x-5)^2+2*(x-1)^2*(x-3)*(x-5)^2+2*(x-1)^2*(x-3)^2*(x-5)-5;
end