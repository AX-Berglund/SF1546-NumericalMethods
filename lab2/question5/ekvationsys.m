function uprim = ekvationsys(x, u)
    % Differentialekvationssystem för temperatur i en cylinder
    % u(1) = T(x) (Temperatur)
    % u(2) = T'(x) (Derivata av temperaturen)

    % Materialparametrar och värmeutveckling
    k = @(r) 3 + r / 7;  % Värmeledningskoefficient
    L = 3.6;
    Q = @(r) 280 * exp(-(r - L/2)^2);  % Värmekälla

    % System av första ordningens differentialekvationer
    uprim = zeros(2,1);
    uprim(1) = u(2);
    uprim(2) = -Q(x) / k(x) - (1 / (7 * k(x))) * u(2);
end
