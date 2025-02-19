function [root, iter] = sekantmetod(f, x0, x1, tol, maxIter)
    % f       : Funktion
    % x0, x1  : Startvärden för sekantmetoden
    % tol     : Tolerans för konvergens
    % maxIter : Max antal iterationer
    
    % Startvärden
    iter = 0;
    f0 = f(x0);
    f1 = f(x1);
    
    % Iterera sekantmetoden
    while abs(x1 - x0) > tol && iter < maxIter
        % Beräkna nästa värde
        x2 = x1 - f1 * (x1 - x0) / (f1 - f0);
        
        % Uppdatera värden
        x0 = x1;
        x1 = x2;
        f0 = f1;
        f1 = f(x1);
        
        iter = iter + 1;
    end
    
    % Returnera roten och antal iterationer
    root = x1;
end
