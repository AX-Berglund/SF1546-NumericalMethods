function period = pendelPeriod(t, phi)
    % Bestämmer pendelns svängningstid genom att identifiera nollgenomgångar.

    % Hitta nollgenomgångar
    crossings = find(diff(sign(phi)) ~= 0);
    if length(crossings) < 2
        warning('För få nollgenomgångar för att bestämma period.');
        period = NaN;
        return;
    end

    % Interpolera för att få exakta nollpunkter
    t_crossings = t(crossings);
    period = 2 * mean(diff(t_crossings)); % Dubbel period för hela svängen
end
