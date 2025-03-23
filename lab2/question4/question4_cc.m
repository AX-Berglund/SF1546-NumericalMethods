clear all, close all, clf

function [xi, Ti] = FDM(h)
    L = 3.6;
    N = round(L / h) - 1;  % Calculate N based on h
    x = linspace(0, L, N + 2); % x-values
    % Boundary conditions
    T0 = 310;
    TL = 450;
    
    % Functions
    k = @(x) 3 + x / 7;
    Q = @(x) 280 * exp(-(x - L / 2)^2);
    
    % Initialize matrices
    A = zeros(N, N);
    b = zeros(N, 1);
    
    for j = 2:N+1
        xj = x(j);
        kj = k(xj);
        Qj = Q(xj);
    
        % Matrix elements
        a1j = 1 / h^2 - 1 / (2 * h * 7 * kj);
        a2j = -2 / h^2;
        a3j = 1 / h^2 + 1 / (2 * h * 7 * kj);
    
        if j > 2
            A(j-1, j-2) = a1j;
        end
        A(j-1, j-1) = a2j;
        if j < N+1
            A(j-1, j) = a3j;
        end
        b(j-1) = -Qj / kj;
    end
    
    % Apply boundary conditions
    b(1) = b(1) - T0 * (1 / h^2 - 1 / (2 * h * 7 * k(x(2))));
    b(end) = b(end) - TL * (1 / h^2 + 1 / (2 * h * 7 * k(x(end-1))));
    
    % Solve system
    T_mellan = A \ b;
    T = [T0; T_mellan; TL]; % Insert boundary values
    Ti = T;
    xi = x;
end

% Step sizes
h1 = 0.33; % To include x = 1.65
h2 = 0.37; % To include x = 2.96

[x_h1, T_h1] = FDM(h1);
[x_h2, T_h2] = FDM(h2);

% Find closest index to 1.65 and 2.96
[~, idx1] = min(abs(x_h1 - 1.65));
[~, idx2] = min(abs(x_h2 - 2.96));

% Get values at those points
T_165 = T_h1(idx1);
T_296 = T_h2(idx2);

% Plot results
figure;
plot(x_h1, T_h1, 'o-r', 'LineWidth', 1.5); hold on;
plot(x_h2, T_h2, 'x-b', 'LineWidth', 1.5);
xlabel('x');
ylabel('T');
legend('h = 0.33', 'h = 0.37', 'Location', 'Best');
title('Temperature distribution in the rod');
grid on;

fprintf('T(1.65) = %.4f\n', T_165);
fprintf('T(2.96) = %.4f\n', T_296);
