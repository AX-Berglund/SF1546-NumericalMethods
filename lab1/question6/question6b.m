% Uppgift 6b: Bestäm en övre gräns B där integranden är tillräckligt liten
clear; clc;

% Definiera funktionen f(x)
f = @(x) (1 - exp(-(x/5).^3)) ./ (5*x.^3);

% Skapa x-värden i intervallet [1e-4, 100] för att analysera svansen
x = logspace(-4, 4, 1000);
y = f(x);

% Plotta funktionen
figure;
plot(x, y, 'r-', 'LineWidth', 2);
xlabel('x');
ylabel('f(x)');
title('Bestämning av övre gräns B för integralen');
grid on;
set(gca, 'XScale', 'log', 'YScale', 'log'); % Log-log skala för tydlighet

% Hitta första x där f(x) < 10^(-8)
threshold = 1e-9;
B_index = find(y < threshold, 1, 'first'); % Första index där f(x) < threshold
B = x(B_index);

% Markera punkten på grafen
hold on;
plot(B, f(B), 'bo', 'MarkerSize', 10, 'MarkerFaceColor', 'b');
text(B, f(B), sprintf('  B = %.2f', B), 'FontSize', 12);

% Spara figuren som bild
saveas(gcf, 'question6b_plot.png');

% Öppna figuren automatiskt
open('question6b_plot.png');
% Skriv ut B i en fil
fileID = fopen('question6b_results.txt', 'w');
fprintf(fileID, 'Övre gräns B där f(x) < 1e-8: B = %.8f\n', B);
fclose(fileID);
