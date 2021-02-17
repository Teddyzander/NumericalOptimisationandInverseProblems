% MATH46132/66132 Sheet 1 Problem 3
% Problem 3d: Secant Method
x0=4.8;
x1=5.2;
tol=10^(-3);
error = 1;
itcount = 0;

xp=x0;
xn=x1;

while error > tol
    itcount = itcount + 1;
    xnn=xp-(funprimeP3(xp)/(funprimeP3(xn)-funprimeP3(xp)))*(xn-xp);
    FN=funP3(xnn);
    FNprime=funprimeP3(xnn);
    error = abs(xnn-xn);
    xp=xn; xn=xnn;
    disp(sprintf('%d %2.5f %2.5f %2.5f', itcount, xn, FN, FNprime));
end