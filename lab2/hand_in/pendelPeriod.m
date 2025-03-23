function period = pendelPeriod(t, phi)
    % Bestämmer pendelns svängningstid genom att identifiera nollgenomgångar med interpolation.

    % Hitta nollgenomgångar för vinkelhastigheten
    zero_crossings = [];
    for i = 2:length(phi)
        if phi(i) * phi(i-1) < 0  % Teckenbyte indikerar nollgenomgång
            zero_crossings = [zero_crossings; i-1, i];
        end
    end

    if length(zero_crossings) < 2
        warning('För få nollgenomgångar för att bestämma period.');
        period = NaN;
        return;
    end

    % Interpolera för att hitta mer exakta nollgenomgångar
    t_crossings = [];
    for j = 1:size(zero_crossings, 1)
        idx1 = zero_crossings(j, 1);
        idx2 = zero_crossings(j, 2);
        % Interpolera nollgenomgång mellan t(idx1) och t(idx2)
        t_val = [t(idx1), t(idx2)];
        phi_val = [phi(idx1), phi(idx2)];
        phi_interpol = @(q) interp1(t_val, phi_val, q, 'spline');
        t_zero = fzero(phi_interpol, mean(t_val));
        t_crossings = [t_crossings; t_zero];
    end

    if length(t_crossings) < 2
        warning('Misslyckades med att hitta tillräckligt många nollgenomgångar.');
        period = NaN;
        return;
    end

    % Beräkna perioden baserat på interpolerade nollgenomgångar
    period = 2 * mean(diff(t_crossings)); % Dubbel period eftersom en svängning omfattar två nollgenomgångar
end
