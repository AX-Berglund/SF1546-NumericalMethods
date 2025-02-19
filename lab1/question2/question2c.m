% 2c) Determine one root using Newton's method

clear; clc;

% Define function
f = @(x) 61*x - ((x.^2 + x + 0.03) ./ (3*x + 1)).^7 - 20*x.*exp(-x);

% Define derivative
df= @(x)  61  -  7* ( (x.^2+x+0.03) ./ (3*x+1) ).^6 * ( ( (3*x + 1 ).*( 2*x +1 ) - ( x.^2 + x + 0.03 )*(3) ) ./ ( (3*x+1).^2 ) ) - 20*( exp(-x) - x.*exp(-x) );

% Initial guess
%x0 = -1.5;
%x0 = -0.28; 
%x0 = -0.1;
x0 = 6;

tol = 1e-8;
max_iter = 50;

% Newton's method iteration
x = x0;

fprintf('Iter | x-value         | f(x)            | df(x)           | Step Size\n');
fprintf('-----------------------------------------------------------------------\n');

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
    
    % Print iteration progress
    fprintf('%4d | %.10f | %.10e | %.10e | %.10f\n', i, x, fx, dfx, abs(x_new - x));

    % Check convergence
    if abs(x_new - x) < tol
        x = x_new;
        fprintf('\nRoot found at x = %.6f after %d iterations\n', x, i);
        break;
    end

    x = x_new; % Update x-value for next iteration
end

% If max iterations reached
if i == max_iter
    fprintf('\nNewton''s method did not converge within %d iterations.\n', max_iter);
end

