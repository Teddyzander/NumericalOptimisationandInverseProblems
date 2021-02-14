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

figure(1)
plot(data, f(data))
title('function to minimise')
xlabel('x')
ylabel('f(x)')

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

%[brent, brent_iter] = brent_method(4, 6, f, tol, max_iter)

%% Least Squares Stuff

% sort the data
time = [1, 2, 3, 4];
temp = [2.3, 5.1, 7.2, 9.5];

% define the functions for least squares
syms ls(a) tls(a)
ls(a) = (a.*time(1) - temp(1)).^2 + (a.*time(2) - temp(2)).^2 + ...
    (a.*time(3) - temp(3)).^2 + (a.*time(4) - temp(4)).^2;

% define the function for total least squares
%{
tls(a) = ((abs(a.*time(1) - temp(1)))./sqrt(a.^2 + (-1)^2)).^2 + ...
    ((abs(a.*time(2) - temp(2)))./sqrt(a.^2 + (-1)^2)).^2 + ...
    ((abs(a.*time(3) - temp(3)))./sqrt(a.^2 + (-1)^2)).^2 + ...
    ((abs(a.*time(4) - temp(4)))./sqrt(a.^2 + (-1)^2)).^2;
%}
tls(a) = (((a.*time(1) - temp(1)).^2) ./ (a.^2 + 1)) + ...
    (((a.*time(2) - temp(2)).^2) ./ (a.^2 + 1)) + ...
    (((a.*time(3) - temp(3)).^2) ./ (a.^2 + 1)) + ...
    (((a.*time(4) - temp(4)).^2) ./ (a.^2 + 1));
% plot(time, temp)

%plot the data
ls_a = [2.2:0.01:2.6];
ls_f = ls(ls_a);
lst_f = tls(ls_a);
figure(2)
plot(ls_a, ls_f, '-r', ls_a, lst_f, '-b');
title('Distance data is from line of best fit for a in [2.2, 2.6]')
xlabel('a')
ylabel('J(a)')
legend('least squares', 'total least squares')

% define minimum (calculation in notebook)
min_a = (1/60)*(1442/10);

% find minimum with bisection on LS and check error
[lower_a, upper_a, bi_iter_a] = oneD_bisection(2.2, 2.6, ls, 10^-4, max_iter);
min_bi_ls_a = (lower_a+upper_a)/2;
bi_error_a_ls = abs(min_a - min_bi_ls_a);

% find minimum with bisection on TLS and check error
[lower_a, upper_a, bi_iter_a] = oneD_bisection(2.2, 2.6, tls, 10^-4, max_iter);
min_bi_tls_a = (lower_a+upper_a)/2;
ls_tls_diff = abs(min_bi_ls_a-min_bi_tls_a);
bi_error_a_tls = abs(min_a - min_bi_tls_a);

% Just check the minimums agree with matlab
matlab_ls = fminsearch(ls, 2.2);
matlab_tls = fminsearch(tls, 2.2);
ls_error = abs(matlab_ls - min_bi_ls_a);
tls_error = abs(matlab_tls - min_bi_tls_a);

if ls_error < 10^-4
    disp('Correct value for least squares')
end
if tls_error < 10^-4
    disp('Correct value for total least squares')
end

%plot data and lines of fit
%define good functions
ls_line = @(t) t .* min_bi_ls_a;
tls_line = @(t) t .* min_bi_tls_a;

%get time data
all_time = [0:0.01:4];

%plot
figure(5)
subplot(2,1,1);
plot(time, temp, 'o', all_time, ls_line(all_time), '-r')
title('line of best fit using least squares (slope 2.4033)')
subplot(2,1,2); 
plot(time, temp, 'o', all_time, tls_line(all_time), '-b')
title('line of best fit using total least squares (slope 2.4046)')




    
    



