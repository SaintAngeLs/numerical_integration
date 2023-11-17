function pauseEveryNLines(lineCount, nlines)
% Project 1, zadanie __
% Andrii Voznesenskyi, 323538
%


if mod(lineCount, nlines) == 0
    input('Press Enter to continue... \n', 's');
end
end % function 
