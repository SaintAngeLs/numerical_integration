function test3()

    lineCount = 0;
    nlines = 10;
    format_and_display_text('description_test3.txt', 74);
    lineCount = lineCount + 10;
    pauseEveryNLines(lineCount, nlines)
    num_points = 100000;
    
    % Generate random points within a unit square [-1, 1] x [-1, 1]
    u = 2 * (rand(num_points, 1) - 0.5); % Random x-coordinate in [-1,1)
    v = 2 * (rand(num_points, 1) - 0.5); % Random y-coordinate in [-1,1)

    % Apply the inverse transformation from square to circle
    [x1, y1] = transform_circle_to_square_1(u, v);
    
    % Plotting the square domain and the transformation to the circular domain
    figure; % Create a new figure window

    % Number of points to plot at a time
    batch_size = 1000;

    % Loop over points in batches
    for i = 1:batch_size:num_points
        % Update plots
        subplot(1, 2, 1);
        scatter(u(1:i), v(1:i), 1, '.', 'b');
        
        axis equal;
        title('Square Domain');
        xlabel('U');
        ylabel('V');
        xlim([-1, 1]);
        ylim([-1, 1]);

        subplot(1, 2, 2);
        scatter(x1(1:i), y1(1:i), 1, '.', 'b');
        axis equal;
        title('Transformation to Circular Domain');
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
