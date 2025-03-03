% Skatta maximal temperatur

clc; clear; close all;

% Parametrar
L = 3.6;    % Stavens längd
N = 100;    % Antal delintervall
T0 = 310;   % Temperatur vid x = 0
TL = 450;   % Temperatur vid x = L

% Lös temperaturfördelningen
[x, T] = tempEq(L, N, T0, TL);

% Hitta maximal temperatur
[max_T, idx] = max(T);

% Utskrift av resultat
fprintf('Maximal temperatur: %.2f K vid x = %.2f m\n', max_T, x(idx));
