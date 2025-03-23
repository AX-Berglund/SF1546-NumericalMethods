function [root, corrections] = SekantMetod(f, x0, x1, tol)
    % SekantMetod: Finner en rot med sekantmetoden
    %
    % In:
    %   f   - Funktion f(x)    
    %   x0  - Första gissning på rot
    %   x1  - Andra gissning på rot
    %   tol - Tolerans för fel (default 1e-8)
    %
    % Ut:
    %   root        - Beräknad rot
    %   corrections - Lista med korrektionssteg

    if nargin < 4
        tol = 1e-8; % Default tolerans
    end
    
    % Initierar variabler
    f0 = f(x0);
    f1 = f(x1);
    t_prev = 0.1;
    t_prev_prev = 0.1;

    corrections = [];  % Lista för korrektionssteg
    iter = 0;

    % Snygg tabellutskrift
    fprintf('%s\n', repmat('-', 1, 90));
    fprintf(" Iter |      x1      |    f(x1)     | Correction t |  Conv. K     |  Proportions  |\n");
    fprintf('%s\n', repmat('-', 1, 90));

    while abs(x1 - x0) > tol
        f1 = f(x1); % Beräkna funktionsvärde

        % Undvik division med noll
        if abs(f1 - f0) < eps
            warning('Sekantmetoden misslyckades: f(x1) - f(x0) ≈ 0.');
            root = NaN;
            return;
        end

        % Sekantmetodens ekvation
        t_n = f1 * (x1 - x0) / (f1 - f0);
        corrections = [corrections, t_n];

        % Beräkna förhållandet och konvergenskonstanten K
        prop = t_n / t_prev;
        K = t_n / (t_prev * t_prev_prev);

        % Skriva ut iterationens resultat
        fprintf('%5d | %12.5e | %12.5e | %12.5e | %12.5e | %12.5e |\n', ...
                iter, x1, f1, t_n, K, prop);

        % Uppdatera för nästa iteration
        x0 = x1;
        f0 = f1;
        t_prev_prev = t_prev;
        t_prev = t_n;
        x1 = x1 - t_n; % Nästa approximation av roten
        iter = iter + 1;
    end

    root = x1;
    relative_error = abs(t_n / root);

    fprintf('Rot funnen vid x = %.10f ± %.10e\n%s\n', root, relative_error, repmat('-', 1, 90));
end
