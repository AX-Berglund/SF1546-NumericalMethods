clc; clear; close all;

% Parametrar
g = 9.81;   % Tyngdacceleration (m/s^2)
L = 2.5;    % Pendelns längd (m)
phi0 = 6*pi/7;  % Begynnelsevinkel (rad)
omega0 = 0.8;   % Begynnelsehastighet (rad/s)
T_final = 20;   % Simuleringstid

% Lösning med ode45
tspan = [0, T_final];
y0 = [phi0; omega0];
[t, y] = ode45(@(t, y) pendelODE(t, y, g, L), tspan, y0);



% Plotta resultatet
figure;
subplot(2,1,1);
plot(t, y(:,1), 'b', 'LineWidth', 1.5);
xlabel('Tid (s)'); ylabel('\phi (rad)');
title('Vinkel över tid');
grid on;

subplot(2,1,2);
plot(t, y(:,2), 'r', 'LineWidth', 1.5);
xlabel('Tid (s)'); ylabel('\omega (rad/s)');
title('Vinkelhastighet över tid');
grid on;
