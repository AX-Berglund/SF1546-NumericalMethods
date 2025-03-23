% 2b) Plotting the function f(x) to identify roots

clear; clc; close all; % Clear workspace, command window, and close figures

% Define the function f(x)
f = @(x) 61*x - ((x.^2 + x + 0.03) ./ (3*x + 1)).^7 - 20*x.*exp(-x);

% Generate x-values for plotting in the range [-3, 7] with 100,000 points
x = linspace(-2, 7, 100000);

% Compute y-values using the function
y = f(x);

% Create a figure for the plot
figure;
% increase figure width 
set(gcf, 'Position', get(0, 'Screensize'));
plot(x, y, 'b', 'LineWidth', 2); % Plot f(x) with a blue line and increased thickness
hold on;

% Add a horizontal reference line at y = 0 to indicate root locations
yline(0, 'k--'); % Dashed black line at y = 0

% Label the axes
xlabel('x'); % x-axis label
ylabel('f(x)'); % y-axis label

% Adjust y-axis limits for better visibility
ylim([-100, 250]);

% Adjust x-axis limits for better visibility
xlim([-2, 7]);

% Adjust x-axis tick marks for better visibility
xticks(-2:0.5:7);

title('Plot of f(x) to Identify Roots');

grid on;
hold off;
