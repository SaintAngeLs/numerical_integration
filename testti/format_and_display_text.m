function format_and_display_text(filename, maxColumns)
% Project 1, task 18
% Andrii Voznesenskyi, 323538
%
% Brief Description:
% This function opens a text file, reads its contents line by line, formats 
% each line to a specified maximum column width, and displays the formatted 
% text in the MATLAB command window. The output pauses every 15 lines to 
% allow the user to read the content before proceeding.

% Input:
% filename    - A string representing the name of the file to be opened and 
%               read.
% maxColumns  - An integer specifying the maximum number of columns to which 
%               the text should be formatted. This controls the width of the 
%               text display in the command window.
% Output:
% There is no direct output argument from this function as it prints 
% directly to the MATLAB command window. However, the function will display 
% the formatted text from the specified file and will pause every 15 lines, 
% requiring the user to press Enter to continue.

% Open the text file for reading
fileID = fopen(filename, 'r');

% Check if the file was opened successfully
if fileID == -1
    error('File could not be opened.');
end

% Initialize line counter
lineCount = 0;

% Read lines from the file, format them, and display with pause 
% every 15 lines
while ~feof(fileID)
    % Read a line from the file
    line = fgetl(fileID); 
     % Check if line is not the end of file
    if ischar(line)
        % Format the line
        formattedLine = splitLineIntoColumns(line, maxColumns); 
        % Print the formatted line
        fprintf('%s\n', formattedLine);
         % Increment the line counter
        lineCount = lineCount + 1;

        % Pause every 15 lines
        if mod(lineCount, 2) == 0
            input('...\nPress Enter to continue...\n', 's');
        end
    end
end

% Close the file
fclose(fileID);
end % function
