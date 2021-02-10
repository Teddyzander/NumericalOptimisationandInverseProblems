a = 0.8;
b = -0.9;
c = -1.8;
d = 1;
f = 0.2;
g = 2;

func = @(x) a*x.^5 + b*x.^4 + c*x.^3 + d*x.^2 + f*x + g;
func_1 = @(x) 5*a*x^4 + 4*b*x^3 + 3*c*x^2 + 2*d*x + f;
func_2 = @(x) 20*a*x^3 + 12*b*x^2 + 6*c*x + 2*d;


[lower, upper] = oneD_bisection(-1.075, 1.7, func, 0.00001, 10);
test_new = newton_method((lower+upper)/2, func_1, func_2, 0.00001, 10);

x = -1.6:0.01:2;
y = func(x);

plot(x, y)