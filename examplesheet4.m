q = 1;
func = @(x1, x2) 0.5*(x1.^2 + q * x2.^2);
[x,y] = meshgrid(-1:0.1:1, -1:0.1:1);
z1 = func(x, y);
contour(x, y, z1, '--b')
hold on
q = 100;
func = @(x1, x2) 0.5*(x1.^2 + q * x2.^2);
z2 = func(x, y);
contour(x, y, z2, '--r')