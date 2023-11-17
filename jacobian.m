function J_det = jacobian(u, v, r)
% Project 1, zadanie 18
% Andrii Voznesenskyi, 323538

% %Calculate the partial derivatives
%     dx_du = 0.5 * cos(pi * (v + 1));
%     dx_dv = -0.5 * (u + 1) * pi .* sin(pi * (v + 1));
%     dy_du = 0.5 * sin(pi * (v + 1));
%     dy_dv = 0.5 * (u + 1) * pi .* cos(pi * (v + 1));
%     
%     % Calculate the Jacobian determinant
%     J_det = (dx_du .* dy_dv) - (dx_dv .* dy_du);
%     J_det(J_det == 0) = eps;
% Calculate theta and r from the input coordinates
    % Calculate theta and r from the input coordinates
     % Calculate theta and r from the input coordinates
    theta = atan2(v, u);
    r = sqrt(u.^2 + v.^2);

    % Initialize the Jacobian determinant
    J_det = zeros(size(u));
    
    % Define conditions for each side of the square
    right_side = (theta <= pi/4) & (theta > -pi/4);
    top_side = (theta > pi/4) & (theta <= 3*pi/4);
    left_side = (theta > 3*pi/4) | (theta <= -3*pi/4);
    bottom_side = (theta > -3*pi/4) & (theta <= -pi/4);

    % Compute the determinant of the Jacobian for each side
    % For points on the right side of the square
    J_det(right_side) = r(right_side).^2 .* cos(theta(right_side)).^2 + r(right_side).^2 .* sin(theta(right_side)).^2;
    
    % For points on the top side of the square
    J_det(top_side) = r(top_side).^2 .* cos(theta(top_side)).^2 + r(top_side).^2 .* sin(theta(top_side)).^2;
    
    % For points on the left side of the square
    J_det(left_side) = r(left_side).^2 .* cos(theta(left_side)).^2 + r(left_side).^2 .* sin(theta(left_side)).^2;
    
    % For points on the bottom side of the square
    J_det(bottom_side) = r(bottom_side).^2 .* cos(theta(bottom_side)).^2 + r(bottom_side).^2 .* sin(theta(bottom_side)).^2;

end
