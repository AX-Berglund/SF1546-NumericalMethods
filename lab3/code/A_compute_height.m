% A_compute_height.m
% Uppgift a: Beräkna och plotta den maximala höjden raketen når
clear all; close all; clc;
%% Lägg till sökväg till funktionerna
addpath('functions');
%% Startparametrar
v_yx = 21; % Initial hastighet (m/s)
teta = deg2rad(81); % Startvinkel (grader -> radianer)
h = 0.01; % Steglängd för Runge-Kutta
F = 1; % Kraft under brinntiden
t1 = 0; t2 = 0.08; % Brinntidens start och slut
tend = 4; % Total simuleringstid
%% Beräkna rörelsen med hög noggrannhet
[~, ~, z3, ~, ~, ~, ~] = Rocketman(t1, t2, tend, h, F, v_yx, 1);
%% Extrahera positioner
x_pos = z3(1,:);
y_pos = z3(2,:);
x_vel = z3(3,:);
y_vel = z3(4,:);
%% Hitta maximal höjd och dess index
[y_max, idx_max] = max(y_pos);
x_max = x_pos(idx_max);

% Display original maximum
disp(['Original maximum: x = ', num2str(x_max), ', y = ', num2str(y_max)]);

%% Perform interpolation with different step sizes
% Define the step sizes to test
step_sizes = [1, 10, 30];
colors = {'r', 'g', 'b'};  % Colors for plotting

figure;

% --- Subplot 1: Full trajectory ---
subplot(2,1,1);
plot(x_pos, y_pos, 'k-');
grid on;
xlabel('x');
ylabel('y');
title('Full Rocket Trajectory');
xlim([0, max(x_pos)]);
ylim([0, max(y_pos)*1.1]);
hold on;

% Mark the original maximum
plot(x_max, y_max, 'ko', 'MarkerFaceColor', 'y', 'DisplayName', 'Original Max');

legend('Trajectory', 'Original Max');

% --- Subplot 2: Zoom-in and interpolation ---
subplot(2,1,2);
plot(x_pos, y_pos, 'k-', 'DisplayName', 'Original Data');
hold on;
grid on;
xlabel('x');
ylabel('y');
title('Zoomed View: Quadratic Interpolation near Maximum');

legend_entries = {'Original Data', 'Original Maximum'};
plot(x_max, y_max, 'ko', 'MarkerFaceColor', 'y');

% Define how much to zoom around the max (in x-units)
zoom_range = 0.5; % adjust as needed
xlim([x_max - zoom_range, x_max + zoom_range]);
ylim([y_max - zoom_range, y_max + zoom_range]);

% Interpolation logic remains the same:
y_interp_results = zeros(size(step_sizes));

for i = 1:length(step_sizes)
    step = step_sizes(i);
    
    % Determine interpolation indices
    if idx_max > step && idx_max < length(y_pos) - step
        idx_range = [idx_max-step, idx_max, idx_max+step];
    else
        if idx_max <= step
            idx_range = [1, 1+step, 1+2*step];
        else
            idx_range = [length(y_pos)-2*step, length(y_pos)-step, length(y_pos)];
        end
    end
    
    x1 = x_pos(idx_range(1)); y1 = y_pos(idx_range(1));
    x2 = x_pos(idx_range(2)); y2 = y_pos(idx_range(2));
    x3 = x_pos(idx_range(3)); y3 = y_pos(idx_range(3));
    
    % Plot endpoints used for interpolation
    plot(x1, y1, [colors{i}, 'o'], 'MarkerSize', 8);
    plot(x3, y3, [colors{i}, 'o'], 'MarkerSize', 8);
    
    % Interpolate
    A = [x1^2, x1, 1; x2^2, x2, 1; x3^2, x3, 1];
    b = [y1; y2; y3];
    coeffs = A \ b;
    
    c1 = coeffs(1); c2 = coeffs(2); c3 = coeffs(3);
    x_interp_max = -c2/(2*c1);

    y_interp_max = c1*x_interp_max^2 + c2*x_interp_max + c3;
    y_interp_results(i) = y_interp_max;
    
    % Plot interpolated parabola
    x_fine = linspace(min([x1, x2, x3]), max([x1, x2, x3]), 100);
    y_fine = c1*x_fine.^2 + c2*x_fine + c3;
    plot(x_fine, y_fine, [colors{i}, '-'], 'LineWidth', 1.5);
    plot(x_interp_max, y_interp_max, [colors{i}, '*'], 'MarkerSize', 10);
    
    % Add to legend
    legend_entries{end+1} = ['Step ', num2str(step), ' fitted parabola'];
    legend_entries{end+1} = ['Step ', num2str(step), ' max'];
end

legend(legend_entries);
