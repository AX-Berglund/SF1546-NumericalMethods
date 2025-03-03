function pendelAnimering(t, phi, L)
    % Skapar en animation av pendeln baserat på beräknad vinkel phi över tid.
    
    figure;
    for i = 1:length(t)
        x = L * sin(phi(i));  % X-koordinat av pendeln
        y = -L * cos(phi(i)); % Y-koordinat av pendeln

        plot([0, x], [0, y], 'r-o', 'MarkerFaceColor', 'r', 'LineWidth', 2);
        axis equal;
        xlim([-L, L]);
        ylim([-L, L]);
        title(sprintf('Tid: %.2f s', t(i)));
        grid on;
        pause(0.05);
    end
end
