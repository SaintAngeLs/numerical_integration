function formattedLine = splitLineIntoColumns(line, maxColumns)
% Project 1, zadanie 18
% Andrii Voznesenskyi, 323538
%
% Brief Description:
% This function takes a single string of text and formats it into multiple
% lines, ensuring that each line does not exceed a specified maximum column width.
% If a word does not fit in the current line within the maximum column width,
% it is moved to the start of the next line.
% Input:
% line       - A string of text, potentially longer than the desired column width.
% maxColumns - An integer that defines the maximum number of characters allowed
%              in one line.
% Output:
% formattedLine - A string that has been formatted to fit within the specified
%                 column width. Each line within this string, except possibly the
%                 last one, will have a length less than or equal to maxColumns.

% Split the line into words
words = strsplit(line);

% Initialize variables
formattedLine = '';
currentLineLength = 0;

% Loop over each word and build lines with a maximum of 'maxColumns' 
% characters
for i = 1:length(words)
    word = words{i};
    if currentLineLength + length(word) + 1 <= maxColumns
        % If the word fits in the current line, add it
        formattedLine = [formattedLine, word, ' '];
        currentLineLength = currentLineLength + length(word) + 1;
    else
        % If the word doesn't fit, start a new line
        formattedLine = [formattedLine, newline, word, ' '];
        currentLineLength = length(word) + 1;
    end
end

% Trim any trailing whitespace
formattedLine = strtrim(formattedLine);
end