% MATH46132/66132 Sheet 1 Problem 3
% Problem 3c: Newton Method
x0=5.0;
tol=10^(-3);
error = 1;
itcount = 0;

xp=x0;

while error > tol
    itcount = itcount + 1;
    xn=xp-(funprimeP3(xp)/fun2primeP3(xp));
    FN=funP3(xn);
    FNprime=funprimeP3(xn);
    error = abs(xn-xp);
    xp=xn;
    disp(sprintf('%d %2.5f %2.5f %2.5f', itcount, xp, FN, FNprime));
end