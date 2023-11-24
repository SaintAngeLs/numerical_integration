function test2()
    % Project 1, zadanie 18
    % Andrii Voznesenskyi, 323538
    %
    
    % Definicja funkcji i jej pochodnych drugiego rzędu
    F = @(x, y) y.^2;
    fxx = 0;
    fyy = 2;
    Fpp = {@(x, y) fxx, @(x, y) fyy};

    % Oczekiwana wartość całki
    expected = 1/3;
    % Przedziały całkowania
    a = 0; b = 1;
    c = 0; d = 1;
    % Wartości n i m do przetestowania
    n_values = [1, 53, 80, 100, 255, 500, 632, 933, 1000, 1225];
    m_values = [1, 53, 80, 100, 255, 500, 632, 933, 1000, 1225];
    test_index = 0;
    lineCount = 0;
    nlines = 10;

    format_and_display_text('description_test2.txt', 74);

    lineCount = lineCount + 10;
    pauseEveryNLines(lineCount, nlines)

    fprintf('Function: x^2\n');
    fprintf(' #   n      m      Expected    Actual      Relative Error   Theoretical Error  Time(s)\n');
    fprintf('-----------------------------------------------------------------------------------\n');

    for n = n_values
        for m = m_values
            test_index = test_index + 1;
            %tic;
            [actual, error_estimate, computation_time, num_evaluations, max_f, min_f, grid_size] = doubletrap(F, Fpp, n, m, a, b, c, d);
            %time_elapsed = toc;

            relative_error = abs(expected - actual);
            %relative_error = absolute_error / abs(expected);
            
            %theoretical_error = abs((b-a)^3/(12*n^2)*fxx + (d-c)^3/(12*m^2)*fyy);


            fprintf('%-2d.  %-5d  %-5d  %-12.5f%-12.5f%-18.10f%-20.10f%-10.4f\n', ...
                test_index, n, m, expected, actual, relative_error, error_estimate, computation_time);
        end
        lineCount = lineCount + 10;
    pauseEveryNLines(lineCount, nlines)
    end
    fprintf('\n'); % newline between functions
    
end

% skad wiemy ze calkujemy zlozony wzor trapezow