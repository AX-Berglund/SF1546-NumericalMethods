% 1 c) Använd Runge Kuttas istället för Euler
% Men Runge-Kutta-metoder kan vara av högre ordning, t.ex. RK4 har ett fel som minskar som O(h^4)
% Vilket innebär att vi kan få mycket mer noggrannhet utan att behöva göra steglängden jätteliten.


clc; clear; close all;

% Definiera differentialekvationen dy/dx = f(x, y)
f = @(x, y) -((1/6) + (pi * sin(pi * x) / (1.6 - cos(pi * x)))) * y;

% Parametrar
y0 = 2.5;   % Begynnelsevärde
x0 = 0;     % Startpunkt
x_end = 4;  % Slutpunkt

% -----------------------------
h = 0.5;    % Steglängd - testa olika och se
% -----------------------------

n_steps = (x_end - x0) / h;  % Antal steg
x_vals = linspace(x0, x_end, n_steps + 1);
y_vals = zeros(1, n_steps + 1);
y_vals(1) = y0;

% Runge-Kutta 4:e ordningen
for i = 1:n_steps
    x_n = x_vals(i);
    y_n = y_vals(i);
    
    k1 = f(x_n, y_n);
    k2 = f(x_n + h/2, y_n + (h/2) * k1);
    k3 = f(x_n + h/2, y_n + (h/2) * k2);
    k4 = f(x_n + h, y_n + h * k3);
    
    y_vals(i + 1) = y_n + (h/6) * (k1 + 2*k2 + 2*k3 + k4);
end

% Plotta lösningen
figure;
plot(x_vals, y_vals, 'o-', 'DisplayName', 'Runge-Kutta 4 (h=0.5)');
xlabel('x');
ylabel('y(x)');
title('Runge-Kutta 4:e ordningen');
legend;
grid on;
