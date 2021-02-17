% MATHn6132 Bisection Method for Least Squares (Linear Regression)
xA = 2.2; xB=2.6; 
tol=0.00001;
itcount = 0;

xM= 0.5*(xA+xB);
FA=LSfun(xA); FB=LSfun(xB); FM=LSfun(xM);
error = abs(xB-xA);

while  error>tol 
    itcount = itcount+1;
    xL=0.5*(xA+xM);
    xR=0.5*(xM+xB);
    FL=LSfun(xL); FR=LSfun(xR);
    [FMIN,imin] = min([FA,FL,FM,FR,FB]);
    if (imin==1 || imin==2)
        xB = xM; xM=xL; 
        FB=LSfun(xB); FM=LSfun(xM);
    elseif imin==3 
        xA=xL; xB=xR;
        FA=LSfun(xA); FB=LSfun(xB);
    else 
        xA=xM; xM=xR;
        FA=LSfun(xA); FM=LSfun(xM);
    end
error=abs(xB-xA);
disp(sprintf('%d %1.5f %1.5f %1.5f  %1.5f %1.5f %1.5f\n',...
         itcount, xA, xM, xB, FA, FM, FB));
end


