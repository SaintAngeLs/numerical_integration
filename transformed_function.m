function val = transformed_function(u, v, f, r, method)
% Project 1, zadanie 18
% Andrii Voznesenskyi, 323538
%

if nargin < 5
     val = [
        transformed_function(u, v, f, r, 1), ...
        transformed_function(u, v, f, r, 2), ...
    ];
else
    switch method
        case 1
            % Use the first transformation and Jacobian method
            [x, y] = transform_circle_to_square_1(u, v);
            J = jacobian_1(u, v, r);
            val = f(x, y) .* abs(J);
            
        case 2
            % Use the third transformation and Jacobian method
            [x, y] = transform_circle_to_square_2(u, v, 1);
            J = jacobian_2(u, v, r);
            val = f(x, y) .* abs(J);

        otherwise
            error('Unknown method.');
    end
end
end % function