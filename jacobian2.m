function J = jacobian2(u, v, r)
% Project 1, zadanie 18
% Andrii Voznesenskyi, 323538

% dx_du = r .* sqrt(1 - (v.^2)/2);
% dx_dv = -r .* u .* v ./ sqrt(2 - v.^2);
% dy_du = -r .* u .* v ./ sqrt(2 - u.^2);
% dy_dv = r .* sqrt(1 - (u.^2)/2);
% 
% J = dx_du .* dy_dv - dx_dv .* dy_du;
% 
% J(isinf(J) | isnan(J)) = eps;


% denom_u = sqrt(2 - u.^2);
% denom_v = sqrt(2 - v.^2);
% 
% % Replace zeros with a very small number to avoid division by zero
% denom_u(denom_u == 0) = eps;
% denom_v(denom_v == 0) = eps;
% 
% % Calculate the Jacobian determinant with safety checks
% J = (-u.^2 - v.^2 + 2) ./ (denom_u .* denom_v);
% 
% % Replace Inf or NaN with a very small number to avoid singularities
% J(isinf(J) | isnan(J)) = eps;

 % Symbolically derived expression for the Jacobian determinant
 J = ((u + sqrt(2)) ./ (2 .* sqrt(2 .* sqrt(2) .* u + u.^2 - v.^2 + 2)) ...
    - (u - sqrt(2)) ./ (2 .* sqrt(u.^2 - 2 .* sqrt(2) .* u - v.^2 + 2))) ...
    .* ((v + sqrt(2)) ./ (2 .* sqrt(2 .* sqrt(2) .* v - u.^2 + v.^2 + 2)) ...
    - (v - sqrt(2)) ./ (2 .* sqrt(v.^2 - u.^2 - 2 .* sqrt(2) .* v + 2))) ...
    - (u ./ (2 .* sqrt(v.^2 - u.^2 - 2 .* sqrt(2) .* v + 2)) ...
    - u ./ (2 .* sqrt(2 .* sqrt(2) .* v - u.^2 + v.^2 + 2))) ...
    .* (v ./ (2 .* sqrt(u.^2 - 2 .* sqrt(2) .* u - v.^2 + 2)) ...
    - v ./ (2 .* sqrt(2 .* sqrt(2) .* u + u.^2 - v.^2 + 2)));


    % Safety checks for the Jacobian determinant
    tiny_value = eps;
    J(isinf(J) | isnan(J) | abs(J) < tiny_value) = tiny_value;
    
 % Constants for stability1
%     tiny_value = eps*eps; % A small number to avoid division by zero
% 
%     % Compute the partial derivatives of x with respect to u and v
%     dx_du_numerator = (u + sqrt(2)) - (u - sqrt(2));
%     dx_du_denominator = sqrt(2 + u.^2 - v.^2 + 2*sqrt(2)*u) + sqrt(2 + u.^2 - v.^2 - 2*sqrt(2).*u);
%     dx_du = (1/2) * (dx_du_numerator ./ (dx_du_denominator + tiny_value));
% 
%     dx_dv_numerator = (-v) - (-v);
%     dx_dv_denominator = sqrt(2 + u.^2 - v.^2 + 2*sqrt(2)*u) + sqrt(2 + u.^2 - v.^2 - 2*sqrt(2).*u);
%     dx_dv = (1/2) * (dx_dv_numerator ./ (dx_dv_denominator + tiny_value));
% 
%     % Compute the partial derivatives of y with respect to u and v
%     dy_du_numerator = (-u) - (-u);
%     dy_du_denominator = sqrt(2 - u.^2 + v.^2 + 2*sqrt(2)*v) + sqrt(2 - u.^2 + v.^2 - 2*sqrt(2).*v);
%     dy_du = (1/2) * (dy_du_numerator ./ (dy_du_denominator + tiny_value));
% 
%     dy_dv_numerator = (v + sqrt(2)) - (v - sqrt(2));
%     dy_dv_denominator = sqrt(2 - u.^2 + v.^2 + 2*sqrt(2)*v) + sqrt(2 - u.^2 + v.^2 - 2*sqrt(2).*v);
%     dy_dv = (1/2) * (dy_dv_numerator ./ (dy_dv_denominator + tiny_value));
% 
%     % Calculate the determinant of the Jacobian matrix
%     J_det = dx_du .* dy_dv - dx_dv .* dy_du;
%     
%     % Replace zero determinants with a very small number to avoid division by zero
%     J_det(abs(J_det) < tiny_value) = tiny_value;
%     
%     % Ensure no Inf or NaN values are present in the determinant
%     J_det(isinf(J_det) | isnan(J_det)) = tiny_value;
%     
%     J = J_det;


% dx_du = 1 / sqrt(1 - v.^2);
% dx_dv = u .* v ./ ((1 - v.^2).^(3/2));
% dy_du = u .* v / ((1 - u.^2).^(3/2));
% dy_dv = 1 ./ sqrt(1 - u.^2);
% 
% J = dx_du .* dy_dv - dx_dv .* dy_du;
% J = -(u.^2 + v.^2 - 1)./((1 - u.^2).^(3/2).*(1 - v.^2).^(3/2));
% % Replace Inf or NaN with a very small number to avoid singularities
%     tiny_value = eps;
%     J(isinf(J) | isnan(J) | J == 0) = tiny_value;
end % function