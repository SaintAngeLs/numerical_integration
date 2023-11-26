function plot_transformation_error()
% Project 1, zadanie 18
% Andrii Voznesenskyi, 323538
%

    % This function visualizes the error in transforming a unit circle to a square.
    % It computes and plots the Jacobian of the transformation to identify areas
    % of high distortion, which may contribute to numerical integration error.
    % It also visualizes the transformed and inverse-transformed grid points.
    fprintf('This function visualizes the error in transforming a unit circle to a square.\n')
    fprintf('It computes and plots the Jacobian of the transformation to identify areas\n')
    fprintf('of high distortion, which may contribute to numerical integration error.\n')
    fprintf('It also visualizes the transformed and inverse-transformed grid points.\n')
    % Define the transformation function and its inverse
    r = 1; % Circle radius
    transform = @(u, v) deal(r * u .* sqrt(1 - (v.^2) / 2), r * v .* sqrt(1 - (u.^2) / 2));
    inverse_transform = @(x, y) deal(x ./ sqrt(r^2 - y.^2), y ./ sqrt(r^2 - x.^2));
    
    % Define the grid
    n = 100; % Number of grid points
    u = linspace(-1, 1, n);
    v = linspace(-1, 1, n);
    [U, V] = meshgrid(u, v);
    
    % Apply the transformation
    [X, Y] = transform(U, V);
    
    % Compute the Jacobian of the transformation
    [dx_du, dx_dv] = transform(U, V);
    [dy_du, dy_dv] = transform(V, U); % Swap U and V for the derivative w.r.t. v
    J = dx_du .* dy_dv - dx_dv .* dy_du;
    
    % Plot the transformation
    figure;
    surf(X, Y, J);
    title('Jacobian of the Transformation');
    xlabel('X');
    ylabel('Y');
    zlabel('Jacobian');
    colorbar;
    
    % Identify points outside the unit circle
    outside_circle = (U.^2 + V.^2) > 1;
    X(outside_circle) = NaN; % Exclude points outside the unit circle
    Y(outside_circle) = NaN; % Exclude points outside the unit circle
    
    % Plot the points that correspond to the unit circle
    figure;
    scatter(X(:), Y(:), 10, J(:), 'filled');
    title('Transformed Points and Their Jacobian');
    xlabel('X');
    ylabel('Y');
    axis equal;
    colorbar;
    
    % Plot the inverse transformation to see the distortion
    figure;
    [U_inv, V_inv] = inverse_transform(X, Y);
    scatter(U_inv(:), V_inv(:), 10, 'filled');
    title('Inverse Transformed Points');
    xlabel('U');
    ylabel('V');
    axis equal;
end
