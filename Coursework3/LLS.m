%% system values
B = [1, 0.5;
    1, 1;
    1, 2;
    1, 4;
    1, 5;
    1, 6;
    1, 8];
yk = [50; 3.2939; 4.2699; 7.1749; 9.3008; 30; 20.259];
d = log(yk);

%% solution to the system
b = inv(B'*B)*B'*d;

disp('b1')
b(1)
disp('b2')
b(2)
disp('corresponding a1')
exp(b(1))
disp('corresponding a2')
b(2)
disp('Gradient here')
B'*B*b-B'*d

%% plot stuff
% plot observed data
tk = [0.5, 1, 2, 4, 5, 6, 8];
yk = [50, 3.2939, 4.2699, 7.1749, 9.3008, 30, 20.259];
figure(1)
for n=1:length(tk)
    subplot(2, 3, n)
    hold on
    t = [0:0.1:9];
    y = @(a1, a2) a1*exp(a2.*t);
    %plot value of nonlinear solution
    lecr = y(2.541069136837578, 0.259501850448539);
    plot(t, lecr, '-b')
    %plot value of linear solution
    cour = y(exp(b(1)), b(2));
    plot(t, cour, '--r');
    hold on
    plot(tk, yk, 'og')
    % label axis
    xlabel('$t$', 'interpreter', 'Latex')
    ylabel('$y$', 'interpreter', 'Latex')
    title('Estimated curve for linearised solution')
    legend('nonlinear solution', 'linearised solution', 'Observed Data', ...
    'interpreter', 'Latex')
    
    %limit plot to data point
    xlim([tk(n)-0.00008, tk(n)+0.00008]);
    ylim([yk(n)-0.00008, yk(n)+0.00008]);
end

%% Just checking some values
detB = 5*(1^2+2^2+4^2+5^2+8^2) - (1+2+4+5+8)^2;
coef1= (1^2+2^2+4^2+5^2+8^2)*(1.1921+1.4516+1.9706+2.2301+3.0086);
coef2 = -(1+2+4+5+8)*(1.1921+2*1.4516+4*1.9706+5*2.2301+8*3.0086);

(1/detB)*(coef1+coef2);

%% plot entire curve
figure(2)
hold on
t = [0:0.1:9];
y = @(a1, a2) a1*exp(a2.*t);
lecr = y(19.990116508725457, -0.032543700379023);
plot(t, lecr, '-b')
exp(b(1))
b(2)
ans = [exp(b(1)), b(2)];
cour = y(exp(b(1)), b(2));
plot(t, cour, '--r');
hold on
plot(tk, yk, 'og')
xlabel('$t$', 'interpreter', 'Latex')
ylabel('$y$', 'interpreter', 'Latex')
title('Estimated curves with bad data point')
legend('nonlinear solution', 'linearised solution', 'Observed Data', ...
    'interpreter', 'Latex')

