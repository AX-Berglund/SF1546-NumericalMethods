function dydt = pendelODE(t, y, g, L)
    % Beskriver systemet av 1:a ordningens differentialekvationer för pendeln.
    % y(1) = phi (vinkel)
    % y(2) = omega (vinkelhastighet)
    
    dydt = zeros(2,1);
    dydt(1) = y(2);
    dydt(2) = - (g / L) * sin(y(1));
end
