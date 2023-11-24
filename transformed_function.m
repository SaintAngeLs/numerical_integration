function val = transformed_function(u, v, f, r, method)
% Project 1, zadanie 18
% Andrii Voznesenskyi, 323538
%

if nargin < 5
     val = [
        transformed_function(u, v, f, r, 1), ...
        transformed_function(u, v, f, r, 2), ...
        transformed_function(u, v, f, r, 3), ...
        transformed_function(u, v, f, r, 4)
    ];
else
    switch method
        case 1
            % Use the first transformation and Jacobian method
            [x, y] = transform_circle_to_square(u, v);
            J = jacobian(u, v, r);
            val = f(x, y) .* abs(J);
            
        case 2
            % Use the second transformation and Jacobian method
            [x, y] = transform_circle_to_square2(u, v);
            J = jacobian2(u, v, r);
            val = f(x, y) .* abs(J);
        case 3
            % Use the third transformation and Jacobian method
            [x, y] = transform_circle_to_square3(u, v, 1);
            J = jacobian3(u, v, r);
            val = f(x, y) .* abs(J);
      case 4
        % Use transformation in polar coordinates
        % u is the normalized radius, v is the angle
        % Transform (u, v) from [0,1]x[0,2*pi] to Cartesian (x, y)
        theta = v * 2 * pi;  % v should be scaled to [0, 2*pi]
        rho = u * r;  % Radius, scaled by the normalized radial coordinate u and the circle radius r
        x = rho .* cos(theta);
        y = rho .* sin(theta);
        
        % The Jacobian of the transformation from polar to Cartesian coordinates
        J = rho;  % The Jacobian determinant is rho in polar coordinates
        
        % Evaluate the function and multiply by the Jacobian (since we're integrating over dA, not just dθ)
        val = f(x, y) .* abs(J);

        otherwise
            error('Unknown method.');
    end
end
end % function