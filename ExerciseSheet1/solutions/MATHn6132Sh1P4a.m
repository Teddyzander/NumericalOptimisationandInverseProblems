% MATHn6132 Least Squares and Total Least Squares Plot
clear all
a=[2.2:0.01:2.6];
JTLS=zeros(size(a));
JLS=zeros(size(a));
length=size(a,2);

for k=1:length
JTLS(1,k)=TLSfun(a(1,k));
JLS(1,k)=LSfun(a(1,k));
end
figure(1)
plot(a,JLS,'b--'); 
hold
plot(a,JTLS,'m-'); 
hold
xlabel('a'); ylabel('blue dashed: JLS(a), magenta dash dotted: JTLS(a)');
title('Least Squares versus Total Least Squares')