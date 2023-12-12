function J = jacobian_2(u, v)
% Project 1, Task 18
% Andrii Voznesenskyi, 323538
%
% Brief Description:
% This function calculates the Jacobian determinant for the transformation from
% square coordinates (u, v) to circle coordinates with radius r. It includes
% safeguards against division by zero by substituting zero denominators with 
% MATLAB's smallest positive normalized floating-point number, eps. It also 
% replaces any resulting Inf or NaN values with eps to avoid singularities.
% Input:
% u   - A vector or scalar representing the u-coordinate in the square domain.
% v   - A vector or scalar representing the v-coordinate in the square domain.
% r   - The radius of the circle into which the square domain is transformed; 
%       this parameter is part of the transformation equations.
%       There is an assumption, that the radious r is 1.
% Output:
% J   - The Jacobian determinant for the transformation at each point (u, v).
%       The function ensures that the determinant never becomes zero, Inf, or NaN by 
%       substituting such values with eps.

denom_u = sqrt(2 - u.^2);
denom_v = sqrt(2 - v.^2);

% Replace zeros with a very small number to avoid division by zero
denom_u(denom_u == 0) = eps;
denom_v(denom_v == 0) = eps;

% Calculate the Jacobian determinant with safety checks
J = (-u.^2 - v.^2 + 2) ./ (denom_u .* denom_v);

% Replace Inf or NaN with a very small number to avoid singularities
J(isinf(J) | isnan(J)) = eps;
end % function