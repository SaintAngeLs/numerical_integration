function numtest1()
% Project 1, zadanie 18
% Andrii Voznesenskyi, 323538
%

nlines = 10;
lineCount = 0;
format_and_display_text('description_numtest1.txt', 74);

lineCount = lineCount + 10;
pauseEveryNLines(lineCount, nlines)

% Object of function F and its exact integral over the domain
test_functions = {
    {@(x, y) x.^2 + y.^2, pi/2 , 'f(x, y) = x^2 + y^2', '0'}
    {@(x, y) exp(-x.^2-y.^2), pi*(1-exp(-1)), 'f(x, y) = exp(-x^2 - y^2)', 'pi*(1 - exp(-1))'}
    {@(x, y) sqrt(x.^2 + y.^2), 2*pi/3, "f(x, y) = sqrt(x^2 + y^2)", "2*pi/3"} 
    {@(x, y) x.^4.*y.^2, pi/64, "f(x, y) = x^4 * y^2", "pi/64"}
    {@(x, y) exp(x.^2 + y.^2), pi*(exp(1) - 1), 'f(x, y) = exp(x^2 + y^2)', 'pi*(exp(1) - 1)'}
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
    errors = zeros(length(n_values), 2);
    blueline = '---------------------------------------------------------------------\n';
    fprintf(blueline);
    fprintf('Funkcja testowa: %s\n', F_str);
    fprintf('Dokładna wartość całki: %s\n', F_int_val);
    fprintf(blueline);
    fprintf(' n\t\t m\t\t Error 1\t\t Error 2\t\tRate 1\t\tRate 2\n');
    fprintf(blueline);
    for i = 1:length(n_values)
        n = n_values(i);
        m = m_values(i);
        
        [St1, ~, ~, ~, ~, ~, ~] = P1Z18_AVO_combined(F, [], n, m, 1, 'transform', 1);
        [St2, ~, ~, ~, ~, ~, ~] = P1Z18_AVO_combined(F, [], n, m, 1, 'transform', 2);
        
        % Absolute error
        error1 = abs(F_exact - St1);
        error2 = abs(F_exact - St2);
        
        errors(i,:) = [error1, error2];
    
        % Display the results
         if i == 1
            fprintf('%4d   %4d     %1.4e     %1.4e     -           -\n', n, m, error1, error2);
        else
            % Calculate the rate of convergence
            rate1 = log2(errors(i-1,1) / errors(i,1));
            rate2 = log2(errors(i-1,2) / errors(i,2));
            fprintf('%4d   %4d     %1.4e     %1.4e     %1.2f       %1.2f\n', n, m, error1, error2, rate1, rate2);
        end
    end
    lineCount = lineCount + 10;
    pauseEveryNLines(lineCount, nlines)
end
end % function