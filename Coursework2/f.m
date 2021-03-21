% In this script we simply sketch, over some given space, a mesh
% of the 2D function we are minimising. This gives us a general idea of
% values we expect to see

% INPUTS
% func is the quadratic form of f with given matrices, 
% l and u are the lower and upper bounds for the area to plot
% plot is a true/false bool for producing a plot of the function
% [if mesh is large, shading is interpolated (so it isn't just black!)]
% type is to choose between surface or contour ('s' for surface)
% consize is to change to levels in the contour plot

% OUTPUTS
% surface is the mesh for f evalulated between the bounds
% plot is the function plotted

function [surface, plot] = f(func, l, u, step, plot, type, consize)

% set up interval of interest, and allocate memory for mesh
x_int=[l:step:u];
y_int=[l:step:u];
surface=zeros(length(x_int), length(y_int));

% find the value of the function for 
for i=1:length(x_int)
    for j=1:length(y_int)
        surface(i, j) = func([x_int(i); y_int(j)]);
    end
end

if plot == true
    if type == 's'
        plot = surf(y_int, x_int, surface);
        title('Surface plot for the function $f$', ...
            'interpreter','latex','FontSize',12);
        xlabel('$x_1$','interpreter','latex','FontSize',12,'FontWeight', 'bold');
        ylabel('$x_2$','interpreter','latex','FontSize',12,'FontWeight', 'bold');
        zlabel('$f(x_1, x_2)$','interpreter','latex','FontSize',12,'FontWeight', 'bold');
    
        if length(x_int) > 100 || length(y_int) > 100
            shading interp;
        end
    else
        [Y,X]=meshgrid(x_int, y_int);
        v=[min(surface(:)):consize:max(surface(:))];
        plot = contourf(X,Y,surface,v);
        title('Contour plot for the function $f$', ...
            'interpreter','latex','FontSize',12);
        xlabel('$x_1$','interpreter','latex','FontSize',12,'FontWeight', 'bold');
        ylabel('$x_2$','interpreter','latex','FontSize',12,'FontWeight', 'bold');
        colorbar;
    end
end
end

