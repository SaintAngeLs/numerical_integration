function [St, error_estimate, points_inside, computation_time] = doubletrap_circle(F, n, m, r)
% Project 1, zadanie __
% Andrii Voznesenskyi,323538
%
% Zmodyfikowana metoda trapezów z uwzględnieniem zmiennej:
% Całkowanie przez kwadrat ograniczający koło, z odejmowaniem wkładów z 
% narożników, które są poza kołem.
% Metoda ta obejmuje sprawdzenie, czy każdy punkt leży w granicach koła.
%
% Błąd szacowany jest przy użyciu ekstrapolacji Richardsona, która jest techniką numeryczną
% do oceny błędu przybliżenia poprzez porównanie wyników przybliżenia przy dwóch różnych
% rozdzielczościach siatki. Metoda ta zakłada, że błąd numerycznego przybliżenia zmniejsza się
% znanym tempem w miarę zwiększania liczby podziałów siatki.
% Szacowany błąd można obliczyć korzystając z następującej formuły ekstrapolacji Richardsona:
% Błąd szacowany = (St_dokładniejsze - St_grubsze) / (2^p - 1),
% gdzie p to rząd wyrazu błędu (dla wzoru trapezów, p = 2).
%
% Wejście:
%   F - uchwyt do funkcji dwuwymiarowej F(x, y).
%   n - liczba podziałów przedziału całkowania wzdłuż osi x.
%   m - liczba podziałów przedziału całkowania wzdłuż osi y.
%   r - promień koła definiującego obszar całkowania.
%
% Wyjście:
%   St - przybliżona wartość całki podwójnej.
%   error_estimate - szacunkowy błąd obliczeniowy całki.
%   points_inside - liczba punktów wewnątrz koła użytych do całkowania.
%   computation_time - czas wykonania obliczeń całkowania.


tic; % Start timing the computation

 % Perform the integration with the original number of subdivisions

 [St, points_inside] = perform_integration(F, n, m, r);

% Perform the integration with a refined grid
[St_refined, ~] = perform_integration(F, 2*n, 2*m, r);

% Estimate the error using Richardson's extrapolation
error_estimate = (St_refined - St) / 3;

% Stop timing the computation
computation_time = toc;
end % function
