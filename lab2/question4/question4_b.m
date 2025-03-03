clc; clear; close all;

% Parametrar
L = 3.6;    % Stavens längd
N = 100;    % Antal delintervall för högre noggrannhet
T0 = 310;   % Temperatur vid x = 0
TL = 450;   % Temperatur vid x = L

% Lös temperaturfördelningen
[x, T] = tempEq(L, N, T0, TL);

% Plotta resultatet
figure;
plot(x, T, 'b', 'LineWidth', 1.5);
xlabel('x (m)'); ylabel('Temperatur (K)');
title('Temperaturfördelning i staven');
xlim([0.1, 3.5])
grid on;
