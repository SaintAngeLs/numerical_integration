function test_transform_circle_to_square()
    % Description of the tests being conducted.
    disp('This function tests the accuracy of three different transformations')
    disp('that map points from a unit circle to a square. Each transformation')
    disp('is assessed by the maximum error observed when points are mapped')
    disp('from the circle to the square and then back to the circle using the')
    disp('inverse transformation functions.')

    % Test for all three transformations and collect results
    results = [];  % Initialize an empty array to collect results
    results = [results; test_transformation(@transform_circle_to_square)];
    results = [results; test_transformation(@transform_circle_to_square2)];
    results = [results; test_transformation(@transform_circle_to_square3)];

    % Print the results in a table
    fprintf('\n%-40s%-20s%-20s\n', 'Transformation Function', 'Max Error in U', 'Max Error in V');
    fprintf('------------------------------------------------------------------------\n');
    for i = 1:size(results, 1)
        fprintf('%-40s%-20g%-20g\n', results(i).func, results(i).error_u, results(i).error_v);
    end
end

function result = test_transformation(transform_func)
    % Generate a grid of points on the unit circle
    theta = linspace(0, 2*pi, 100);
    u = cos(theta);
    v = sin(theta);

    % Perform the transformation from circle to square
    [x, y] = transform_func(u, v, 1);

    % Now perform the inverse transformation (square to circle)
    % Assuming inverse_transform_func is defined for each transformation
    [u_recovered, v_recovered] = inverse_transform_func(x, y);

    % Calculate the error between the original and recovered points
    error_u = max(abs(u - u_recovered));
    error_v = max(abs(v - v_recovered));

    % Store the function name and errors in a structure
    result.func = func2str(transform_func);
    result.error_u = error_u;
    result.error_v = error_v;
end
function [u, v] = inverse_transform_func(x, y)
    % Define the inverse transformation here. This is a placeholder for the actual
    % inverse transformation. You need to replace this with the correct inverse
    % function for your specific transformation.
    u = x .* sqrt(1 - y.^2 / 2);
    v = y .* sqrt(1 - x.^2 / 2);
end