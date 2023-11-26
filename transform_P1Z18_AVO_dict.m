function [...
            St,...
            error_estimate,...
            computation_time,...
            num_evaluations,...
            max_f,...
            min_f,...
            grid_size...
         ] = transform_P1Z18_AVO_dict(f, fpp, n, m, r, t_m)
% Project 1, zadanie 18
% Andrii Voznesenskyi, 323538
%
% Obliczanie całek postaci \int\int{D}{f(x,y)dxdy}, gdzie D = {(x, y)
% \in \mathbf{R^2} : x^2 + y^2 \leq r = 1} przez transformację na kwadrat 
% [-1, 1] x [-1, 1] i zastosowanie złożonych kwadratur trapezów ze względu
% na każdą zminenną
% Wejście:
%   f   -   uchwyt do funkcji dwuwymiarowej, przybliżona wartość całki
%           podwójnej której jest obliczona
%  fpp  -   uchwyt do funkcji będącej drugą pochodną f lub []
%   n   -   liczba podziałów przedziału całkowania względem pierwszej 
%           zmiennej
%   m   -   liczba podziałów przedziału całkowania względem drugiej 
%           zmiennej 
%   j   -   uchwyt do funkcji będącej, jakobian przekształcenia
%   r   -   promień okręgu, który definiuje obszar
%  t_m  -  metoda do transformacji, przyjmuje parametry:
%          1 lub 2
% Wyjście:
%   St - przybliżona wartość całki podwójnej uzyskana za pomocą metody trapezów.
%   error_estimate - szacunkowy błąd obliczeniowy całki.
%   computation_time - czas potrzebny do wykonania obliczeń.
%   num_evaluations - liczba ewaluacji funkcji podcałkowej.
%   max_f - maksymalna wartość funkcji podcałkowej na siatce całkowania.
%   min_f - minimalna wartość funkcji podcałkowej na siatce całkowania.
%   grid_size - rozmiar siatki użytej do obliczeń, zwracany jako wektor [n, m].
% Błąd:
%   Funkcja zwraca błąd, jeśli liczby podziałów n lub m są mniejsze lub równe zero.


if n == 0 || m == 0
        error('n and m must be greater than 0');
end

[St, error_estimate, computation_time, num_evaluations, max_f, min_f, grid_size] = doubletrap(@(u, v) transformed_function(u, v, f, r, t_m), fpp, n, m, -1, 1, -1, 1);
end % function