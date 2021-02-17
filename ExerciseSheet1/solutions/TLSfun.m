% Functional for Total Least Squares Minimization
function[J]=TLSfun(a)
t=[1.0,2.0,3.0,4.0];
theta=[2.3,5.1,7.2,9.5];
ainv=1/a;
tstar=(theta+t.*ainv)./(a+ainv);
dsquare=(tstar-t).^2+(a.*tstar-theta).^2;
J=sum(dsquare);
end