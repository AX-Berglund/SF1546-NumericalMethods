% Uppgift 7b: Optimerad uppdelning av integrationsintervallet
clear; clc;

fprintf('\n\n Uppgift 7b - Optimerad numerisk integration\n');

% Definiera integranden f(x)
f_i = @(x) 153 * exp(-((11*x - pi) / 0.004).^2);

% Skapa x-värden för att analysera var funktionen är signifikant
x_linsp = linspace(0, 6, 100000);
integrand = f_i(x_linsp);

% Plotta integranden
figure;
plot(x_linsp, integrand, '-b', 'LineWidth', 1.5);
xlabel('x');
ylabel('f(x)');
title('Uppg 7 - Integrandens beteende');
legend('f(x)');
grid on;

% Vi ser att toppen är smal kring 0.285 dvs pi/11
% Dela upp intervallet i tre delar:
a1 = 0; b1 = 0.2;  % Utanför toppen, borde ge 0
a2 = 0.2; b2 = 0.3; % Innehåller toppen
a3 = 0.3; b3 = 6;   % Efter toppen, borde vara litet

% Plotta delintervallet
x_del_linsp = linspace(0.2, 0.205, 100000);
figure;
plot(x_del_linsp, integrand, '-b', 'LineWidth', 1.5);
xlabel('x');
ylabel('f(x)');
title('Uppg 7 - Del Integrand');
legend('f(x)');
grid on;


% Integrera i varje delintervall
I_1 = quad(f_i, a1, b1, 1e-8);
I_2 = quad(f_i, a2, b2, 1e-12);
I_3 = quad(f_i, a3, b3, 1e-8);

% Totala integralen
I_total = I_1 + I_2 + I_3;

% Skriv ut resultaten
fprintf('\nIndividuell integration av intervall:\n');
fprintf('I1 (x < 0.2)  = %.12e\n', I_1);
fprintf('I2 (0.2 < x < 0.3) = %.12e\n', I_2);
fprintf('I3 (x > 0.3)  = %.12e\n', I_3);
fprintf('Totala integralen: I_total = I2 = %.12e\n', I_total);

% Konvergensanalys med quad()
fprintf('\nKonvergens-analys av quad() \n');
fprintf("  AbsTol   |         I        |   E_trunk    |\n");

I_prev = nan;
E_trunk = nan;
i0 = 6;
i_max = 12;
for i = i0:i_max
    tol = 10^(-i);
    I = quad(f_i, a2, b2, tol);
    if i > i0
        E_trunk = abs(I - I_prev);
    end
    fprintf('%10.0e | %16.10e | %12.2e |\n', tol, I, E_trunk);
    I_prev = I;
end
fprintf('\nquad() blir: %.12e \nmed felgräns: e_trunk = %.12e \n', I, E_trunk);

% Konvergensanalys med integral()
fprintf('\nKonvergens-analys av integral()\n');
fprintf("  AbsTol   |         I        |   E_trunk    |\n");

I_prev = nan;
E_trunk = nan;
for i = i0:i_max
    tol = 10^(-i);
    I = integral(f_i, a2, b2, 'AbsTol', tol);
    if i > i0 % skip first
        E_trunk = abs(I - I_prev);
    end
    fprintf('%10.0e | %16.10e | %12.2e |\n', tol, I, E_trunk);
    I_prev = I;
end
fprintf('\nintegral() blir: %.12e \nmed felgräns: e_trunk = %.12e \n', I, E_trunk);

% Spara resultaten i en textfil
fileID = fopen('question7b_results.txt', 'w');
fprintf(fileID, 'Individuell integration av intervall:\n');
fprintf(fileID, 'I1 (x < 0.2)  = %.12e\n', I_1);
fprintf(fileID, 'I2 (0.2 < x < 0.3) = %.12e\n', I_2);
fprintf(fileID, 'I3 (x > 0.3)  = %.12e\n', I_3);
fprintf(fileID, 'Totala integralen: I_total = %.12e\n\n', I_total);
fprintf(fileID, 'Konvergensanalys med quad():\n');
fprintf(fileID, "  AbsTol   |         I        |   E_trunk    |\n");
for i = i0:i_max
    tol = 10^(-i);
    I = quad(f_i, a2, b2, tol);
    if i > i0
        E_trunk = abs(I - I_prev);
    end
    fprintf(fileID, '%10.0e | %16.10e | %12.2e |\n', tol, I, E_trunk);
    I_prev = I;
end
fprintf(fileID, '\nquad() blir: %.12e \nmed felgräns: e_trunk = %.12e \n\n', I, E_trunk);

fprintf(fileID, 'Konvergensanalys med integral():\n');
fprintf(fileID, "  AbsTol   |         I        |   E_trunk    |\n");
for i = i0:i_max
    tol = 10^(-i);
    I = integral(f_i, a2, b2, 'AbsTol', tol);
    if i > i0
        E_trunk = abs(I - I_prev);
    end
    fprintf(fileID, '%10.0e | %16.10e | %12.2e |\n', tol, I, E_trunk);
    I_prev = I;
end
fprintf(fileID, '\nintegral() blir:  %.12e \nmed felgräns: e_trunk = %.12e \n', I, E_trunk);
fclose(fileID);

fprintf('\nResultatet har sparats i question7b_results.txt\n');
