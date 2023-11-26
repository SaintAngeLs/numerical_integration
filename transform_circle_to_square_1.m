function [x, y] = transform_circle_to_square_1(u, v)
% Project 1, Task 18
% Andrii Voznesenskyi, 323538
%
% Brief Description:
% This function transforms a point (u, v) in a square domain to a point (x, y)
% in the circular domain using a specific transformation method. The transformation
% is designed to map a square into a circle for the purpose of numerical integration.

% Input:
% u   - A vector or scalar representing the normalized radial coordinate in the square domain.
% v   - A vector or scalar representing the normalized angular coordinate in the square domain.
% r   - The radius of the circle into which the square is transformed.
%       There is an assumption, that the radious r is 1.
% Output:
% x   - The x-coordinate in the Cartesian plane after transformation.
% y   - The y-coordinate in the Cartesian plane after transformation.


x = 0.5 * (u + 1) .* cos(pi * (v + 1));
y = 0.5 * (u + 1) .* sin(pi * (v + 1));
end
