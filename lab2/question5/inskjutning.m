function fel = inskjutning(s, a, L, T0, TL)
    % Funktion för inskjutningsmetoden
    % s = gissning av T'(0)
    % Returnerar felet vid x = L (dvs. skillnaden mellan beräknad och given TL)

    % Lös ODE-systemet med ode45 för den aktuella gissningen av s
    [~, Y] = ode45(@ekvationsys, [a, L], [T0, s]);

    % Beräkna felet, dvs. skillnaden mellan beräknad temperatur vid x = L och TL
    fel = Y(end, 1) - TL;
end
