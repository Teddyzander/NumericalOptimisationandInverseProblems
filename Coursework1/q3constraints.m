%% plane plot
figure(2)
[x z] = meshgrid(-1:0.1:1); % Generate x and y data
y = -1 - x; % Solve for z data
plane = surf(x,y,z); %Plot the surface
set(plane,'FaceColor',[0 0 1],'FaceAlpha',0.5);
hold on
r = sqrt(0.5);
[X,Y,Z] = cylinder(r);
circ1 = surf(X,Y,Z);
circ2 = surf(X,Y,-Z);
alpha 0.5
xlim([-1,1])
ylim([-1,1])
zlim([-1,1])
legend([plane, circ1], 'plane for $x_1 + x_2 + 1 = 0$', ...
    'plane for $x_1^2 + x_2^2 - \frac{1}{2} = 0$', ...
    'interpreter','latex','FontSize',10, ...
    'location', 'south');
title('Constraints shown in their planar form','interpreter','latex','FontSize',12)
xlabel('$x_1$','interpreter','latex','FontSize',12,'FontWeight', 'bold')
ylabel('$x_2$','interpreter','latex','FontSize',12,'FontWeight', 'bold')
zlabel('$x_3$','interpreter','latex','FontSize',12,'FontWeight', 'bold')