function test0()
% Funkcja test_doubletrap_order przeprowadza test zbieżności złożonej metody trapezów
% dla przybliżania podwójnych całek. Celem jest sprawdzenie, jak szybko błąd przybliżenia
% całki podwójnej maleje wraz ze zwiększaniem liczby podziałów przedziału całkowania.
% Metoda trapezów jest metodą drugiego rzędu, co oznacza, że błąd powinien teoretycznie
% zmniejszać się proporcjonalnie do kwadratu długości kroku siatki (h^2).

nlines = 10;
lineCount = 0;
maxColumns = 74; 
format_and_display_text('description_test0.txt', 74);

lineCount = lineCount + 10;
pauseEveryNLines(lineCount, nlines)

% Object of function F and its exact integral over the domain
test_functions = {
    {@(x, y) sin(x) .* cos(y), (sin(5/6) + sin(8/9))*(-cos(5/6) + cos(8/9))}
    {@(x, y) x.^2 + y.^2, 231601/157464}
    {@(x, y) exp(-x.^2-y.^2), 1/4 * pi * (erf(5/6) + erf(8/9))^2}
};

for func_index = 1:length(test_functions)
    F = test_functions{func_index}{1};
    F_exact = test_functions{func_index}{2};
    % Set the limits of integration
    a = -8/9; b = 5/6; c = -8/9; d = 5/6;
    %F_exact = integral2(F, a, b, c, d);
    
    % Define the second partial derivatives for the function
    Fppx = @(x, y) -sin(x) .* cos(y);
    Fppy = @(x, y) -cos(x) .* sin(y);
    
    % Vectors of n and m for grid refinements
    n_values = [10, 20, 40, 80, 160, 320, 640];
    m_values = n_values; % Same refinement for both directions

    % Initialize array to store errors
    errors = zeros(size(n_values));
    fprintf('Testing function #%d\n', func_index);
    fprintf(' n\t m\t\t Error\t\t\t Rate\n');
    fprintf('-------------------------------------------\n');
    % Loop over different grid refinements
    for i = 1:length(n_values)
        n = n_values(i);
        m = m_values(i);
        
        [St, ~, ~, ~, ~, ~, ~] = doubletrap(F, {Fppx, Fppy}, n, m, a, b, c, d);
            
        % Absolute error
        error = abs(F_exact - St);
        errors(i) = error;
    
        % Display the results
        if i == 1
            fprintf('%2d\t %2d\t    %1.4e\t\t   -\n', n, m, error);
        else
            rate = -log2(errors(i)/errors(i-1));
            fprintf('%2d\t %2d     %1.4e\t     %1.2f\n', n, m, error, rate);
        end

    end
    fprintf('\n');
    lineCount = lineCount + 10;
    pauseEveryNLines(lineCount, nlines)

end
end % function