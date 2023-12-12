function val = transformed_function(u, v, f, r, method)
% Project 1, zadanie 18
% Andrii Voznesenskyi, 323538
%
% This function applies a specified transformation to a two-dimensional 
% function 'f' that is initially defined over a circular domain of radius 'r'. 
% It transforms 'f' to be defined over a square domain using one of two 
% possible methods. It also scales the function value by the absolute value 
% of the Jacobian determinant to account for the change of variables.
% Inputs:
%   u, v     - Coordinates in the square domain corresponding to the 
%              original 
%              circular domain.
%   f        - Handle to the two-dimensional function defined on the 
%              circular domain.
%   r        - Radius of the circle in the original domain.
%   method   - (Optional) An integer (1 or 2) specifying the transformation 
%              method to use. If 'method' is not provided, the function 
%              will return a vector with the transformed values using both 
%              methods.
%
% Output:
%   val      - The value of the transformed function at coordinates (u, v).
%              If 'method' is not provided, 'val' is a vector containing 
%              the values from both transformation methods.

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
            J = jacobian_1(u, v);
            val = f(x, y) .* abs(J);
            
        case 2
            % Use the second transformation and Jacobian method
            [x, y] = transform_circle_to_square_2(u, v, 1);
            J = jacobian_2(u, v);
            val = f(x, y) .* abs(J);

        otherwise
            error('Unknown method.');
    end
end
end % function