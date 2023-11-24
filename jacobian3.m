function J = jacobian3(u, v, r)
% Project 1, zadanie 18
% Andrii Voznesenskyi, 323538

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