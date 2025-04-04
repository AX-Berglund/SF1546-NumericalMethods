% B_compute_range.m
% Uppgift b: Bestäm hur långt raketen färdas (x-koordinat vid landning)

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

%% Beräkna rörelsen
[~, ~, z3, ~, ~, ~, ~] = Rocketman(t1, t2, tend, h, F, v_yx, 1);

%% Extrahera positioner
x_pos = z3(1,:);
y_pos = z3(2,:);


%% Använder egen find - Hitta första tillfälle där raketen nuddar marken (y ≤ 0)

idx_land = 0;
for i = 2:length(y_pos)
    if y_pos(i) <= 0 && y_pos(i-1) > 0
        idx_land = i;
        break;
    end
end

%% Interpolera mellan punkterna för att få mer exakt landningspunkt
% (enkel linjär interpolering mellan [x(i-1), x(i)] där y passerar 0)

x1 = x_pos(idx_land - 1);
x2 = x_pos(idx_land);
y1 = y_pos(idx_land - 1);
y2 = y_pos(idx_land);

x_land = x1 + (0 - y1) * (x2 - x1) / (y2 - y1);  % Linjär interpolering

%% Skriv ut resultat
fprintf('Raketen landar vid x ≈ %.4f meter.\n', x_land);


%% Plottra raketens bana med landningspunkt markerad
figure;
plot(x_pos, y_pos, 'b', 'LineWidth', 1.5); hold on;
plot(x_land, y_pos(idx_land), 'ko', 'MarkerSize', 10, 'MarkerFaceColor', 'k');
yline(0, '--k');

xlabel('x-position (m)');
ylabel('y-position (m)');
title('Raketens bana och landningspunkt');
legend('Raketens bana', 'Landningspunkt', 'Location', 'best');

xlim([-1,10]); ylim([-5,18]);

grid on;


%% Figur 2 – inzoomad interpolation
figure;
plot([x1 x2], [y1 y2], '-bo', 'LineWidth', 1.5); hold on;
plot(x_land, 0, 'ko', 'MarkerSize', 10, 'MarkerFaceColor', 'k');
xlabel('x-position (m)');
ylabel('y-position (m)');
title('Inzoomning: Interpolation kring markpassage');
grid on;
legend('Interpolationspunkter', 'Interpolerad landning', 'Location', 'best');

xlim([x1 - 0.009, x2 + 0.009]);
ylim([min(y1,y2)-0.02, max(y1,y2)+0.02]);