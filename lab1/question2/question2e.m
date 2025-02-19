% 2e) Bestäm konvergenskonstanten för den största roten.  

clear; clc;

% Define function
f = @(x) 61*x - ((x.^2 + x + 0.03) ./ (3*x + 1)).^7 - 20*x.*exp(-x);

% Define derivative
df= @(x)  61  -  7* ( (x.^2+x+0.03) ./ (3*x+1) ).^6 * ( ( (3*x + 1 ).*( 2*x +1 ) - ( x.^2 + x + 0.03 )*(3) ) ./ ( (3*x+1).^2 ) ) - 20*( exp(-x) - x.*exp(-x) );


% Initial guess
x0 = 6; % Change initial guess as needed
tol = 1e-4;
max_iter = 50;
x_values = zeros(1, max_iter);
x_values(1) = x0;

for i = 2:max_iter
    x_new = x_values(i-1) - f(x_values(i-1))/df(x_values(i-1));
    x_values(i) = x_new;
    if abs(x_new - x_values(i-1)) < tol
        break;
    end
end

% might need to change this, and track to see that all are the same and not
% just the last
errors = abs(x_values - x0);
C = errors(end) / (errors(end-1)^2);

fprintf('Konvergenskonstanten av sista är: C = %.5f\n', C);
