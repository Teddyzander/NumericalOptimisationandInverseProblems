% This Matlab file contains the solutions for MATHn6132 
% Numerical Optimization and Inverse Problems
% Problems Sheet 5 for problem 2b.
% Conjugate Directions.
% Oliver Dorn, School of Mathematics, The University of Manchester.

A=[4 2; 2 3]
b=[3; 1]
x0=[1;1]

 [V,D]=eig(A)
 
 p1=V(:,1)
 p0=V(:,2)
 
 g0=A*x0+b
 
 alpha0=-(g0'*p0)/(p0'*A*p0)
 
 x1=x0+alpha0*p0
 
 g1=A*x1+b
 
 alpha1=-(g1'*p1)/(p1'*A*p1)
 
  x2=x1+alpha1*p1
 
