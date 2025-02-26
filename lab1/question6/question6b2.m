% Uppgift 6b: Bestäm en övre gräns B där svansintegralen är tillräckligt liten
clear; clc;

% Definiera funktionen f(x)
f = @(x) (1 - exp(-(x/5).^3)) ./ (5*x.^3);

% Definiera svansintegralen som funktion av B
svansintegral = @(B) integral(f, B, Inf, 'RelTol', 1e-9);

% Sätt startvärde för B och bestäm felgräns
B = 0.01;            % Startvärde för övre gräns B
felgrans = 1e-9;     % Accepterad felgräns för svansintegralen

% Iterativt öka B tills svansintegralen är mindre än felgränsen
while svansintegral(B) > felgrans
    B = B + 1; % Öka B stegvis
end

% Visa resultat
fprintf('Övre gräns B där svansintegralen < %.1e: B = %.2f\n', felgrans, B);

% Plotta funktionen för att visualisera svansen
x = logspace(-4, log10(B) + 1, 1000);
y = f(x);

figure;
plot(x, y, 'r-', 'LineWidth', 2);
xlabel('x');
ylabel('f(x)');
title('Bestämning av övre gräns B för integralen');
grid on;
set(gca, 'XScale', 'log', 'YScale', 'log'); % Log-log skala för tydlighet

% Markera funnen B på grafen
hold on;
plot(B, f(B), 'bo', 'MarkerSize', 10, 'MarkerFaceColor', 'b');
text(B, f(B), sprintf('  B = %.2f', B), 'FontSize', 12);

% Spara och skriva ut resultat
saveas(gcf, 'question6b_plot.png');
fileID = fopen('question6b_results.txt', 'w');
fprintf(fileID, 'Övre gräns B där svansintegralen < %.1e: B = %.8f\n', felgrans, B);
fclose(fileID);
