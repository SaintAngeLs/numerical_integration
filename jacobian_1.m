function J_det = jacobian_1(u, v, r)
% Project 1, zadanie 18
% Andrii Voznesenskyi, 323538

%Calculate the partial derivatives
dx_du = 0.5 * cos(pi * (v + 1));
dx_dv = -0.5 * (u + 1) * pi .* sin(pi * (v + 1));
dy_du = 0.5 * sin(pi * (v + 1));
dy_dv = 0.5 * (u + 1) * pi .* cos(pi * (v + 1));

% Calculate the Jacobian determinant
J_det = (dx_du .* dy_dv) - (dx_dv .* dy_du);
J_det(J_det == 0) = eps;
end % function
