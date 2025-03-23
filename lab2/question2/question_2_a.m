clc; clear; close all;

% Parametrar
L = 4;
num_steps = 8; % Number of step sizes
step_sizes = 0.5 ./ (2.^(0:num_steps-1)); % Generate step sizes by halving each time

fprintf("\nVolymberäkning för olika steglängder:\n");

V_values = zeros(1, num_steps); % Store volume results

for i = 1:num_steps
    h = step_sizes(i);
    V_values(i) = computeVolume(L, round(L/h), 'RK4', false);
    fprintf("[%d] - h = %.6f, Volym = %.6f\n", i, h, V_values(i));
end

% Compute the second-to-last result and the difference
V_2nd_last = V_values(end-1);
V_last = V_values(end);
difference = abs(V_2nd_last - V_last);

% Print the final result with uncertainty
fprintf("\nAndra sista värdet: %.6f ± %.6f\n", V_2nd_last, difference);
