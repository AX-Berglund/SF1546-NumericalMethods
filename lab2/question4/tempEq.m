function [x, T] = tempEq(L, N, T0, TL)
    % Numerisk lösning av randvärdesproblemet med finita differensmetoden
    % L  - Stavens längd
    % N  - Antal inre punkter för diskretisering
    % T0 - Temperatur vid x = 0
    % TL - Temperatur vid x = L

    h = L / (N + 1); % Steglängd
    x = linspace(0, L, N+2); % Skapa x-värden, inklusive randpunkter

    % Bygg matris A
    A = zeros(N, N); % Initiera matris
    for i = 1:N
        k_left = 3 + (x(i) / 7);  % Värmeledningsförmåga på vänster sida
        k_right = 3 + (x(i+2) / 7); % Värmeledningsförmåga på höger sida
        A(i, i) = - (k_left + k_right); % Huvuddiagonal
        if i > 1
            A(i, i-1) = k_left; % Undre diagonal
        end
        if i < N
            A(i, i+1) = k_right; % Övre diagonal
        end
    end
    A = A / h^2; % Normalisera med steglängden h

    % Skapa högerledsvektorn b
    b = zeros(N, 1);
    for i = 1:N
        b(i) = -280 * exp(-(x(i+1) - L/2)^2); % Term för värmeproduktion
    end

    % Inför randvillkor i vektorn b
    b(1) = b(1) - T0 / h^2;
    b(end) = b(end) - TL / h^2;

    % Lös det linjära systemet A*T_inner = b
    T_inner = A \ b;

    % Kombinera med randvärden för fullständig temperaturfördelning
    T = [T0; T_inner; TL];
end
