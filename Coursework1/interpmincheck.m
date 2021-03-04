%% define the interpolation function
interp = @(phi_0, phi_a, phidash_0, a_0, a) ... 
    ((phi_a - phi_0 - a_0 .* phidash_0) ./ a_0^2) .* a.^2 + ...
    phidash_0 .* a + phi_0;

%% define parameters
a=0; %lower bound of interval
a_0=2; %upper bound of interval (must be > 0)
phi_0=-10; %value of phi at lower bound (unconstrained)
phidash_0=5; %value of gradient at phi(0) (must be < 0)
phi_a_adj = [1:0.5:11]; %adjuster to observe changes in phi(a) 
phi_a=phi_0 + (phidash_0 * a_0)/2 + phi_a_adj; %value of phi at upper bound 

%% evaluate the interpolant for different values of phi_a
test = zeros(1, length(phi_a));
step_size = 0.000001;
alpha=[a:step_size:a_0]; %define interval
phi = zeros(length(test), length(alpha));

%% check that we meet constraints to have a minimum inside the interval
disp('For phi_0 + (phidash_0 * a_0)/2 = ' + string(phi_0 + (phidash_0 * a_0)/2))
for i=1:length(phi_a_adj)
    phi(i, :) = interp(phi_0, phi_a(i), phidash_0, a_0, alpha); %get phi over interval
    [a, b] = min(phi(i, :));
    if b < (a_0/step_size) && b > 1
        disp('phi_a=' + string(phi_a(i)) + ' has minimum in interval')
    else
        disp('phi_a=' + string(phi_a(i)) + ' has no minimum in interval')
    end
end
% this breaks down if step size is too large compared to the gradient
% but it gives a good general idea

%% plot the different interpolants
for i=1:(length(phi_a_adj))
    test(i) = plot(alpha, phi(i, :), '-r'); %plot the interpolant
    hold on
end
%{
test((length(phi_a_adj)+1)/2) = plot(alpha, phi(i, :), '-g'); %plot the interpolant
hold on
for i=(length(phi_a_adj)+1)/2+1:length(phi_a_adj)
    test(i) = plot(alpha, phi(i, :), '-b'); %plot the interpolant
    hold on
end
%}

legend([test(1)], '$\phi_q(\alpha_0) > \phi(0) + \frac{\alpha_0\nabla\phi(0)}{2}$', ...
'$\phi_q(\alpha_0) = \phi(0) + \frac{\alpha_0\nabla\phi(0)}{2}$', ... 
'$\phi_q(\alpha_0) > \phi(0) + \frac{\alpha_0\nabla\phi(0)}{2}$', 'interpreter','latex','FontSize',10, ...
'location', 'southwest');
title('How different conditions on $\phi_q$ effect the behaviour','interpreter','latex','FontSize',12)
xlabel('$\alpha$','interpreter','latex','FontSize',12,'FontWeight', 'bold')
ylabel('$\phi_q(\alpha)$','interpreter','latex','FontSize',12,'FontWeight', 'bold')