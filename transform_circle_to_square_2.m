function [x, y] = transform_circle_to_square_2(u, v, r)

x = u .* sqrt(1 - v.^2 ./ (2 * r.^2));
y = v .* sqrt(1 - u.^2 ./ (2 * r.^2));
end % function