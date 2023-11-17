function val = transformed_function(u, v, f, r, method)
% Project 1, zadanie 18
% Andrii Voznesenskyi, 323538
%

if nargin < 5
    method = 2; % Default method is 2
end

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
        
    otherwise
        error('Unknown method.');
end

end % function