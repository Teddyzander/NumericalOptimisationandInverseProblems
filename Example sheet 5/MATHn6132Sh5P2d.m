% This Matlab file contains the solutions for MATHn6132 
% Numerical Optimization and Inverse Problems
% Problems Sheet 5 for problem 2d.
% BFGS method
% Oliver Dorn, School of Mathematics, The University of Manchester.


% BFGS method on simple problem
% Function stored in fun1.m
% Gradient stored in fun1prime.m
clear all;

%
disp(sprintf('\n BFGS \n'))

% Put tolerance for stopping criterion
tol=10^(-3);

% Put c1 for Armijo condition in line search
c1=0.01;

% initial guess:
nu=0;
x0=[1;0];
H0=eye(2);
g0=fun1prime(x0);

disp(sprintf('initial guess: (%5.3f , %5.3f) ', x0(1), x0(2)));

% Prepare iterations
xprev=x0;
Hprev=H0;
gprev=g0;

% begin quasi-Newton iterations
error = 1.0;

while error > tol
    % With reference to code given in course notes:
    % index 'nu' is written 'prev'
    % index 'nu+1' is written 'next'

pnext=-Hprev\gprev;
% backtracking line search along pnext:
tt=1.0;   % starting guess for step size
Phiprime=pnext'*gprev;    
armijo=0;
Phi0=fun1(xprev);
backtrsteps=0;
while armijo==0
   backtrsteps = backtrsteps+1;
   tt=0.9*tt;   % reduce step size 
   xx=xprev+tt*pnext;
   Phi=fun1(xx);
   if Phi < Phi0+ tt*c1*Phiprime 
       armijo=1;
   end
end

taunext=tt;

xnext=xprev+taunext*pnext;  % update approximate solution
gnext=fun1prime(xnext);     % new gradient

% bfgs update of Hessian approximation:
sprev=xnext-xprev;
yprev=fun1prime(xnext)-fun1prime(xprev);

Hnext=Hprev-(Hprev*sprev*sprev'*Hprev)/((Hprev*sprev)'*sprev)+(yprev*yprev')/(yprev'*sprev);

% check stopping criterion:
gg=fun1prime(xnext);
error=sqrt(gg'*gg);

disp(sprintf('%d %d %f %f %f %f', nu, backtrsteps, xnext(1), xnext(2), fun1(xnext),error));   

%initialize next step
nu=nu+1;
xprev=xnext;
Hprev=Hnext;
gprev=gnext;

end % while 



