% main.m
% Körning av raketprojekt (Projekt A - Bordsfyrverkeri)

clear all; close all; clf;
addpath('functions')

% Startvärden
v_yx = 21;                      % Initial hastighet (m/s)
teta = deg2rad(81);            % Startvinkel i radianer
h = 0.01;                      % Steglängd
F = 1;                         % Kraft under brinntid
t1 = 0; t2 = 0.08; tend = 4;   % Tider

% Lös ODE med tre olika steglängder
[z1, z2, z3, t_vals1, t_vals2, t_vals3, Error] = Rocketman(t1, t2, tend, h, F, v_yx, 1);

% Beräkna vinkel över tid
graderVektor = getdegvec(t_vals1, h, z1);

% Skriv ut fel och ordning
fprintf('Ordningnr1 = %.4f\n', Error(2,4));
fprintf('Ordningnr2 = %.4f\n', Error(3,4));
fprintf('Felet första halvering (del 1) = %.13f\n', Error(2,2));
fprintf('Felet andra halvering (del 1) = %.13f\n', Error(3,2));
fprintf('Felet första halvering (del 2) = %.13f\n', Error(2,3));
fprintf('Felet andra halvering (del 2) = %.13f\n', Error(3,3));

% Plotta raketens bana
figure;
plot(z1(1,:), z1(2,:), 'b'); hold on;
plot(z2(1,:), z2(2,:), 'g');
plot(z3(1,:), z3(2,:), 'r');
plot(z3(1,34), z3(2,34), '*-k');
xlim([-1,10]); ylim([-5,18]);
yline(0,'-k');
xlabel('x-position (m)');
ylabel('y-position (m)');
title('Raketens bana i x-y planet');
grid on;
