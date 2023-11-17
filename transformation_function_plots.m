function transformation_function_plots()
% Project 1, zadanie 18
% Andrii Voznesenskyi, 323538
%

% Define the function f (for simplicity, let's use f(x,y) = x^2 + y^2)
f = @(x, y) x.^2 + y.^2;

% Generate a grid of points in the u,v domain
[u, v] = meshgrid(linspace(-1, 1, 100), linspace(-1, 1, 100));

% Compute the transformed points (x,y) from the (u,v) grid
R = 1; % radius of the circle
z = zeros(size(u));
for i = 1:size(u, 1)
    for j = 1:size(u, 2)
        z(i, j) = transformed_function(u(i,j), v(i,j), f, R);
    end
end

% Plot
figure;
subplot(1, 2, 1);
mesh(u, v, z);
title('Square Domain (u,v)');
xlabel('u'); ylabel('v'); zlabel('f(u,v)');

subplot(1, 2, 2);
[x, y] = meshgrid(linspace(-R, R, 100), linspace(-R, R, 100));
z = f(x, y);
z(x.^2 + y.^2 > R^2) = NaN; % Mask out values outside the circle
mesh(x, y, z);
title('Circular Domain (x,y)');
xlabel('x'); ylabel('y'); zlabel('f(x,y)');
end