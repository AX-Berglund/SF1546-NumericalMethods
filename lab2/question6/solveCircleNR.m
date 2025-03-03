function [X, Y, R] = solveCircleNR(p1, p2, p3, tol, max_iter)
    % Newton-Raphson för att lösa cirkelns ekvationssystem
    % p1, p2, p3 - Givna punkter i form av [x, y]
    % tol - Tolerans för konvergens
    % max_iter - Max antal iterationer

    % Startgissningar (ungefärligt medelvärde av punkterna)
    X = mean([p1(1), p2(1), p3(1)]);
    Y = mean([p1(2), p2(2), p3(2)]);
    R = mean(vecnorm([p1; p2; p3] - [X, Y], 2, 2));

    for iter = 1:max_iter
        % Funktionerna F1, F2, F3 (cirkelsystem)
        F = [
            (p1(1) - X)^2 + (p1(2) - Y)^2 - R^2;
            (p2(1) - X)^2 + (p2(2) - Y)^2 - R^2;
            (p3(1) - X)^2 + (p3(2) - Y)^2 - R^2;
        ];

        % Jacobimatris
        J = [
            -2 * (p1(1) - X), -2 * (p1(2) - Y), -2 * R;
            -2 * (p2(1) - X), -2 * (p2(2) - Y), -2 * R;
            -2 * (p3(1) - X), -2 * (p3(2) - Y), -2 * R;
        ];

        % Newton-Raphson-steget
        delta = -J \ F;

        % Uppdatera X, Y, R
        X = X + delta(1);
        Y = Y + delta(2);
        R = R + delta(3);

        % Konvergenskontroll
        if norm(delta) < tol
            return;
        end
    end

    error('Newton-Raphson konvergerade ej inom %d iterationer.', max_iter);
end
