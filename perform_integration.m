function [St, points_inside] = perform_integration(F, n, m, r)
% Project 1, zadanie 18
% Andrii Voznesenskyi, 323538

% Calculate the integration step
hx = 2 * r / n;
hy = 2 * r / m;

% Initialize the sum and the points inside counter
St = 0;
points_inside = 0;

% Iterate over each subinterval
for i = 1:n
    for j = 1:m
        % Calculate the midpoint of the subinterval
        x = -r + (i-0.5) * hx;
        y = -r + (j-0.5) * hy;

        % Check if the midpoint is inside the circle
        if x^2 + y^2 <= r^2
            % Evaluate the function at the midpoint and add to the sum
            St = St + F(x, y);
            points_inside = points_inside + 1;
        end
    end
end

% Multiply by the area of each subinterval
St = St * hx * hy;
end % function