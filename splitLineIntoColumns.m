function formattedLine = splitLineIntoColumns(line, maxColumns)
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