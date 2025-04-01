% A_compute_height.m
% Uppgift a: Beräkna och plotta den maximala höjden raketen når

clear all; close all; clc;

%% Lägg till sökväg till funktionerna
addpath('functions');

%% Startparametrar
v_yx = 21;               % Initial hastighet (m/s)
teta = deg2rad(81);      % Startvinkel (grader -> radianer)
h = 0.01;                % Steglängd för Runge-Kutta
F = 1;                   % Kraft under brinntiden
t1 = 0; t2 = 0.08;       % Brinntidens start och slut
tend = 4;                % Total simuleringstid

%% Beräkna rörelsen med hög noggrannhet
[~, ~, z3, ~, ~, ~, ~] = Rocketman(t1, t2, tend, h, F, v_yx, 1);

%% Extrahera positioner
x_pos = z3(1,:);
y_pos = z3(2,:);

%% Hitta maximal höjd och dess index
[y_max, idx_max] = max(y_pos);
x_max = x_pos(idx_max);

%% Skriv ut resultatet
fprintf('Maximala höjden raketen når är %.4f meter.\n', y_max);
fprintf('Det sker vid x = %.4f meter.\n', x_max);

%% Plottra raketens bana

figure;
plot(x_pos, y_pos, 'r', 'LineWidth', 1.2); 
hold on;
plot(z3(1,34), z3(2,34), '*-k');
plot(x_max, y_max, '*-k');
xlim([-1,10]); ylim([-5,18]);
yline(0,'-k');
xlabel('x-position (m)');
ylabel('y-position (m)');
title('Raketens bana i x-y planet');
grid on;
