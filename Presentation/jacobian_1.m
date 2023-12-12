function J_det = jacobian_1(u, v)
% Project 1, Task 18
% Andrii Voznesenskyi, 323538
%
% Brief Description:
% This function computes the Jacobian determinant of the transformation from
% circular coordinates (u, v) to Cartesian coordinates (x, y). The
% transformation used is specific and relates to the method used in the
% numerical integration over a circular domain.
% Input:
% u   - A vector or scalar value of the transformed radial coordinate in the circular domain.
% v   - A vector or scalar value of the transformed angular coordinate in the circular domain.
% r   - The radius of the circular domain, which is used in the transformation.
%       There is an assumption, that the radious r is 1.
% Output:
% J_det - The determinant of the Jacobian matrix evaluated at each point (u, v).
%         If the determinant is zero, it is replaced with MATLAB's smallest 
%         positive normalized floating-point number, eps, to avoid division by zero issues.

%Calculate the partial derivatives
dx_du = 0.5 * cos(pi * (v + 1));
dx_dv = -0.5 * (u + 1) * pi .* sin(pi * (v + 1));
dy_du = 0.5 * sin(pi * (v + 1));
dy_dv = 0.5 * (u + 1) * pi .* cos(pi * (v + 1));

% Calculate the Jacobian determinant
J_det = (dx_du .* dy_dv) - (dx_dv .* dy_du);
J_det(J_det == 0) = eps;
end % function
