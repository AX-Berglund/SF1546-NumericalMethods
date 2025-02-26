% Uppgift 6e: Numerisk integration med trapetsregeln och Richardson-extrapolering
clear; clc;

% Läs in B från tidigare resultat
B = 10002.01000000;

% Läs in den analytiska delen av integralen från fråga 6c
I_0 = 0.000000160; % Integralen nära x = 0

% Definiera integranden f(x)
f_integrand = @(x) (1 - exp(-(x/5).^3)) ./ (5*x.^3);

% Kvadratisk konvergenskontroll
function T = TrapetsRegel(f, a, b, h)
    x = a:h:b; % Skapa delpunkter
    y = f(x); % Beräkna funktionsvärden
    T = h * (sum(y) - 0.5 * (y(1) + y(end))); % Trapetsregeln
end

% Parameterinställningar
n_0 = 10000; % Initialt antal intervall för trapetsregeln
h0 = 1; % Initial steglängd
max_iter = 10; % Antal iterationer i extrapoleringen

fprintf('\n\n Uppgift 6e - Numerisk integration med Richardson-extrapolering: \n\n');
fprintf('%s\n', repmat('-', 1, 89));
fprintf("     n       |     h    |       T(h)       |       Δ      |   Konv ord.  |   E_trunk    |\n");
fprintf('%s\n', repmat('-', 1, 89));

% Skapa och öppna textfil för att spara resultat
fileID = fopen('question6e_results.txt', 'w');
fprintf(fileID, 'Numerisk integration med trapetsregeln och Richardson-extrapolering\n\n');
fprintf(fileID, '%s\n', repmat('-', 1, 89));
fprintf(fileID, "     n       |     h    |       T(h)       |       Δ      |   Konv ord.  |   E_trunk    |\n");
fprintf(fileID, '%s\n', repmat('-', 1, 89));

% Initiera variabler för extrapolering
delta = nan;
T_prev = 0;
konv_ord = nan;
e_trunk = nan;
T_pre_prev = 0;
delta_prev = nan;

% Definiera gränser för integration
a = 1e-4; % Nedre gräns för trapetsintegrationen
b = B; % Övre gräns

% Funktionsapproximation nära x = 0
f_0_fun = @(x) 1/5^4; % Konstant approximation

format long;

% Iterativ numerisk integration med trapetsregeln och Richardson-extrapolering
for i = 1:max_iter
    % Halvera h och dubblera n för varje iteration
    h = h0 * 0.5^(i-1);
    n = (b - a) / h;
    
    % Använd trapetsregeln för båda delarna av integralen
    T_0 = TrapetsRegel(f_0_fun, 0, a, h); % Trapetsintegral nära x = 0
    T_1 = TrapetsRegel(f_integrand, a, b, h); % Trapetsintegral i huvudintervallet
    T = T_0 + T_1; % Totala integralen

    % Beräkna trunkeringsfel och konvergensordning
    if i > 1
        delta = T - T_prev;
        e_trunk = abs(T - T_prev);
    end
    if i > 2
        konv_ord = abs(T_pre_prev - T_prev) / abs(T_prev - T);
    end

    % Skriv ut resultatet i konsolen
    fprintf('%10d | %8.4f | %16.10e | %12.2e | %12f | %12e |\n', n, h, T, delta, konv_ord, e_trunk);
    
    % Skriv resultatet till textfil
    fprintf(fileID, '%10d | %8.4f | %16.10e | %12.2e | %12f | %12e |\n', n, h, T, delta, konv_ord, e_trunk);
    
    % Uppdatera variabler för nästa iteration
    delta_prev = delta;
    T_pre_prev = T_prev;
    T_prev = T;
end

fprintf('\nTotala integralen beräknas till T = %.10f\n', T);
fprintf(fileID, '\nTotala integralen beräknas till T = %.15f\n', T);

% Stäng textfil
fclose(fileID);

fprintf('Resultatet har sparats i question6e_results.txt\n');