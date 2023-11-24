function test4()
    num_points = 100000;
    lineCount = 0;
    nlines = 10;

    format_and_display_text('description_test4.txt', 74);

    lineCount = lineCount + 10;
    pauseEveryNLines(lineCount, nlines)
    % Generate random points within a unit circle
    theta = 2 * pi * rand(num_points, 1); % Random angle
    r = sqrt(rand(num_points, 1)); % Random radius in [0,1), for uniform distribution
    u = r .* sin(theta); % Convert polar to Cartesian coordinates for u
    v = r .* cos(theta); % Convert polar to Cartesian coordinates for v

    % Apply the first transformation
    [x1, y1] = transform_circle_to_square3(u, v, 1);
    

    

    % Plotting the circular domain and the transformations
    figure; % Create a new figure window

    % Number of points to plot at a time
    batch_size = 1000;

    % Loop over points in batches
    for i = 1:batch_size:num_points
        % Update plots
        subplot(1, 2, 1);
        scatter(u(1:i), v(1:i), 1, '.');
        axis equal;
        title('Circular Domain');
        xlabel('U');
        ylabel('V');
        xlim([-1, 1]);
        ylim([-1, 1]);
    
        subplot(1, 2, 2);
        scatter(u(1:i), v(1:i), 1, '.', 'b'); % Original points in blue
        hold on; % Hold on to plot additional data on the same subplot
        scatter(x1(1:i), y1(1:i), 1, '.', 'r'); % Transformed points in red
        hold off; % Release the subplot for future plots
        axis equal;
        title('Transformation Comparison');
        xlabel('X');
        ylabel('Y');
        xlim([-1, 1]);
        ylim([-1, 1]);
        
        % Pause briefly to display the plot
        pause(0.01);
        
        % Break the loop if the figure is closed
        if ~ishandle(1)
            break;
        end
    end
end