function format_and_display_text(filename, maxColumns)
    % Open the text file for reading
    fileID = fopen(filename, 'r');
    
    % Check if the file was opened successfully
    if fileID == -1
        error('File could not be opened.');
    end
    
    % Initialize line counter
    lineCount = 0;
    
    % Read lines from the file, format them, and display with pause every 15 lines
    while ~feof(fileID)
        line = fgetl(fileID); % Read a line from the file
        if ischar(line) % Check if line is not the end of file
           formattedLine = splitLineIntoColumns(line, maxColumns); % Format the line
            fprintf('%s\n', formattedLine); % Print the formatted line
            lineCount = lineCount + 1; % Increment the line counter
            
            % Pause every 15 lines
            if mod(lineCount, 2) == 0
                input('...\nPress Enter to continue...\n', 's');
            end
        end
    end
    
    % Close the file
    fclose(fileID);
end
