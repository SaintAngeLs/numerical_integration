function test_doubletrap()
% Project 1, zadanie 18
% Andrii Voznesenskyi, 323538
%

% Define a list of test functions, their string representations, 
% their expected integral values, and their second derivatives
functions = {
    {@(x, y) x.^2 + y.^2, 'x^2 + y^2', 32/3,  {@(x,y) 2, @(x,y) 2} };
    {@(x, y) x.*y, 'x*y', 4, {@(x,y) 0, @(x,y) 0}};
    {@(x, y) sin(x) .* cos(y), 'sin(x) * cos(y)', 1.287698674,  {@(x,y) -sin(x), @(x,y) -cos(y)} }
    {@(x, y) exp(-x.^2-y.^2), 'exp(-x^2-y^2)', 0.7780651264, {@(x,y) exp(-x.^2-y.^2).*(4*x.^2-2), @(x,y) exp(-x.^2-y.^2).*(4*y.^2-2)} };
    {@(x, y) x.*x , "x^2", 16/3,  {@(x,y) 2, @(x,y) 0}};
};

% Intervals for the integrals
a = 0; b = 2;
c = 0; d = 2;

% Counter dla wyświetlania
    line_count = 0;

    % Print the description in Polish
    description = ['Funkcja test_doubletrap testuje człkowanie numeryczne przez zastosowanie złożonej \n metody trapezów dla różnych wartości n i m - \n' ...
                   'podziałów predziałów całkowania względem każdej zmiennej przez porównanie błędów \n wyników i warotości analitych. \n' ...
                   'Wyniki są prezentowane w formie tabeli, która zawiera wartość oczekiwaną,\n' ...
                   'wartość rzeczywistą, błąd względny oraz czas obliczeń. Użytkownik musi nacisnąć\n' ...
                   'klawisz Enter co 20 linii, aby kontynuować wyświetlanie wyników.\n\n'];
    fprintf(description);
    line_count = line_count + 7;
    pauseEveryNLines(line_count, 15);

    for k = 1:size(functions, 1)
        F = functions{k}{1};
        funcStr = functions{k}{2};
        expected = functions{k}{3};
        Fpp_x = functions{k}{4}{1};
        Fpp_y = functions{k}{4}{2};
        Fpp = functions{k}{4};
        

        header = sprintf('Function: %s\n', funcStr);
        fprintf(header);
        line_count = line_count + 1;

        tableHeader = ' n     m    Expected   Actual    Rel Error   Error Est   Comp Time   Num Eval   Max F    Min F   Grid Size\n';
        fprintf(tableHeader);
        line_count = line_count + 1;

        separator = '-----------------------------------------------------------------------------------\n';
        fprintf(separator);
        line_count = line_count + 1;

        for n = [1, 5, 10, 20, 30, 40, 50, 80, 100, 200, 500, 1000]
            for m = [1, 5, 10, 20, 30, 40, 50, 80, 100, 200, 500, 1000]
                
                [actual, error_estimate, computation_time, num_evaluations, max_f, min_f, grid_size] = doubletrap(F, Fpp, n, m, a, b, c, d);
                

                absolute_error = abs(expected - actual);
                relative_error = absolute_error / abs(expected);

                [X, Y] = meshgrid(a:0.01:b, c:0.01:d);
                fxx_values = Fpp_x(X, Y);
                fyy_values = Fpp_y(X, Y);
                theoretical_error = abs(-(b-a)^3/(12*n^2)*max(fxx_values(:)) - (d-c)^3/(12*m^2)*max(fyy_values(:)));

                 fprintf('%-6d %-6d %-10.4f %-10.4f %-12.8f %-8.8f %-10.4f %-10d  %-10.4f %-10.4f %-10s\n', ...
                n, m, expected, actual, relative_error, theoretical_error, computation_time, num_evaluations, max_f, min_f, mat2str(grid_size));
            
                line_count = line_count + 1;
                pauseEveryNLines(line_count, 15);
            end
        end
        fprintf('\n'); % newline between functions
        line_count = line_count + 1;
    end
end
