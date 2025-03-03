clc; clear; close all;

% Parametrar
L = 3.6;      % Stavens längd
T0 = 310;     % Temperatur vid x = 0
TL = 450;     % Temperatur vid x = L
target_x = 2.96;  % Punkten där vi vill bestämma temperaturen
tol = 1e-4;   % Tolerans för konvergens
N = 10;       % Startvärde för antal delintervall
max_iter = 100; % Max antal iterationer för säkerhets skull

prev_T_interp = NaN;  % Tidigare uppskattning av temperaturen vid target_x

for iter = 1:max_iter
    % Lös temperaturfördelningen för nuvarande N
    [x, T] = tempEq(L, N, T0, TL);
    
    % Interpolera temperaturen vid target_x
    T_interp = interp1(x, T, target_x, 'spline');

    % Kontrollera om felet är tillräckligt litet
    if ~isnan(prev_T_interp) && abs(T_interp - prev_T_interp) < tol
        fprintf('Konvergens uppnådd vid N = %d\n', N);
        fprintf('Temperatur vid x = %.2f m: %.5f K\n', target_x, T_interp);
        break;
    end

    % Uppdatera och öka N
    prev_T_interp = T_interp;
    N = N + 5;  % Ökar med 5 för att snabba upp processen
end

% Om loopen nådde max_iter utan att konvergera
if iter == max_iter
    warning('Konvergens ej uppnådd inom %d iterationer.', max_iter);
end
