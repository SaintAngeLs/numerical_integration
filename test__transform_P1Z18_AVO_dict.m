function test__transform_P1Z18_AVO_dict()
    % Project 1, zadanie 18
    % Andrii Voznesenskyi, 323538
    %

    funcs = {
        {@(x, y) x.^2 + y.^2, "x^2 + y^2", pi/2, {@(x,y) 2, @(x,y) 2}};
        {@(x, y) x.*y, "x*y", 0, {@(x,y) 0, @(x,y) 0}};
        {@(x, y) exp(-x.^2-y.^2), "e^{-x^2 - y^2}", pi*(1-exp(-1)), {@(x,y) exp(-x.^2-y.^2).*(4*x.^2-2), @(x,y) exp(-x.^2-y.^2).*(4*y.^2-2)}};
    };

    R = 1; % Radius of the unit circle
    lineCounter = 0;


    fprintf("This function tests the numerical integration over a unit circle with transformation to square \n for various functions. \n")
    fprintf("It compares the approximate values obtained from the numerical method against known \nexact values, \n")
    fprintf("outputs the absolute error, and measures the computation time for each test case. \n")

    % Iterate over functions
    for k = 1:length(funcs)
        f = funcs{k}{1};
        fName = funcs{k}{2};
        exactVal = funcs{k}{3};
        fpp = funcs{k}{4}; % Second derivatives
        
        fprintf('Function: %s\n', fName);
        fprintf(' n     m      Approx. Value     Exact Value   Absolute Error Theor. Error   Time (sec)\n');
        fprintf('--------------------------------------------------------------------------------------\n');
        lineCounter = lineCounter + 3;
        
        
        for n = [400, 800, 10000]
            for m = [400, 800, 10000]
                [St1, error_estimate, elapsedTime, ~, ~, ~, ~] = transform_P1Z18_AVO_dict(f, fpp, n, m, R);

                
                absErr = abs(exactVal - St1)/abs(exactVal);
                fprintf('%-4d     %-4d     %-5f       %-5f        %-5f     %-5f     %-5f\n', n, m, St1, exactVal, absErr, error_estimate, elapsedTime);
                
                lineCounter = lineCounter + 1;
                pauseEveryNLines(lineCounter, 15)
            end
        end
        
        fprintf('\n');
    end
end
