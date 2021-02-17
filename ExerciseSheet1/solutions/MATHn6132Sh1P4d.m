% MATHn6132 Bisection Method for Total Least Squares (Deming Regression)
xA = 2.2; xB=2.6; 
tol=0.00001;
itcount = 0;

xM= 0.5*(xA+xB);
FA=TLSfun(xA); FB=TLSfun(xB); FM=TLSfun(xM);
error = abs(xB-xA);

while  error>tol 
    itcount = itcount+1;
    xL=0.5*(xA+xM);
    xR=0.5*(xM+xB);
    FL=TLSfun(xL); FR=TLSfun(xR);
    [FMIN,imin] = min([FA,FL,FM,FR,FB]);
    if (imin==1 || imin==2)
        xB = xM; xM=xL; 
        FB=TLSfun(xB); FM=TLSfun(xM);
    elseif imin==3 
        xA=xL; xB=xR;
        FA=TLSfun(xA); FB=TLSfun(xB);
    else 
        xA=xM; xM=xR;
        FA=TLSfun(xA); FM=TLSfun(xM);
    end
error=abs(xB-xA);
disp(sprintf('%d %1.5f %1.5f %1.5f  %1.5f %1.5f %1.5f\n', ...
            itcount, xA, xM, xB, FA, FM, FB));
end


