%% define functions and get variables
func = @(x,y,z) -x.^2 + -y.^2 + z.^2;
[x,y,z] = meshgrid(-1:0.1:1, -1:0.1:1, -1:0.1:1);
v = func(x,y,z);
con1 = @(var) -1 - var;
con2 = @(var) sqrt(1/2 - var.^2);

step = [-2:0.1:2];
con1y = con1(step);
con2y = con2(step);

%% compute isosurfaces (f) and lines (constraints), and min
figure(1)
p1 = patch(isosurface(x,y,z,v,-0.5));
hold on
p2 = patch(isosurface(x,y,z,v,0));
hold on
p3 = patch(isosurface(x,y,z,v,0.5));
hold on
p4 = patch(isosurface(x,y,z,v,1));
hold on

line = plot(step, con1y);
circ = ezplot(@(x,y) (x).^2 + (y).^2 -0.5);
mark = plot(-0.5, -0.5, '.k', 'MarkerSize', 20)

%% plot and colour isonormals at desired levels
isonormals(x,y,z,v,p1);
isonormals(x,y,z,v,p2);
isonormals(x,y,z,v,p3);
isonormals(x,y,z,v,p4);
p1.FaceColor = 'red';
p2.FaceColor = 'yellow';
p3.FaceColor = 'blue';
p4.FaceColor = 'green';
p1.EdgeColor = 'none';
p2.EdgeColor = 'none';
p3.EdgeColor = 'none';
p4.EdgeColor = 'none';

%% fix lighting and transparency
daspect([1,1,1])
view(3); axis tight
camlight 
lighting flat
alpha 0.5

%% plot beautify
set(circ,'LineWidth',2);
set(line, 'LineWidth',2);
legend([p1, p2, p3, p4, line, circ], '$f(x_1, x_2, x_3) = -0.5$', ...
    '$f(x_1, x_2, x_3) = 0.0$', ... 
    '$f(x_1, x_2, x_3) = 0.5$', ... 
    '$f(x_1, x_2, x_3) = 1$', ...
    '$x_1 + x_2 + 1 = 0$', ...
    '$x_1^2 + x_2^2 - \frac{1}{2} = 0$', 'interpreter','latex','FontSize',10, ...
'location', 'east');
title('Locations of constraints for $f$','interpreter','latex','FontSize',12)
xlabel('$x_1$','interpreter','latex','FontSize',12,'FontWeight', 'bold')
ylabel('$x_2$','interpreter','latex','FontSize',12,'FontWeight', 'bold')
zlabel('$x_3$','interpreter','latex','FontSize',12,'FontWeight', 'bold')

 