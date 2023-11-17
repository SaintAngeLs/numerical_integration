function [St, error_estimate, points_inside, computation_time] = direct_circle_V_P1Z18_AVO_dict(f, n, m, r)
% Project 1, zadanie __
% Andrii Voznesenskyi, 323538
%   
% metoda bezpośredniego całkowania na obszarze koła, która nie wymaga 
% transformacji obszaru całkowania. Zamiast tego stosuje złożoną 
% kwadraturę trapezów bezpośrednio na obszarze koła.
% Wejście:
%   f   -   uchwyt do funkcji dwuwymiarowej, przybliżona wartość całki
%           podwójnej której jest obliczona
%   n   -   liczba podziałów przedziału całkowania względem pierwszej 
%           zmiennej
%   m   -   liczba podziałów przedziału całkowania względem drugiej 
%           zmiennej 
%   j   -   uchwyt do funkcji będącej, jakobian przekształcenia
%   r   -   promień okręgu, który definiuje obszar
%   var -   postać transformacji (domyślnie 1)
% Wyjście:
%   St - przybliżona wartość całki podwójnej obliczona metodą trapezów.
%   error_estimate - szacunkowy błąd obliczeniowy całkowania.
%   points_inside - liczba punktów siatki całkowania znajdujących się wewnątrz
%                   obszaru D.
%   computation_time - czas wykonania obliczeń całkowania.
% Błędy:
%   Funkcja zgłasza błąd, jeśli liczba podziałów n lub m jest mniejsza lub równa 0.


if n == 0 || m == 0
        error('n and m must be greater than 0');
end

[St, error_estimate, points_inside, computation_time] = doubletrap_circle(f, n, m, r);
end % function