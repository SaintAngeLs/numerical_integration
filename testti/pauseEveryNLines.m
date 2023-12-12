function pauseEveryNLines(lineCount, nlines)
% Project 1, zadanie __
% Andrii Voznesenskyi, 323538
%
% Funkcja pomocnicza dpowiadająca za funkcionalność poprawnego wyświelania
% n-linijek nlines względem parametru lineCount

if mod(lineCount, nlines) == 0
    input('...\nPress Enter to continue... \n', 's');
end
end % function 
