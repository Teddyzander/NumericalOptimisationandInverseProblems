% This Matlab file contains the solutions for MATHn6132 
% Problems Sheet 7 for problems 4a and 4b.
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

disp('The right hand side vector b is ') 
disp(b)

disp('Strike any key to continue') 
pause



% Calculate rank of the matrix 
    
rankA=rank(A);

disp(sprintf('The rank of A is %d', rankA))

% Calculate Singular Value Decomposition
disp(' We calculate singular value decomposition of system matrix A')

[U,S,V]=svd(A) ;

disp('orthogonal matrix U is') 

disp(U)
disp('Strike any key to continue') 
pause



disp('The diagonal S is ') 

disp(S)

disp('Strike any key to continue') 
pause


disp('The orthogonal matrix V is') 

disp(V)

disp('Strike any key to continue') 
pause 



% extract diagonal of S
diag(S);

% Build inverse of diagonal submatrix D

T= zeros(size(A'));
for k=1:rankA
    T(k,k)=1/S(k,k) ;
end

disp('The inverted diagonal S^(+) is')
disp(T)

disp('Strike any key to continue') 
pause 


% Construct generalized inverse

Ageninv=V*T*U';

disp('The generalized inverse is ') 
disp(Ageninv)

disp('Strike any key to continue') 
pause 


% Calculate least squares solution with minimal norm xlsmn

xlsmn = Ageninv * b;

% Display result

disp(' Generalized least squares solution of minimal norm xgsmn is ')
disp(xlsmn)

disp('Strike any key to continue') 
pause 


disp(sprintf('The 2-norm of xgsmn is %f', norm(xlsmn)))

disp('Strike any key to continue') 
pause 

xlsmndisp=reshape(xlsmn,4,4);

disp('The reshaped xgsmn in 4x4 format is ')

disp(xlsmndisp)

disp('Strike any key to continue') 
pause 


disp(' compare this with the magic square ')
disp(magic(4))

disp('Strike any key to continue') 
pause 


% Compare with norm of magic square

C=magic(4);

xmagic=[C(1,:),C(2,:),C(3,:),C(4,:)]';

disp(sprintf('The 2-norm of the magic square is %f', norm(xmagic)))
