function test_circle_to_square_transformations()
    num_points = 100000;
    fprintf('This function demonstrates two transformations that convert a set of points \n');
    fprintf('from a circular distribution to a square distribution. \n');
    fprintf('A total of %d random points are generated within a unit circle \n', num_points);
    fprintf('using polar coordinates (r, theta) where r is the radius and theta is the angle. \n');
    fprintf('These points are then converted into Cartesian coordinates (u, v) \n');
    fprintf('before being transformed by two different methods into a square distribution.\n');
    fprintf('The resulting distributions are plotted side by side for comparison.\n\n');

  %Generate random points within a unit circle
    theta = 2 * pi * rand(num_points, 1); % Random angle
    r = sqrt(rand(num_points, 1)); % Random radius in [0,1), for uniform distribution
    u = r .* cos(theta); % Convert polar to Cartesian coordinates for u
    v = r .* sin(theta); % Convert polar to Cartesian coordinates for v

    % Apply the first transformation
    [x1, y1] = transform_circle_to_square(u, v);

    % Apply the second transformation
    [x2, y2] = transform_circle_to_square2(u, v);

    % Plotting the circular domain and the transformations
    figure; % Create a new figure window

    % Plot the circular domain
    subplot(2, 2, 1); % Create a subplot (2 rows, 2 columns, first plot)
    scatter(u, v, 1, '.'); % Plot the points in the circular domain
    axis equal; % Ensure the axes have the same scale
    title('Circular Domain');
    xlabel('U');
    ylabel('V');
    xlim([-1, 1]); % Set X-axis limits
    ylim([-1, 1]); % Set Y-axis limits

    % Plot the first transformation from circle to square
    subplot(2, 2, 2); % Create a subplot (2 rows, 2 columns, second plot)
    scatter(x1, y1, 1, '.'); % Plot the transformed points
    axis equal; % Ensure the axes have the same scale
    title('First Transformation to Square');
    xlabel('X');
    ylabel('Y');
    xlim([-1, 1]); % Set X-axis limits
    ylim([-1, 1]); % Set Y-axis limits

    % Plot the circular domain again for comparison
    subplot(2, 2, 3); % Create a subplot (2 rows, 2 columns, third plot)
    scatter(u, v, 1, '.'); % Plot the points in the circular domain
    axis equal; % Ensure the axes have the same scale
    title('Circular Domain');
    xlabel('U');
    ylabel('V');
    xlim([-1, 1]); % Set X-axis limits
    ylim([-1, 1]); % Set Y-axis limits

    % Plot the second transformation from circle to square
    subplot(2, 2, 4); % Create a subplot (2 rows, 2 columns, fourth plot)
    scatter(x2, y2, 1, '.'); % Plot the transformed points
    axis equal; % Ensure the axes have the same scale
    title('Second Transformation to Square');
    xlabel('X');
    ylabel('Y');
    xlim([-1, 1]); % Set X-axis limits
    ylim([-1, 1]); % Set Y-axis limits
end