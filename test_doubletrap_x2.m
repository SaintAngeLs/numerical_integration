function test_doubletrap_x2()
    % Project 1, zadanie 18
    % Andrii Voznesenskyi, 323538
    %
    
    % Definicja funkcji i jej pochodnych drugiego rzędu
    F = @(x, y) x.^2;
    fxx = 2;
    fyy = 0;
    Fpp = {@(x, y) fxx, @(x, y) fyy};

    % Oczekiwana wartość całki
    expected = 26/3; % Wynik analitycznej całki funkcji x^2 od 0 do 2
    expected = 1/3;
    % Przedziały całkowania
%     a = -1; b = 2;
%     c = -8/9; d = 2;
    a = 0; b = 1;
    c = 0; d = 1;
    % Wartości n i m do przetestowania
    n_values = [1, 100, 500, 1000];
    m_values = [1, 100, 500, 1000];
    test_index = 0;

    fprintf('This test function performs numerical integration of x^2 over a square region using the double trapezoidal rule.\n');
    fprintf('It calculates the actual value of the integral for different numbers of subintervals (n and m),\n');
    fprintf('compares it with the expected analytical value, and computes both the relative and theoretical errors,\n');
    fprintf('along with the time taken for each computation.\n\n');

    fprintf('For the function x^2, the theoretical error of the trapezoidal rule can be estimated using its known second \n derivatives, which are constants (fxx = 2, fyy = 0).\n');
    fprintf('The theoretical error, based on the second derivatives (fxx = 2, fyy = 0), reflects the upper bound of the \n actual error, and should typically be larger than the actual error observed in practice.\n');
    fprintf('The theoretical error for the trapezoidal rule is proportional to the square of the step size h (hence h^2), \n where h is the length of the subinterval on the integration grid.\n');
    fprintf('The error is given by: ((b-a)^3 / (12*n^2)) * fxx for x^2, since fyy equals zero and does not contribute.\n');
    fprintf('The test function performs calculations for various values of n and m, records the actual numerical integral \n value, the relative error, the estimated theoretical error, and the computation time.\n');
    fprintf('The usage of multiple subdivisions (parameters n and m) indicates the application of the composite trapezoidal \n rule, characteristic for its ability to better approximate the area under the curve with an increasing \n number of subdivisions theoretically leading to a reduction in approximation error.\n');



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
            
            theoretical_error = abs((b-a)^3/(12*n^2)*fxx + (d-c)^3/(12*m^2)*fyy);


            fprintf('%-2d.  %-5d  %-5d  %-12.5f%-12.5f%-18.10f%-20.10f%-10.4f\n', ...
                test_index, n, m, expected, actual, relative_error, theoretical_error, computation_time);
        end
    end
    fprintf('\n'); % newline between functions
end

% skad wiemy ze calkujemy zlozony wzor trapezow