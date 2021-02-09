func = @(x) (x-3)^4 + x^3 - (x + 1)^2 + x/5 +3;

[lower, upper] = oneD_bisection(-10, 10, func, 0.00000001, 1000);