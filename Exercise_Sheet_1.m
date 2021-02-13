%% question 3: one variable optimisation

syms f(x);
max_iter = 1000;
tol = 10^(-3);
%% plot the function (x − 1)^2*(x − 3)^2*(x − 5)^2 − 5x in [0.5, 5.5]
data = 0.5:0.01:5.5;

% define function and derivatives
f(x) = (x-1).^2. * (x-3).^2. * (x-5).^2 - 5.*x;
f_1 = diff(f, x);
f_2 = diff(f_1, x);

% plot the data
plot(data, f(data))

%% find approximationg for interval global minimum in [4, 6]

[lower, upper, bi_iter] = oneD_bisection(4, 6, f, tol, max_iter)

%% use the newton method to approximate minimum starting at 5

[newton, new_iter] = newton_method(5, f_1, f_2, tol, max_iter)

%% use the secant method to approx minimum using 4.8 and 5.2

[secant, sec_iter] = secant_method(4.8, 5.2, f_1, tol, max_iter)


%% use interpolation to estimate f and 3 points 4.5, 5.0, 5.5

[poly, poly_iter] = three_point_lag(4.5, 5.0, 5.5, f, tol, max_iter)

legend('F(x)', 'P_1(X)', 'P_2(X)', 'P_3(X)', 'P_4(X)', 'P_5(X)', 'P_6(X)', 'P_7(X)')

%% use brent method to estimate minimum between 4.0, 6.0

[gss, gss_iter] = gss_method(4, 6, f, tol, max_iter)

[brent, brent_iter] = brent_method(4, 6, f, tol, max_iter)
