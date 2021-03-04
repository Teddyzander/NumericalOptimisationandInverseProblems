% lower and upper bounds for interval
a = 0;
b = 2;

%cubic example 4
phi4 = @(x) 5 .*x.^3 + -15 .* x.^2 + 12 .* x - 1;
phi4_dash = @(x) 15.*x.^2 -30.*x + 12;

%cubic example 3
phi3 = @(x) 2 -20.*x + 4.*x.^2 + 5.*x.^3;
phi3_dash = @(x)  -20 + 8.*x + 15.*x.^2;

%cubic example 2
phi2 = @(x) 4 .*x.^3 + 10 .* x.^2 + 5 .* x + 5;
phi2_dash = @(x) 12.*x.^2 + 20.*x + 5;

%cubic example 1
phi1 = @(x) 3 .*x.^3 - 6 .* x.^2 + 4 .* x;
phi1_dash = @(x) 9.*x.^2 - 12.*x + 4;

%interpolant
interp = @(phi, phi_dash, x) ... 
    ((phi(b) - phi(a) - b * phi_dash(0))./b^2) ... 
    * x.^2 + phi_dash(0) .* x + phi(0);

interval = [a:0.1:b];

figure(1)
subplot(2, 2, 1)
plot(interval, interp(phi3, phi3_dash, interval), '-r')
hold on
plot(interval, phi3(interval), '--b')
xlabel('$\alpha$', 'interpreter','latex');
ylabel('$\phi$', 'interpreter','latex');
legend('$\phi_q$', '$\phi$', 'interpreter','latex', ...
    'Location', 'northwest')
subplot(2, 2, 2)
plot(interval, interp(phi2, phi2_dash, interval), '-r')
hold on
plot(interval, phi2(interval), '--b')
xlabel('$\alpha$', 'interpreter','latex');
ylabel('$\phi$', 'interpreter','latex');
subplot(2, 2, 3)
plot(interval, interp(phi1, phi1_dash, interval), '-r')
hold on
plot(interval, phi1(interval), '--b')
xlabel('$\alpha$', 'interpreter','latex');
ylabel('$\phi$', 'interpreter','latex');
subplot(2, 2, 4)
plot(interval, interp(phi4, phi4_dash, interval), '-r')
hold on
plot(interval, phi4(interval), '--b')
xlabel('$\alpha$', 'interpreter','latex');
ylabel('$\phi$', 'interpreter','latex');
sgtitle('plots of different cubic $\phi$ and its interpolant', ...
    'interpreter','latex')
