%Rosenbrock function
f = @(x_1, x_2) 100*(x_2 - x_1^2)^2 + (1 - x_1)^2;

% define some bounds to examine this function
a = 0;
b = 2;

% get even steps over this domain
x1 = [a:0.1:b];
x2 = [a:0.1:b];
% preallocate memory for f
f_x1x2 = zeros(length(x1), length(x2));

%analyse the function in this domain
for i=1:length(x1)
    for j=1:length(x2)
        f_x1x2(i, j) = f(x1(i), x2(j));
    end
end

%plot
surf(x1, x2, f_x1x2);
title('Rosenbeck Function')
xlabel('x_1')
ylabel('x_2')
zlabel('f(x_1, x_2)')

% to find minimiser, find where g(x) = 0
min = [1, 1];
% diff f in terms of each variable to get
g = {@(x) -400*x(1) * (x(2) - x(1)^2) - 2*(1 - x(1)); ...
    @(x) 200 * (x(2)- x(1)^2)};

H = {@(x) -400 * x(2) + 1200 * x(1)^2 + 2, @(x) 200; ...
    @(x) -400^x(1), @(x) 200};

g_min = zeros(size(g));
H_min = zeros(size(H));

loops=size(H);

% check the minimum point
for i=1:loops(1);
    g_min(i) = g{i}(min);
    for j=1:loops(2)
        H_min(i, j) = H{i, j}(min);
    end
end

% check we meet criteria
one = g_min(1);
two = g_min(2);

flag1 = 0
glag2 = 0
if one == 0 && two == 0
    disp('1st order criteria met')
    flag1 = 1;
end
det_1 = H_min(1,1);
det_2 = det(H_min);

if det_1 >= 0 && det_2 >= 0
    disp('2nd order criteria met')
    flag2 = 2;
end

if flag1 == 1 && flag2 ==2
    str = [num2str(min(1)), ', ', num2str(min(2)), ' is minimiser'];
    disp(join(str))
end




