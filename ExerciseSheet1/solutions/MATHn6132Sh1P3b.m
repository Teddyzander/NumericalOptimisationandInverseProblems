% MATH46132/66132 Sheet 1 Problem 3
% Problem 3b: Bisection method

xA = 4.0; xB=6.0; 
tol=0.001;
itcount = 0;

xM= 0.5*(xA+xB);
FA=funP3(xA); FB=funP3(xB); FM=funP3(xM);


error = abs(xB-xA);

while  error>tol 
    itcount = itcount+1;
    xL=0.5*(xA+xM);
    xR=0.5*(xM+xB);
    FL=funP3(xL); FR=funP3(xR);
    [FMIN,imin] = min([FA,FL,FM,FR,FB]);
    if (imin==1 || imin==2)
        xB = xM; xM=xL; 
        FB=funP3(xB); FM=funP3(xM);
    elseif imin==3 
        xA=xL; xB=xR;
        FA=funP3(xA); FB=funP3(xB);
    else 
        xA=xM; xM=xR;
        FA=funP3(xA); FM=funP3(xM);
    end
error=abs(xB-xA);
disp(sprintf('%d %1.5f %1.5f %1.5f  %1.5f %1.5f %1.5f\n', itcount, xA, xM, xB, FA, FM, FB));
end


