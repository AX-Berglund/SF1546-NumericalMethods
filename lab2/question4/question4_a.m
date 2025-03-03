clc; clear; close all;

% Parametrar
L = 3.6;  % Stavens längd
N = 4;    % Antal inre punkter för diskretisering (endast härledningsexempel)
h = L / (N + 1); % Steglängd
x_vals = linspace(0, L, N+2); % Inkluderar randpunkter

% Bygg matris A
A = zeros(N, N);
for i = 1:N
    if i > 1
        A(i, i-1) = 1;
    end
    A(i, i) = -2;
    if i < N
        A(i, i+1) = 1;
    end
end
A = A / h^2;

% Skapa vektor b
b = zeros(N, 1);
for i = 1:N
    b(i) = -280 * exp(-(x_vals(i+1) - L/2)^2); % Q(x) för inre punkter
end

% Inför randvillkor i b
T0 = 310;
TL = 450;
b(1) = b(1) - T0 / h^2;
b(end) = b(end) - TL / h^2;

% Utskrift
disp('Matris A:');
disp(A);
disp('Högerled vektor b:');
disp(b);
