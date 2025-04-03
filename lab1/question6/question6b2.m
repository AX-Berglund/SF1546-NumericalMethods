% Definiera integranden
f = @(x) (1 - exp(- (x / 5).^3)) ./ (5 * x.^3);

% Funktion för att beräkna svansen från B till oändligheten
svansIntegral = @(B) integral(f, B, Inf);

% Hitta minsta B där svansintegralen blir mindre än 1e-9
B = 1; % Startvärde
while svansIntegral(B) > 1e-8
    B = B + 1; % Öka B tills villkoret uppfylls
end

% Visa resultatet
fprintf('Valt värde för B: %.2f\n', B);

f1 = @(x) (-(1 - exp(- ((x/5).^3)))) ./ (10 * x.^2);
f2 = @(x) (3*exp(- ((x/5).^3))) ./125;


% Kvadratisk konvergenskontroll
function T = TrapetsRegel(f, a, b, h)
    x = a:h:b; % Skapa delpunkter
    y = f(x); % Beräkna funktionsvärden
    T = h * (sum(y) - 0.5 * (y(1) + y(end))); % Trapetsregeln
end

a = 10e-4;
b = 1000000000;
h0 = 1; % Initial steglängd
max_iter = 10;
%Tr = TrapetsRegel(f1, )

for i = 1:max_iter
    % Halvera h och dubblera n för varje iteration
    h = h0 * 0.5^(i-1);
    n = (b - a) / h;

    A = 10e-4;
    B = 3163;
    F = f1(B) - f2(10e-4) + TrapetsRegel(f2, A, B, h)
end