function [x, y] = transform_circle_to_square_2(u, v, r)
% Project 1, Task 18
% Andrii Voznesenskyi, 323538
%
% Brief Description:
% This function performs a transformation from the square domain coordinates (u, v)
% to the circle domain coordinates (x, y) using an alternative method. The transformation
% accounts for the radius of the circle and ensures that points are mapped within the 
% circular domain.
% Input:
% u   - A vector or scalar representing the u-coordinate in the square domain.
% v   - A vector or scalar representing the v-coordinate in the square domain.
% r   - The radius of the circle into which the square domain is transformed; 
%       this parameter is used to normalize the transformation.
% Output:
% x   - The x-coordinate in the Cartesian plane after transformation, scaled to the circle's radius.
% y   - The y-coordinate in the Cartesian plane after transformation, scaled to the circle's radius.

x = u .* sqrt(1 - v.^2 ./ (2 * r.^2));
y = v .* sqrt(1 - u.^2 ./ (2 * r.^2));
end % function