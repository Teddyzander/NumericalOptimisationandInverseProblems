% This Matlab file contains the solutions for MATHn6132 
% Problems Sheet 5 for problem 2c.
% Numerical Optimization and Inverse Problems
% Conjugate Gradients for Quadratic Functionals.
% Oliver Dorn, School of Mathematics, The University of Manchester.

clear all;

disp(sprintf('\n Quadratic CG \n'))

A=[4 2; 2 3];
b=[3; 1];
c=-1;

% Put tolerance for stopping criterion
tol=10^(-3);

% Put starting values

x0=[1;0];
nu=0;
 g0=fun1prime(x0);
 delta0=g0'*g0;
 
 disp(sprintf('initial guess: (%5.3f , %5.3f) ', x0(1), x0(2)));
 
 % Initialize CG iterations

xprev=x0;
gprev=g0;
pprev=-g0;   % steepest descent in first iteration
deltaprev=delta0;


% begin CG iterations
error = 1.0;
 

while error > tol
    % With reference to code given in course notes:
    % index 'nu' is written 'prev'
    % index 'nu+1' is written 'next'
 
   h=A*pprev;
   tau=deltaprev/(pprev'*h);  % line search parameter


xnext = xprev + tau*pprev;  % update approximate solution
gnext = gprev+tau*h;    % update gradient
deltanext=gnext'*gnext;
beta=deltanext/deltaprev;   % Fletcher Reeves update
pnext=-gnext + beta * pprev;

% check stopping criterion:
gg=fun1prime(xnext);
error=sqrt(gg'*gg);

disp(sprintf('%d %f %f %f %f', nu, xnext(1), xnext(2), fun1(xnext),error));   


% prepare next iteration:
nu=nu+1;
pprev=pnext;
xprev=xnext;
gprev=gnext;
deltaprev=deltanext;

end % while 


