% Definiera integranden som en anonym funktion
f = @(x) (1 - exp(- (x / 5).^3)) ./ (5 * x.^3);

B = 3163.00;
% B = 10002.01;
% Beräkna integralen med quad
quad_result_inf = integral(f, 1e-10, Inf);
quad_result_utan_svans = integral(f, 1e-10, B);

% Beräkna integralen med trapetsregeln
x_vals = linspace(1e-10, 50, 1000);  % Diskretisera intervallet
y_vals = f(x_vals);
trapz_result = trapz(x_vals, y_vals);

% Visa resultaten
fprintf('Integralen beräknad med quad: %.10f\n', quad_result_inf);
fprintf('Integralen beräknad med trapz: %.10f\n', trapz_result);

diff = abs(quad_result_inf - quad_result_utan_svans);

fprintf('Diff mellan hela integralen och utan svans %.5e', diff);