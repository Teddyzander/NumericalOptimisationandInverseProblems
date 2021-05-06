syms a1 a2 a3 a4 v1 v2 v3 v4

%% triangular system
disp('--- triangular weights system ---')
A=[0, 1, 1;
    1, 0, 1;
    1, 1, 0];
a=[a1;a2;a3];
v=[v1;v2;v3];
disp('Determinant of A')
det(A)
disp('Rank of A')
rank(A)
disp('Unique solution for system')
invA=inv(A);
invA*v

%% square system
disp('--- square weights system ---')
A = [0, 1, 0, 1;
    1, 0, 1, 0;
    0, 1, 0, 1;
    1, 0, 1, 0];
a = [a1;a2;a3;a4];
v=[6;4;6;4];
disp('Determinant of A')
det(A)
disp('Rank of A')
rank(A)
disp('Moore-Penrose psuedo inverse of A')
Am = pinv(A)
disp('System solution')
b = Am*v
disp('singular value decomposition of A')
format rational
[U S V] = svd(A)
%% determ
syms L  L1 L2 L3 L4
W = A'*A;
det(W - L*eye(4));

[a, b] = eigs(W);

%%
