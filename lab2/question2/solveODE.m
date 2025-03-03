function [x_vals, y_vals] = solveODE(method, h, L)
    % Löser differentialekvationen y'(x) med Euler eller Runge-Kutta 4.
    % method = 'Euler' eller 'RK4'
    % h = steglängd
    % L = slutvärde på x

    % Definiera differentialekvationen dy/dx = f(x, y)
    f = @(x, y) -((1/6) + (pi * sin(pi * x) / (1.6 - cos(pi * x)))) * y;

    % Initialvärden
    x0 = 0;
    y0 = 2.5;
    
    % Diskretisera x
    n_steps = round(L / h); 
    x_vals = linspace(x0, L, n_steps + 1);
    y_vals = zeros(size(x_vals));
    y_vals(1) = y0;

    % Numerisk lösning
    for i = 1:n_steps
        x_n = x_vals(i);
        y_n = y_vals(i);

        if strcmp(method, 'Euler')
            y_vals(i + 1) = y_n + h * f(x_n, y_n);
        elseif strcmp(method, 'RK4')
            k1 = h * f(x_n, y_n);
            k2 = h * f(x_n + h/2, y_n + k1/2);
            k3 = h * f(x_n + h/2, y_n + k2/2);
            k4 = h * f(x_n + h, y_n + k3);
            y_vals(i + 1) = y_n + (k1 + 2*k2 + 2*k3 + k4)/6;
        else
            error('Okänd metod. Välj "Euler" eller "RK4".');
        end
    end
end
