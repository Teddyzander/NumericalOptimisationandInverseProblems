%% calculate errors for linear/nonlinear system
y = @(t) 2.4278*exp(0.3051*t);
y5 = 30;
y1 = 3.2939;
t1 = 1;
t5 = 6;
y(t5) - y5
log(y(t5)) - log(y5)
y(t1) - y1
log(y(t1)) - log(y1)

%%
tk = [1; 2; 4; 5; 8];
zk = [1.1921; 1.4516; 1.9706; 2.2301; 3.0086];
denomdet = 5*sum(tk.*tk) - sum(tk)^2
coef1 = sum(tk.*tk)*sum(zk)
coef2 = -sum(tk)*sum(zk.*tk)
coef3 = -sum(tk)*sum(zk)
coef4 = 5*sum(tk.*zk)

(1/denomdet)*(coef1+coef2)
(1/denomdet)*(coef3+coef4)