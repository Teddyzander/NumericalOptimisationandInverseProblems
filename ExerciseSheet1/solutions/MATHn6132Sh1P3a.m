% MATH46132/66132 Sheet 1 Problem 3
% Problem 3a: Plot function.
x=[0.5:0.01:5.5];
F1=(x-1).^2.*(x-3).^2.*(x-5).^2-5.*x;
figure(1)
plot(x,F1);
