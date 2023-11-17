function [x, y] = transform_circle_to_square(u, v)

x = 0.5 * (u + 1) .* cos(pi * (v + 1));
    y = 0.5 * (u + 1) .* sin(pi * (v + 1));
    % Circle-to-square transformation function
    % Assumes (u, v) are coordinates within a unit circle (u^2 + v^2 <= 1)

    % Check if the points are inside the circle
    if any(u.^2 + v.^2 > 1)
        error('All points must be inside the unit circle.');
    end

    % Calculate theta and r from the input coordinates
    theta = atan2(v, u);
    r = sqrt(u.^2 + v.^2);

    % Initialize x and y
    x = zeros(size(u));
    y = zeros(size(v));

    % Convert polar coordinates to square coordinates
    right_side = (theta <= pi/4) & (theta > -pi/4);
    top_side = (theta > pi/4) & (theta <= 3*pi/4);
    left_side = (theta > 3*pi/4) | (theta <= -3*pi/4);
    bottom_side = ~right_side & ~top_side & ~left_side;

    % Assign values to x and y based on the side of the square
    x(right_side) = 1;
    y(right_side) = tan(theta(right_side));

    x(top_side) = tan(pi/2 - theta(top_side));
    y(top_side) = 1;

    x(left_side) = -1;
    y(left_side) = -tan(theta(left_side));

    x(bottom_side) = -tan(pi/2 + theta(bottom_side));
    y(bottom_side) = -1;

    % Scale the coordinates by the radius
    x = x .* r;
    y = y .* r;
end
