
function [root, last_diff] = sekantMetod(f, x0, x1, tol, max_iter)
    % Sekantmetoden för att hitta en rot till funktionen f.
    % f = funktionshandle för ekvation f(x) = 0
    % x0, x1 = startgissningar
    % tol = tolerans för fel
    % max_iter = max antal iterationer

    fprintf("\nIterationer av sekantmetoden:\n");
    fprintf("%-5s %-12s %-12s %-12s\n", "Iter", "x", "f(x)", "Diff");

    last_diff = NaN; % Initialize last difference

    for i = 1:max_iter
        fx0 = f(x0);
        fx1 = f(x1);

        % Undvik division med noll
        if abs(fx1 - fx0) < eps
            warning('Skillnaden mellan f(x0) och f(x1) är för liten. Avbryter.');
            break;
        end

        % Nästa approximation
        x_new = x1 - fx1 * (x1 - x0) / (fx1 - fx0);
        last_diff = abs(x_new - x1);

        % Skriv ut iterationens värden
        fprintf("%-5d %-12.6f %-12.6f %-12.6f\n", i, x_new, f(x_new), last_diff);

        % Kontrollera konvergens
        if abs(f(x_new)) < tol
            root = x_new;
            return;
        end

        % Uppdatera x0 och x1 för nästa iteration
        x0 = x1;
        x1 = x_new;
    end

    % Om max iterationer nås utan konvergens
    warning('Sekantmetoden konvergerade ej inom max antal iterationer.');
    root = x1;
end