function test7()
% Project 1, zadanie 18
% Andrii Voznesenskyi, 323538
%

format_and_display_text('description_test7.txt', 74);

nlines = 10;
lineCount = 0;

lineCount = lineCount + 10;
pauseEveryNLines(lineCount, nlines)

funcs = {
    {@(x, y) x.^2 + y.^2, "x^2 + y^2", pi/2, {@(x,y) 2, @(x,y) 2}};
    {@(x, y) x.*y, "x*y", 0, {@(x,y) 0, @(x,y) 0}};
    {@(x, y) exp(-x.^2-y.^2), "e^{-x^2 - y^2}", pi*(1-exp(-1)), {@(x,y) exp(-x.^2-y.^2).*(4*x.^2-2), @(x,y) exp(-x.^2-y.^2).*(4*y.^2-2)}};
};

R = 1; % Radius of the unit circle

% Iterate over functions
for k = 1:length(funcs)
    f = funcs{k}{1};
    fName = funcs{k}{2};
    exactVal = funcs{k}{3};
    fpp = funcs{k}{4}; % Second derivatives
    
    fprintf('Function: %s\n', fName);
    fprintf(' n   m      Approx. Value_1  Approx. Value_2  Exact Value  Absolute Error_1  Absolute Error_2  \n');
    fprintf('--------------------------------------------------------------------------------------\n');
    lineCount = lineCount + 3;
    
    
    for n = [400, 800, 10000]
        for m = [400, 800, 10000]
            [St1_1, ...
                ~, ~, ~, ~, ~, ~ ...
            ] = P1Z18_AVO_combined(f, [], n, m, R, 'transform', 1);
            [St1_2, ...
                ~, ~, ~, ~, ~, ~ ...
            ] = P1Z18_AVO_combined(f, [], n, m, R, 'transform', 2);
            
            absErr1 = abs(exactVal - St1_1);
            absErr2 = abs(exactVal - St1_2);
            fprintf('%-6d %-6d | %-12f | %-12f | %-13f | %-13f | %-13f\n', n, m, St1_1, St1_2, exactVal, absErr1, absErr2);
            
            lineCount = lineCount + 1;
            pauseEveryNLines(lineCount, nlines + 1)
        end
    end
    fprintf('\n');
    lineCount = lineCount + 10;
    pauseEveryNLines(lineCount, nlines)
end
end % function
