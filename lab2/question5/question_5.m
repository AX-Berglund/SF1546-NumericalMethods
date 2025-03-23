clear; clc; close all;

% Parametrar för problemet
a = 0;             % Startpunkt
L = 3.6;          % Längd på cylindern
T0 = 310;         % Randvillkor: Temperatur vid x=0
TL = 450;         % Randvillkor: Temperatur vid x=L
x_intr = 1.65;    % Punkt där temperaturen ska beräknas

% Numeriska inställningar för hög precision
options2 = odeset('RelTol', 1e-3);
options3 = odeset('RelTol', 1e-6);

% Första gissning av derivatan T'(0)
s_0 = 3;

% Hitta rätt startvärde för T'(0) med fzero och inskjutning
T_prim = fzero(@(s) inskjutning(s, a, L, T0, TL), s_0);

% Lös ODE-systemet med ode45 för tre olika noggrannhetsnivåer
[x, T] = ode45(@ekvationsys, [a, L], [T0, T_prim]);
[x2, T2] = ode45(@ekvationsys, [a, L], [T0, T_prim], options2);
[x3, T3] = ode45(@ekvationsys, [a, L], [T0, T_prim], options3);

% Interpolation för att beräkna temperaturen vid x = 1.65
T_value1 = interp1(x, T(:,1), x_intr, 'spline');
T_value2 = interp1(x2, T2(:,1), x_intr, 'spline');
T_value3 = interp1(x3, T3(:,1), x_intr, 'spline');

% Skriv ut resultaten
fprintf('Interpolerad temperatur vid x = %.2f:\n', x_intr);
fprintf('T(%.2f) med standard precision: %.7f\n', x_intr, T_value1);
fprintf('T(%.2f) med hög precision (RelTol=1e-3): %.7f\n', x_intr, T_value2);
fprintf('T(%.2f) med mycket hög precision (RelTol=1e-6): %.7f\n', x_intr, T_value3);



% Plotta resultaten
plot_solution(x, T, x2, T2, x3, T3);

