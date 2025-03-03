clc;
clear;
close all;

% Parametrar
L = 4; % Axellängd
N = 40; % Antal punkter för x och y (lagom för visualisering)

method = 'RK4'; % Metod för ODE-lösning
steglangd = (L/N);

% method = 'Euler';
% steglangd = 0.25;

% Lös differentialekvationen för att få y(x)
[x_vals, y_vals] = solveODE(method, steglangd, L);

% Ta endast 40 värden för en lagom stor mesh
x = linspace(0, L, N)'; 
y = interp1(x_vals, y_vals, x); % Interpolera y(x) så vi har rätt antal punkter

% Skapa rotationsvinkel ϕ
fi = linspace(0, 2*pi, 30); % Radvektor av rotationsvinklar

% Skapa matriser för 3D-plot
X = x * ones(size(fi));
Y = y * cos(fi);
Z = y * sin(fi);

% Plotta 3D-figuren
figure;
mesh(X, Y, Z); % Skapar en nätfigur
xlabel('X'); ylabel('Y'); zlabel('Z');
title('3D-modell av rotationskroppen');
axis equal;
grid on;

% Alternativ: Fylld yta med `surf`
figure;
surf(X, Y, Z, 'EdgeColor', 'none'); % Tar bort kantlinjer för mjukare yta
xlabel('X'); ylabel('Y'); zlabel('Z');
title('Fylld 3D-modell av rotationskroppen');
colormap turbo; % Snyggare färgskala
lighting phong; % Lägg till ljussättning för bättre effekt
camlight; % Placera en ljuskälla
axis equal;
grid on;
