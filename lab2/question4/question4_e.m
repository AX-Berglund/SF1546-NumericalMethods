% Förbättrad skattning av max temperatur

clc; clear; close all;

% Parametrar
L = 3.6;    % Stavens längd
N = 100;    % Antal delintervall
T0 = 310;   % Temperatur vid x = 0
TL = 450;   % Temperatur vid x = L

% Lös temperaturfördelningen
[x, T] = tempEq(L, N, T0, TL);

% Hitta grov maxpunkt
[max_T, idx] = max(T);

% Finare interpolation av temperaturkurvan
x_fine = linspace(min(x), max(x), 1000); % Skapar fler x-värden
T_fine = interp1(x, T, x_fine, 'spline'); % Använder 'spline' interpolation

% Hitta maxvärde i den interpolerade kurvan
[max_T_fine, idx_fine] = max(T_fine);

% Utskrift av förbättrat maxvärde
fprintf('Förbättrad max-temp: %.2f K vid x = %.2f m\n', max_T_fine, x_fine(idx_fine));
