% This Matlab file contains the solutions for MATHn6132 
% Problems Sheet 7 for problem 4c.
% Oliver Dorn, School of Mathematics, The University of Manchester.


% Build system matrix

A=[ 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 ;
    0 0 0 0 1 1 1 1 0 0 0 0 0 0 0 0 ;
    0 0 0 0 0 0 0 0 1 1 1 1 0 0 0 0 ;
    0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1;
    1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0;
    0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 ;
    0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 ;
    0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 ;
    1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 ;
    0 0 0 1 0 0 1 0 0 1 0 0 1 0 0 0 ;
    1 1 0 0 1 1 0 0 0 0 0 0 0 0 0 0 ;
    0 0 1 1 0 0 1 1 0 0 0 0 0 0 0 0 ;
    0 0 0 0 0 0 0 0 1 1 0 0 1 1 0 0 ;
    0 0 0 0 0 0 0 0 0 0 1 1 0 0 1 1 ;
    0 0 0 0 0 1 1 0 0 1 1 0 0 0 0 0 ;
    1 0 0 1 0 0 0 0 0 0 0 0 1 0 0 1 ] ;

disp('The system matrix A is ' )

disp(A) 
disp('Strike any key to continue') 

pause

% Build right hand side

b=34 * ones(16,1);



% For comparing with the Least Squares Solution of minimal norm
% we explicitly store xlsmn

xlsmn = 8.5*ones(16,1);
    
% Loop over different regularization parameters

disp(' k  |xRLS-xlsmn|  |A*xRLS-b|   |xRLS|');

for k=1:10

gamma = 10^(-k);

% Build regularized system matrix and right hand side

bstar= A'*b;
LGS = (A'*A + gamma * eye(16));

% solve regularized system 

xRLS= LGS\bstar; 

% uncomment if you want to see the xRLS in each step
disp(sprintf('The regularized least squares solution for k= %d  is', k))
format long 
disp(xRLS)
format short


% Calculate different norms of interest 

error1=norm(xRLS-xlsmn,2);
error2=norm(A*xRLS-b,2);
normRLS=norm(xRLS,2);

disp(' k  |xRLS-xlsmn|  |A*xRLS-b|   |xRLS|');
disp(sprintf('%d %2.9f %2.9f  %2.9f', k, error1, error2, normRLS));

disp('Strike any key to continue') 
pause 

end















