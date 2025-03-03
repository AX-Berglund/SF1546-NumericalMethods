clear; clc; close all;

% Givna punkter
x1 = 10; y1 = 10;
x2 = 12; y2 = 2;
x3 = 3;  y3 = 8;

% Initialgissning
X0 = 8; Y0 = 6; R0 = 12;

% a) Lös ickelinjära systemet med Newtons metod
[X, Y, R] = newton_nonlinear_circle(X0, Y0, R0, [x1, x2, x3], [y1, y2, y3]);
fprintf('Lösning a): X=%.5f, Y=%.5f, R=%.5f\n', X, Y, R);

% Plotta cirkeln
plot_circle(X, Y, R, [x1, x2, x3], [y1, y2, y3], 'Uppgift a');

% c) Multiplicera tredje ekvationen med 3 och lös igen
[X_c, Y_c, R_c] = newton_nonlinear_circle(X0, Y0, R0, [x1, x2, x3], [y1, y2, y3], true);
fprintf('Lösning c): X=%.5f, Y=%.5f, R=%.5f\n', X_c, Y_c, R_c);

% Plotta cirkeln för c)
plot_circle(X_c, Y_c, R_c, [x1, x2, x3], [y1, y2, y3], 'Uppgift c');

% d) Minsta-kvadratlösning med Gauss-Newton
x4 = 11; y4 = 11;
x5 = 2;  y5 = 9;
[X_d, Y_d, R_d] = gauss_newton_circle([X0, Y0, R0], [x1, x2, x3, x4, x5], [y1, y2, y3, y4, y5]);
fprintf('Lösning d): X=%.5f, Y=%.5f, R=%.5f\n', X_d, Y_d, R_d);

% Plotta cirkeln för d)
plot_circle(X_d, Y_d, R_d, [x1, x2, x3, x4, x5], [y1, y2, y3, y4, y5], 'Uppgift d');

% f) Lös linjära ekvationssystemet
[X_f, Y_f, R_f] = solve_linear_system([x1, x2, x3], [y1, y2, y3]);
fprintf('Lösning f): X=%.5f, Y=%.5f, R=%.5f\n', X_f, Y_f, R_f);

% Plotta cirkeln för f)
plot_circle(X_f, Y_f, R_f, [x1, x2, x3], [y1, y2, y3], 'Uppgift f');
