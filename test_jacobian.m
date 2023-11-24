function test_jacobian()
    % Set up a grid of points on the unit circle
    theta = linspace(0, 2*pi, 10000);
    dtheta = theta(2) - theta(1);
    u = cos(theta);
    v = sin(theta);
    r = ones(size(u)); % since r is not used in transformation, we can set it to ones

    % Calculate the Jacobian at each point on the unit circle
    J_values = arrayfun(@(u, v, r) jacobian3(u, v, r), u, v, r);

    % Theoretical area elements on the circle
    circle_area_elements = r * dtheta;  % Because r is 1 for unit circle

    % Transform the points to the square
    [x, y] = arrayfun(@transform_circle_to_square2, u, v, r);

    % Calculate the area of the small elements on the square
    square_area_elements = J_values .* circle_area_elements;

    % Compare the area elements
    error_area = max(abs(square_area_elements - circle_area_elements));

    % Display the maximum area error
    fprintf('Maximum area error: %g\n', error_area);

    % A small threshold to determine if the Jacobian is correctly scaling areas
    threshold = 1e-10;

    % Check if the test is successful
    if error_area < threshold
        disp('Jacobian test passed successfully.');
    else
        disp('Jacobian test failed.');
    end

    % Plot the Jacobian
    figure; % Create a new figure window
    plot(theta, J_values, 'LineWidth', 2); % Increase line width for better visibility
    xlabel('Theta (radians)', 'FontSize', 12); % Increase font size for readability
    ylabel('Jacobian Determinant', 'FontSize', 12); % Increase font size for readability
    title('Jacobian Determinant around the Unit Circle', 'FontSize', 14); % Increase font size for readability
    grid on; % Add a grid for easier visualization
    axis tight; % Fit the plot more tightly around the data
    set(gca, 'FontSize', 10); % Set the axis font size
    legend('Jacobian', 'Location', 'best'); % Add a legend
end
