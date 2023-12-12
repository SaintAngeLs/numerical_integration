function test5()
% Project 1, zadanie 18
% Andrii Voznesenskyi, 323538
%
% Funkcja test_doubletrap_order przeprowadza test zbieżności złożonej metody trapezów
% dla przybliżania podwójnych całek. Celem jest sprawdzenie, jak szybko błąd przybliżenia
% całki podwójnej maleje wraz ze zwiększaniem liczby podziałów przedziału całkowania.
% Metoda trapezów jest metodą drugiego rzędu, co oznacza, że błąd powinien teoretycznie
% zmniejszać się proporcjonalnie do kwadratu długości kroku siatki (h^2).

nlines = 10;
lineCount = 0;
format_and_display_text('description_test5.txt', 74);

lineCount = lineCount + 10;
pauseEveryNLines(lineCount, nlines)

% Object of function F and its exact integral over the domain
test_functions = {
    {@(x, y) x.^2 + y.^2, pi/2, 'f(x, y) = x^2 + y^2', '0'}
    {@(x, y) exp(-x.^2-y.^2), pi*(1-exp(-1)), 'f(x, y) = exp(-x^2 - y^2)', 'pi*(1 - exp(-1))'}
};

for func_index = 1:length(test_functions)
    F = test_functions{func_index}{1};
    
    F_exact = test_functions{func_index}{2};
    F_str = test_functions{func_index}{3};
    F_int_val = test_functions{func_index}{4};
    % Set the limits of integration
    %F_exact = integral2(F, a, b, c, d);
    
    % Define the second partial derivatives for the function
    Fppx = @(x, y) -sin(x) .* cos(y);
    Fppy = @(x, y) -cos(x) .* sin(y);
    
    % Vectors of n and m for grid refinements
    n_values = [10, 20, 40, 80, 160, 320, 640, 1280] .* 4;
    m_values = n_values; % Same refinement for both directions

    % Initialize array to store errors
    errors = zeros(size(n_values));
    fprintf('-------------------------------------------\n');
    fprintf('Funkcja testowa: %s\n', F_str);
    fprintf('Dokładna wartość całki: %s\n', F_int_val);
    fprintf('-------------------------------------------\n');
    fprintf(' n\t\t m\t\t Error\t\t\tRate\n');
    fprintf('-------------------------------------------\n');
    for i = 1:length(n_values)
        n = n_values(i);
        m = m_values(i);
        
        [St, ~, ~, ~, ~, ~, ~] = P1Z18_AVO_combined(F, [], n, m, 1, 'transform', 1);
        
        % Absolute error
        error = abs(F_exact - St);
        errors(i) = error;
    
        % Display the results
        if i == 1
            fprintf('%4d   %4d     %1.4e     -\n', n, m, error);
        else
            % Calculate the rate as the log base 2 of the ratio of the previous error to the current error
            rate = log2(errors(i-1) / errors(i));
            fprintf('%4d   %4d     %1.4e    %1.2f\n', n, m, error, rate);
        end
    end
    lineCount = lineCount + 10;
    pauseEveryNLines(lineCount, nlines)
end
end % function