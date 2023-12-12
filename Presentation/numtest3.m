function numtest3()
% Project 1, zadanie 18
% Andrii Voznesenskyi, 323538
%

nlines = 10;
lineCount = 0;
format_and_display_text('description_numtest3.txt', 74);

lineCount = lineCount + 10;
pauseEveryNLines(lineCount, nlines)

funcs = {
    {@(x, y) x.^2 + y.^2, "x^2 + y^2", pi/2, {@(x,y) 2, @(x,y) 2}};
    {@(x, y) x.*y, "x*y", 0, {@(x,y) 0, @(x,y) 0}};
    {@(x, y) exp(-x.^2-y.^2), "e^{-x^2 - y^2}", pi*(1-exp(-1)), {@(x,y) exp(-x.^2-y.^2).*(4*x.^2-2), @(x,y) exp(-x.^2-y.^2).*(4*y.^2-2)}};
    {@(x, y) sqrt(x.^2 + y.^2), "sqrt(x^2 + y^2)", 2*pi/3, 0, 0} 
    {@(x, y) x.^4.*y.^2, " x^4 * y^2", pi/64, 0, 0}
    {@(x, y) exp(x.^2 + y.^2), "exp(x^2 + y^2)", pi*(exp(1) - 1), 0, 0}
};

R = 1; % Radius of the unit circle

% Iterate over functions
for k = 1:length(funcs)
    f = funcs{k}{1};
    fName = funcs{k}{2};
    exactVal = funcs{k}{3};
    fpp = funcs{k}{4}; % Second derivatives
    
    n_values = 100:10:1000;
    errors_1 = zeros(length(n_values), 1);
    errors_2 = zeros(length(n_values), 1);

    % Set up the figure for animation
    figure;
    h = animatedline('Marker','o','Color','b');
    h2 = animatedline('Marker','*','Color','r');
    xlabel('n, m values');
    ylabel('Absolute error');
    title(['Error plot for function: ', fName]);
    legend('T_1', 'T_2');
    grid on;
    set(gca, 'XScale', 'log', 'YScale', 'log'); % Set axes to log scale

    % Calculate, store, and animate errors
    for i = 1:length(n_values)
        n = n_values(i);
        m = n_values(i); % Assuming square grid for simplicity

        [St1_1, ~] = P1Z18_AVO_combined(f, [], n, m, R, 'transform', 1);
        [St1_2, ~] = P1Z18_AVO_combined(f, [], n, m, R, 'transform', 2);

        errors_1(i) = abs(exactVal - St1_1);
        errors_2(i) = abs(exactVal - St1_2);

        % Update the animated lines
        addpoints(h, n, errors_1(i));
        addpoints(h2, n, errors_2(i));
        drawnow; % Update the plot

        % Optional pause for better visualization
        pause(0.1);
    end
end
end
