% This Matlab file contains the solutions for MATHn6132 
% Numerical Optimization and Inverse Problems
% Problems Sheet 5 for problem 2c.
% Conjugate Gradients for Quadratic Functionals.
% Oliver Dorn, School of Mathematics, The University of Manchester.

% Version 1:  do two steps of CG individually; We expect 
% that the CG method terminates after two steps since
% n=2.

A=[4 2; 2 3]
b=[3; 1]
x0=[1;0]

 
 g0=A*x0+b
 
 p0=-g0;
 delta0=g0'*g0;
 
 % Begin CG iterations
 % first CG iteration:
 h0=A*p0;
 tau0=delta0/(p0'*h0);
 x1=x0+tau0*p0
 
 g1=g0+tau0*h0;
 delta1=g1'*g1;
 beta0=delta1/delta0;
 p1=-g1+beta0*p0;
 
 % second CG iteration
 
  h1=A*p1;
 tau1=delta1/(p1'*h1);
 x2=x1+tau1*p1
 
 g2=g1+tau1*h1;
 delta2=g2'*g2;
 beta1=delta2/delta1;
 p2=-g2+beta1*p1;

