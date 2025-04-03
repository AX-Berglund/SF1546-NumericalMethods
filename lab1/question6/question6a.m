% Uppgift 6a: Plotta funktionen för att analysera beteendet nära x = 0
clear; clc;

% Definiera funktionen f(x)
f = @(x) (1 - exp(-(x/5).^3)) ./ (5*x.^3);

% Skapa x-värden i intervallet [0, 1e-4]
x = linspace(0, 1e-4, 1000);  % 
y = f(x);

% Plotta funktionen
figure;
plot(x, y, 'b-', 'LineWidth', 2);
xlabel('x');
ylabel('f(x)');
title('Plot av integranden f(x) för små x');
grid on;
%set(gca, 'XScale', 'log', 'YScale', 'log'); % Log-log skala för bättre visualisering

% Spara figuren som bild
saveas(gcf, 'question6a_plot.png');

% Öppna figuren automatiskt
open('question6a_plot.png');

% Varför ser kurvan ut som den gör? Hur borde den se ut?

% Kurvan visar en oscillerande stigande och sjunkande mönster nära x=0, vilket beror på numeriska avrundningsfel. 
% När två nära floats subtraheras uppstår små precisionsförluster, 
% och eftersom en division sker med ett värde nära noll förstärks dessa fel, 
% vilket resulterar i den karakteristiska "darrande" effekten. 
% Det går att se att kurvan svänger kring ett värde runt 1.6e-3.
