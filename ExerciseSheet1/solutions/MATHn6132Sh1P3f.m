% MATH46132/66132 Sheet 1 Problem 3
% Problem 3e (Part 2): Interpolation Method 
% (interpolation formula from Brent's Method from Numerical Recipies)
% Compare with interpolation method obtained from Lagrange Interpolation.
clear all;
x0=4.5;
x1=5.0;
x2=5.5;
tol=10^(-3);
error = 1;
itcount = 0;

xa=x0;
xb=x1;
xc=x2;

while error > tol
    itcount = itcount + 1;
    Fa=funP3(xa); Fb=funP3(xb); Fc=funP3(xc);
%    xnew=0.5*(Fa*(xb^2-xc^2)+Fb*(xc^2-xa^2)+Fc*(xa^2-xb^2))/...
  %      (Fa*(xb-xc)+Fb*(xc-xa)+Fc*(xa-xb));
    xnew=xb-0.5*((xb-xa)^2*(Fb-Fc)-(xb-xc)^2*(Fb-Fa))/...
        ((xb-xa)*(Fb-Fc)-(xb-xc)*(Fb-Fa));
    Fnew=funP3(xnew);
    Fnewprime=funprimeP3(xnew);
    error = abs(xnew-xc);
    disp(sprintf('%d %2.5f %2.5f %2.5f', itcount, xnew, Fnew, Fnewprime));
    xa=xb;xb=xc;xc=xnew;
   
    if itcount > 100
        break;
    end
end