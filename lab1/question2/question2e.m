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
        fprintf('Constant C = %.10f\n', C);
        break;
    end
end

% If max iterations reached
if i == max_iter
    fprintf('\nNewton''s method did not converge within %d iterations.\n', max_iter);
end
