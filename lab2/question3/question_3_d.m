clc; clear; close all;

% Parametrar
g = 9.81;
L = 2.5;
phi0 = 6*pi/7;
omega0 = 0.8;
T_final = 10;

% Lös ODE
tspan = [0, T_final];
y0 = [phi0; omega0];
[t, y] = ode45(@(t, y) pendelODE(t, y, g, L), tspan, y0);

% Beräkna svängningstid
T = pendelPeriod(t, y(:,1));
fprintf('Pendelns svängningstid: %.3f sekunder\n', T);
