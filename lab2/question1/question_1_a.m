% 1 a) - Eulers Metod med olika steglängder

clc;
clear;
close all;


% Definiera differentialekvationen dy/dx = f(x, y)
f = @(x, y) -((1/6) + (pi * sin(pi * x) / (1.6 - cos(pi * x)))) * y;

% Parametrar
y0 = 2.5;  % Begynnelsevärde
x0 = 0;    % Startpunkt
x_end = 4; % Slutpunkt
step_sizes = [0.5, 0.25, 0.1, 0.001, 0.0005]; % Olika steglängder

figure;
hold on;
colors = ['r', 'g', 'b', 'y', 'g']; % Färger för plotten


% Skriv ut värden för y(4) i MATLAB-konsollen
fprintf('\nResultat för y(4) med olika steglängder:\n');

for i = 1:length(step_sizes)
    h = step_sizes(i);
    n_steps = (x_end - x0) / h;  % Antal steg
    x_vals = linspace(x0, x_end, n_steps + 1);
    y_vals = zeros(1, n_steps + 1); % sätt 0 minne för y
    
    % Initialvärde
    y_vals(1) = y0;
    
    % Eulers iteration
    for j = 1:n_steps
        y_vals(j + 1) = y_vals(j) + h * f(x_vals(j), y_vals(j));
    end
    
    % Plotta resultatet
    plot(x_vals, y_vals, 'o-', 'Color', colors(i), 'DisplayName', ['h = ', num2str(h)]);

    % Skriv ut värdet på y(4)
    fprintf('h = %.3f, y(4) = %.6f\n', h, y_vals(end));
end

xlabel('x');
ylabel('y(x)');
title('Eulers metod med olika steglängder');
legend;
grid on;
hold off;


% Numeriska värden på y(4)
fprintf("")