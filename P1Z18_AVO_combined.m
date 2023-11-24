function [  ...
            St, ...
            error_estimate, ...
            computation_time, ...
            num_evaluations, ...
            max_f, ...
            min_f, ...
            grid_size ...
         ] = P1Z18_AVO_combined(f, fpp, n, m, r, method, tr_method)
% Project 1, zadanie 18
% Andrii Voznesenskyi, 323538
%
% Obliczanie całek postaci \int\int_{D} f(x,y) dxdy, gdzie D = {(x, y)
% \in \mathbf{R^2} : x^2 + y^2 \leq r = 1} przez transformację na kwadrat 
% [-1, 1] x [-1, 1] i zastosowanie złożonych kwadratur trapezów ze względu
% na każdą zminenną
%
% Funkcja służy do obliczania przybliżonej wartości całki podwójnej
% na obszarze D, który jest okręgiem o promieniu r w przestrzeni R^2.
% Całkowanie przeprowadzane jest poprzez transformację obszaru D na kwadrat
% [-1, 1] x [-1, 1] i zastosowanie złożonej kwadratury trapezów dla obu 
% zmiennych.
% Użytkownik może wybrać metodę obliczeń przez określenie parametru 
% 'method'.
%
% Wejście:
%   f       - uchwyt do funkcji dwuwymiarowej f(x, y). Funkcja powinna być 
%             zdefiniowana do operacji na wektorach, z użyciem operatorów 
%             element po elemencie (np. x.^2 zamiast x^2)
%   fpp     - uchwyt do wektora funkcji będących drugimi pochodnymi f, 
%             fpp := [\frac{df}{dx}\frac{df}{dx}, 
%                     \frac{df}{dy}\frac{df}{dy}]
%             lub fpp := [] , gdy drugie pochodne nie są znane, czy nie
%             zakłada się ich podanie
%   n, m    - liczba podziałów przedziałów całkowania dla pierwszej i 
%             drugiej zmiennej (domyślnie n = 1000, m = 1000)
%   r       - promień okręgu definiującego obszar całkowania D
%             (domyślnie 1)
%   method  - łańcuch znaków lub liczba wskazująca wybraną metodę:
%             'transform' (domyślnie 'transform'), gdzie:
%             'transform' - metoda wykorzystująca transformację obszaru 
%                           całkowania (koła o promieniu r) na kwadrat 
%                           jednostkowy [-1, 1] x [-1, 1].
%                           Następnie wykorzystywana jest wzór złożonej 
%                           kwadratury trapezów ze względu na każdą zmienną
%                           do przybliżenia wartości całki. Błąd 
%                           teoretyczny tej metody zależy od drugiej 
%                           pochodnej funkcji podcałkowej oraz gęstości 
%                           siatki całkowania.
%   tr_method        -  metoda do transformacji, przyjmuje parametry:
%                       1, 2 lub 3. Przyjmuje domyślną wartość 2
% Wyjście:
%   St               - przybliżona wartość całki podwójnej uzyskana metodą 
%                      trapezów
%   error_estimate   - Szacowany błąd obliczeniowy całki. Dla metody 
%                      'transform' jest to teoretyczny błąd metody 
%                      trapezów oparty na drugiej pochodnej funkcji.
%                      Jeśli 'fpp' := [] to error_estimate jest podany w
%                      poastaci []
%   computation_time - czas potrzebny do wykonania obliczeń
%   num_evaluations  - liczba ewaluacji funkcji podcałkowej, odpowiadająca
%                      liczbie punktów na siatce całkowania, przez które
%                      przeprowadzane są obliczenia.
%   max_f, min_f     - maksymalna i minimalna wartość funkcji podcałkowej 
%                      na siatce całkowania
%   grid_size        - rozmiar siatki użytej do obliczeń, zwracany jako 
%                      wektor [n, m]
%   points_inside    - liczba punktów siatki znajdujących się wewnątrz 
%                      obszaru D (dotyczy tylko metody 'circle')

% Set default parameter values if not provided
if nargin < 6 || isempty(method)
    method = 'transform';
end
if nargin < 5 || isempty(r)
    r = 1;
end
if nargin < 4 || isempty(m)
    m = 1000;
end
if nargin < 3 || isempty(n)
    n = 1000;
end
if nargin < 2 || isempty(fpp)
    fpp_provided = false;
else
    fpp_provided = true;
end

% Validate input
if n <= 0 || m <= 0
    error('n and m must be greater than 0');
end

% Decide which method to use based on the 'method' parameter
switch lower(method)
    case {'transform', 1} % Use the transformation method
        if fpp_provided
            [St, error_estimate, computation_time, num_evaluations, max_f, min_f, grid_size] = transform_P1Z18_AVO_dict(f, fpp, n, m, r, tr_method);
        else
            [St, error_estimate, computation_time, num_evaluations, max_f, min_f, grid_size] = transform_P1Z18_AVO_dict_without_fpp(f, n, m, r, tr_method);
        end
        
    otherwise
        error('Unknown method. Use "transform" or "circle".');
end
end
