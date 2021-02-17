% Functional for Least Squares Minimization
function[J]=LSfun(a)
t=[1.0,2.0,3.0,4.0];
theta=[2.3,5.1,7.2,9.5];
dsquare=(a.*t-theta).^2;
J=sum(dsquare);
end