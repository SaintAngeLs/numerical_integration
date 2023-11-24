function plot_circle_transformation_to_cartesian()
    % Plots the transformation from a circle to Cartesian coordinates using polar coordinates.
    % r is the radius of the circle.
    r = 1;
    % Create a grid of u and v values
    [u, v] = meshgrid(linspace(0, 1, 100), linspace(0, 1, 100));  % Normalized grid
    theta = v * 2 * pi;  % v scaled to [0, 2*pi]
    rho = u * r;  % Radius, u scaled from [0, 1] to [0, r]

    % Perform the transformation
    x = rho .* cos(theta);
    y = rho .* sin(theta);
    
    % Plot the transformation
    figure;
    surf(x, y, zeros(size(x)), 'EdgeColor', 'none');  % Plot in the XY plane
    colormap('hsv');  % Use a color map to distinguish different angles
    colorbar;
    axis equal;  % Ensure the aspect ratio shows the circle correctly
    xlabel('X');
    ylabel('Y');
    title('Transformation from Circle to Cartesian Coordinates');
end
