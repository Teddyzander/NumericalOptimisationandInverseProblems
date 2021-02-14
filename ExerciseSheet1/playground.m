a = 0.8;
b = -0.9;
c = -1.8;
d = 1;
f = 0.2;
g = 2;

func = @(x) a*x.^5 + b*x.^4 + c*x.^3 + d*x.^2 + f*x + g;
func_1 = @(x) 5*a*x^4 + 4*b*x^3 + 3*c*x^2 + 2*d*x + f;
func_2 = @(x) 20*a*x^3 + 12*b*x^2 + 6*c*x + 2*d;


[lower, upper] = oneD_bisection(-1.2, 2, func, 0.00001, 10);
test_new = newton_method((lower+upper)/2, func_1, func_2, 0.00001, 1000);
test_sec = secant_method(lower, upper, func_1, 0.00001, 100000);

% disagreement

abs((lower+upper)/2 - test_new)
abs((lower+upper)/2 - test_sec)
abs(test_new - test_sec)


x = -2:0.01:3;
y = func(x);

plot(x, y)
xlim([-1.5, 2])