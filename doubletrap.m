function [St, error_estimate, computation_time, num_evaluations, max_f, min_f, grid_size] = doubletrap(F, Fpp, n, m, a, b, c, d)
% Project 1, zadanie 18
% Andrii Voznesenskyi, 323538
%
% Zastosowanie złożonego wzoru trapezów ze wzgłędu na każdą zmienną
% Wejście:
%   F   -   uchwyt do funkcji dwuwymiarowej, dla której ma zostać obliczona
%           przybliżona wartość całki podwójnej
%   n   -   liczba podziałów przedziału całkowania względem pierwszej 
%           zmiennej
%   m   -   liczba podziałów przedziału całkowania względem drugiej 
%           zmiennej 
%   a   -   dolna granica całkowania względem pierwszej zmiennej
%   b   -   górna granica całkowania względem pierwszej zmiennej
%   c   -   dolna granica całkowania względem drugiej zmiennej
%   d   -   górna granica całkowania względem drugiej zmiennej
% Wyjście:
%   St - przybliżona wartość całki podwójnej uzyskana za pomocą złożonej 
%        kwadratury trapezów.
%   error_estimate - szacunkowy błąd obliczeniowy, obecnie niezaimplementowany
%                    i zwracany jako NaN.
%   computation_time - czas obliczeń w sekundach.
%   num_evaluations - liczba ewaluacji funkcji F, co jest równoznaczne z 
%                     liczbą punktów w siatce.
%   max_f - maksymalna wartość funkcji F na siatce punktów.
%   min_f - minimalna wartość funkcji F na siatce punktów.
%   grid_size - rozmiar siatki użytej do obliczeń, zwracany jako wektor [n, m].
%
% Przypadek specjalny: Jeśli n = 0 i m = 0, funkcja zwraca wartość funkcji 
%                      F dla środka obszaru całkowania pomnożoną przez rozmiar 
%                      obszaru.

% Przypadek: n = m = 0
fpp_provided = ~isempty(Fpp);

if n == 0 && m == 0
    St = F((a+b)/2, (c+d)/2) * (b-a) * (d-c);
    return
end

tic; % Start timing the computation

% Calculate the integration step
hx = (b - a) / n;
hy = (d - c) / m;

% Create the grid points for calculations
[X, Y] = meshgrid(a:hx:b, c:hy:d);

% Evaluate the function at the grid points
W = F(X, Y);
num_evaluations = numel(W); % Update the counter

% Apply the composite trapezoidal rule
W(1,:) = W(1,:) / 2;
W(end,:) = W(end,:) / 2;
W(:,1) = W(:,1) / 2;
W(:,end) = W(:,end) / 2;

% Sum the results and scale
St = sum(W(:)) * hx * hy;

if fpp_provided
    % Calculate error estimate based on second derivatives
    Fpp_x = Fpp{1}; % Extract the handle for the second derivative w.r.t. x
    Fpp_y = Fpp{2}; % Extract the handle for the second derivative w.r.t. y

    max_second_derivative_x = max(max(abs(Fpp_x(X, Y))));
    max_second_derivative_y = max(max(abs(Fpp_y(X, Y))));

    % Estimate the error for the trapezoidal rule based on the second derivatives
    error_estimate_x = -((b - a)^3 / (12 * n^2)) * max_second_derivative_x;
    error_estimate_y = -((d - c)^3 / (12 * m^2)) * max_second_derivative_y;
    error_estimate = sqrt(error_estimate_x^2 + error_estimate_y^2);
else
    % Return placeholder for error estimate if fpp is not provided
    error_estimate = [];
end

% Find the maximum and minimum function values
max_f = max(W(:));
min_f = min(W(:));

% Computation time
computation_time = toc;

% Grid size
grid_size = [n, m];
end % function
