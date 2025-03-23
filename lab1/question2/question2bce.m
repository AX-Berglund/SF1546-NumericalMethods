% QUESTION 2B -------------------------------------------------------------

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





% QUESTION 2C -------------------------------------------------------------

% Determine one root using Newton's method and print relative error

clear; clc;

% Define function
f = @(x) 61*x - ((x.^2 + x + 0.03) ./ (3*x + 1)).^7 - 20*x.*exp(-x);

% Define derivative
df= @(x)  61  -  7* ( (x.^2+x+0.03) ./ (3*x+1) ).^6 .* ...
    ( ( (3*x + 1 ).*( 2*x +1 ) - ( x.^2 + x + 0.03 )*(3) ) ./ ( (3*x+1).^2 ) ) ...
    - 20*( exp(-x) - x.*exp(-x) );

% Initial guess (modify for each root)
%x0 = -1.5;
x0 = -0.28; 
%x0 = -0.1;
%x0 = 6;

tol = 1e-8;
max_iter = 50;

% Newton's method iteration
x = x0;
relative_error = inf; % Initialize with a large value

fprintf('Iter | x-value         | f(x)            | df(x)           | Step Size       | Relative Error\n');
fprintf('----------------------------------------------------------------------------------------------\n');

for i = 1:max_iter
    fx = f(x);
    dfx = df(x);
    
    % Check if the derivative is too small or NaN
    if abs(dfx) < 1e-10 || isnan(dfx)
        fprintf('Derivative near zero or NaN at x = %.6f, stopping iteration.\n', x);
        break;
    end

    % Compute new x-value
    x_new = x - fx / dfx;

    % Compute relative error
    relative_error = abs(x_new - x) / abs(x_new);

    % Print iteration progress
    fprintf('%4d | %.10f | %.10e | %.10e | %.10e | %.10e\n', i, x, fx, dfx, abs(x_new - x), relative_error);

    % Check convergence based on relative error
    if relative_error < tol
        fprintf('\nRoot found at x = %.10f with relative error %.10e after %d iterations\n', x_new, relative_error, i);
        break;
    end

    x = x_new; % Update x-value for next iteration
end

% If max iterations reached
if i == max_iter
    fprintf('\nNewton''s method did not converge within %d iterations.\n', max_iter);
end


% QUESTION 2E -------------------------------------------------------------

% 2e) Bestäm konvergenskonstanten för den största roten

clear; clc;

% Define function
f = @(x) 61*x - ((x.^2 + x + 0.03) ./ (3*x + 1)).^7 - 20*x.*exp(-x);

% Define derivative
df= @(x)  61  -  7* ( (x.^2+x+0.03) ./ (3*x+1) ).^6 .* ...
    ( ( (3*x + 1 ).*( 2*x +1 ) - ( x.^2 + x + 0.03 )*(3) ) ./ ( (3*x+1).^2 ) ) ...
    - 20*( exp(-x) - x.*exp(-x) );

% Startvärde för största roten
x0 = 6;

% andra rötter
%x0 = -1.5;
%x0 = -0.289; 
%x0 = -0.1;


tol = 1e-8;
max_iter = 50;
x_values = zeros(1, max_iter);
x_values(1) = x0;
errors = zeros(1, max_iter);  % För att lagra felen

fprintf('Iter | x-value         | Error         | Convergence Constant C\n');
fprintf('-----------------------------------------------------------------\n');

for i = 2:max_iter
    % Newton's iteration
    x_new = x_values(i-1) - f(x_values(i-1)) / df(x_values(i-1));
    x_values(i) = x_new;
    
    % Compute absolute error
    errors(i) = abs(x_values(i) - x_values(i-1));
    
    % Compute convergence constant (after at least 3 iterations)
    if i > 2
        C = errors(i) / (errors(i-1)^2); %kvadratisk konvergens
        fprintf('%4d | %.10f | %.10e | %.10f\n', i, x_values(i), errors(i), C);
    else
        fprintf('%4d | %.10f | %.10e | N/A\n', i, x_values(i), errors(i)); % No C on first step
    end

    % Check convergence
    if errors(i) < tol
        fprintf('\nRoot found at x = %.10f with error %.10e after %d iterations\n', x_values(i), errors(i), i);
        break;
    end
end

% If max iterations reached
if i == max_iter
    fprintf('\nNewton''s method did not converge within %d iterations.\n', max_iter);
end
