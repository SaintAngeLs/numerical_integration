function [x, y] = transform_circle_to_square2(u, v, r)
%  r = sqrt(u.^2 + v.^2);
%     % Avoid division by zero for the center point
%     r(r == 0) = 1;
%     % Perform the transformation
%     x = u .* sqrt(1 - v.^2 ./ (2 * r.^2));
%     y = v .* sqrt(1 - u.^2 ./ (2 * r.^2));
% page 5,
% https://arxiv.org/ftp/arxiv/papers/1709/1709.07875.pdf 
    x = sqrt(2) / 2 * (u .* sqrt(1 - v.^2 / 2) + v .* sqrt(1 - u.^2 / 2));
    y = sqrt(2) / 2 * (v .* sqrt(1 - u.^2 / 2) - u .* sqrt(1 - v.^2 / 2));
end % function