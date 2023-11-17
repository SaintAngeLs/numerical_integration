function [  ...
            St, ...
            error_estimate, ...
            computation_time, ...
            num_evaluations, ...
            max_f, ...
            min_f, ...
            grid_size, ...
            points_inside...
         ] = P1Z18_AVO_combined(f, fpp, n, m, r, method)
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
%   n, m    - liczba podziałów przedziałów całkowania dla pierwszej i 
%             drugiej zmiennej (domyślnie n = 1000, m = 1000)
%   r       - promień okręgu definiującego obszar całkowania D
%             (domyślnie 1)
%   method  - łańcuch znaków lub liczba wskazująca wybraną metodę:
%             'transform' lub 'circle' (domyślnie 'transform'), gdzie:
%             'transform' - metoda wykorzystująca transformację obszaru 
%                           całkowania (koła o promieniu r) na kwadrat 
%                           jednostkowy [-1, 1] x [-1, 1].
%                           Następnie wykorzystywana jest wzór złożonej 
%                           kwadratury trapezów ze względu na każdą zmienną
%                           do przybliżenia wartości całki. Błąd 
%                           teoretyczny tej metody zależy od drugiej 
%                           pochodnej funkcji podcałkowej oraz gęstości 
%                           siatki całkowania. Transformacja może 
%                           wprowadzać dodatkowe błędy
%                           związane z nieliniowością transformacji.
%             'circle'    - metoda bezpośredniego całkowania na obszarze 
%                           koła, która nie wymaga transformacji obszaru 
%                           całkowania. Zamiast tego stosuje złożoną 
%                           kwadraturę trapezów bezpośrednio na obszarze 
%                           koła, co wymaga sprawdzania, czy poszczególne
%                           punkty siatki całkowania znajdują się wewnątrz 
%                           koła. Błąd obliczeniowy tej metody szacowany 
%                           jest za pomocą  ekstrapolacji Richardsona, 
%                           która porównuje wyniki przybliżenia na siatkach
%                           o różnych gęstościach, to znaczy względem 
%                           różnych wartości liczb podziału przedziałów.
% Wyjście:
%   St               - przybliżona wartość całki podwójnej uzyskana metodą 
%                      trapezów
%   error_estimate   - Szacowany błąd obliczeniowy całki. Dla metody 
%                      'transform' jest to teoretyczny błąd metody 
%                      trapezów oparty na drugiej pochodnej funkcji. Dla 
%                      metody 'circle' jest to wartość uzyskana z formuły 
%                      ekstrapolacji Richardsona, która ocenia błąd 
%                      przybliżenia poprzez porównanie wyników 
%                      przybliżenia na dwóch różnych rozdzielczościach 
%                      siatki.
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


fprintf('Function handle f: %s\n', func2str(f));
fprintf('Function handle fpp: %s\n', func2str(fpp));
fprintf('n (number of intervals for first variable): %d\n', n);
fprintf('m (number of intervals for second variable): %d\n', m);
fprintf('r (radius of the domain D): %f\n', r);
fprintf('method (chosen computation method): %s\n', method);
[...
    St, ...
    error_estimate, ...
    computation_time, ...
    num_evaluations, ...
    max_f, ...
    min_f, ...
    grid_size, ...
    points_inside...
] = zeros(1,8);
end % function
