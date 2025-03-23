% Define the function f(x)
f = @(x) 61*x - ((x.^2 + x + 0.03)./(3*x + 1)).^7 - 20*x.*exp(-x);

% Define x range with small step size
x = -5:1e-5:7.5;
y = f(x);

% Create figure
figure();

% Define root intervals for subplots
root_intervals = [
    -1.15, -1.1, -1, 1;    % Rot 1
    -0.30, -0.28, -1, 1;   % Rot 2
    -0.001, 0.001, -0.05, 0.05; % Rot 3
    6.35, 6.45, -2, 2;     % Rot 4
    -3, 7, -300, 300       % Full function
];

% Titles for subplots
titles = {'Rot 1', 'Rot 2', 'Rot 3', 'Rot 4', 'y = f(x)'};

% Loop to create subplots
for i = 1:4
    subplot(3, 2, i);
    plot(x, y, 'b'); % Plot function
    title(titles{i});
    xlim(root_intervals(i, 1:2));
    ylim(root_intervals(i, 3:4));
    yline(0, 'k:', 'LineWidth', 1); % Dashed zero line
end

% Full function plot
subplot(3, 2, 5:6);
plot(x, y, 'b'); % Plot function
title(titles{5});
xlim(root_intervals(5, 1:2));
ylim(root_intervals(5, 3:4));
yline(0, 'k:', 'LineWidth', 1); % Dashed zero line
