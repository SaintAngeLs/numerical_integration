 
% Define symbolic variables
syms u v

% Define the transformation functions x(u,v) and y(u,v)
[x_sym, y_sym] = transform_circle_to_square2(u, v);

% Compute the partial derivatives of x and y with respect to u and v
dx_du = diff(x_sym, u);
dx_dv = diff(x_sym, v);
dy_du = diff(y_sym, u);
dy_dv = diff(y_sym, v);

% Calculate the determinant of the Jacobian matrix
J_sym = simplify(dx_du * dy_dv - dx_dv * dy_du);

% Convert symbolic expression to string and replace operators with element-wise operators
    J_string = replace(string(J_sym), {'*', '/', '^'}, {'.*', './', '.^'});

disp(J_sym)
disp(J_string)

% Evaluate the Jacobian at specific points
points = [0 0; 1 1; 5/8 4/5];
J_values = zeros(size(points, 1), 1);

for i = 1:size(points, 1)
    J_values(i) = subs(J_sym, {u, v}, points(i, :));
end

% Display the calculated Jacobian values at the specific points
disp('The Jacobian values at the specific points are:');
disp(array2table(points, 'VariableNames', {'u', 'v'}));
disp(array2table(J_values, 'VariableNames', {'Jacobian'}));


