% Uppgift 6d: Behövs ytterligare förbehandling för att beräkna integralen med trapetsregeln?
% Nej det ska inte behövas, vi har undersökt x nära noll och x > B, vi
% undersöker vidare i fråga d där vi beräknar integralen med trapetsregeln.
% Det bör framstå trunkeringsfel, och de kan vi studera med richardson
% extrapolering

% Vi kan studera intervallet mellan 1e-4 och B, och försäkra om derivatan
% att derivatan inte är för stor vid ett tillfälle för att avgöra om vi
% behöver ytterligare förbehandling


clear; clc;



% Läs in B från tidigare resultat
B = 10002.01000000;

% Definiera integranden f(x)
f = @(x) (1 - exp(-(x/5).^3)) ./ (5*x.^3);

% Skapa x-värden i intervallet [1e-4, B]
x = linspace(1e-4, B, 1000);
y = f(x);

% Plotta integranden i detta intervall
figure;
plot(x, y, 'g-', 'LineWidth', 2);
xlabel('x');
ylabel('f(x)');
title(sprintf('Analys av f(x) i intervallet [1e-4, %.2f]', B));
grid on;

% Beräkna numerisk derivata för att se hur brant f(x) är
dx = diff(x);
dfdx = diff(y) ./ dx;

% Plotta derivatan för att se hur mycket f(x) förändras
figure;
plot(x(1:end-1), abs(dfdx), 'r-', 'LineWidth', 2);
xlabel('x');
ylabel('|df/dx|');
title(sprintf('Förändringshastighet av f(x) i intervallet [1e-4, %.2f]', B));
grid on;

% Spara figuren som bild
saveas(gcf, 'question6d_plot.png');

% Öppna figuren automatiskt
open('question6d_plot.png');

% Avgör om ytterligare förbehandling behövs
max_slope = max(abs(dfdx));
threshold = 10^3; % Om lutningen är större än detta, kan vi behöva en bättre metod

fileID = fopen('question6d_results.txt', 'w');
if max_slope < threshold
    fprintf(fileID, 'Trapetsregeln bör fungera bra i intervallet [1e-4, %.2f]\n', B);
    fprintf(fileID,'Då maxderivata är inte är för stor. Maxderivata: %.8f \n', max_slope);

    fprintf('Trapetsregeln kan användas direkt för numerisk integration.\n');
    fprintf('Maxderivata är %.8f \n', max_slope);
else
    fprintf(fileID, 'f(x) varierar för snabbt. En bättre metod kan behövas i intervallet [1e-4, %.2f]\n', B);
    fprintf('Trapetsregeln kan ge stora fel. En bättre metod bör övervägas.\n');
end
fclose(fileID);

fprintf('Analysen är klar. Resultatet har sparats i question6d_results.txt\n');
