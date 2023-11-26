function [x, y] = transform_circle_to_square_1(u, v, r)

x = 0.5 * (u + 1) .* cos(pi * (v + 1));
y = 0.5 * (u + 1) .* sin(pi * (v + 1));
end
