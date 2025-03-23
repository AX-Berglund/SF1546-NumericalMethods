% Vilken av metoderna A-G är bäst för att beräkna årets längsta dag? Varför? Vilken
% dag är det och vad blir soltiden?

% Svar Ansats G

% Definiera w
w = 2 * pi / 365;

% Skapa designmatris för trigonometrisk anpassning
X = [ones(size(datum')) cos(w * datum') sin(w * datum')];
c = (X' * X) \ (X' * soltid');

% Beräkna trigonometrisk funktion
y_trig = c(1) + c(2) * cos(w * x) + c(3) * sin(w * x);

% Plot
figure;
plot(datum, soltid, 'ro', 'MarkerFaceColor', 'r');
hold on;
xlim([1,365]);
plot(x, y_trig, 'c-');
title('Trigonometrisk anpassning');
xlabel('Dag på året');
ylabel('Soltid (timmar)');
legend('Data', 'Trigonometrisk funktion');
grid on;

% Beräkna analytiskt maxvärde
x_max_analytisk = (1/w) * atan2(c(3), c(2));

% Beräkna soltiden vid maxpunkt
soltid_max_analytisk = c(1) + c(2) * cos(w * x_max_analytisk) + c(3) * sin(w * x_max_analytisk);

% Skriv ut resultaten
fprintf('Analytiskt beräknad längsta dag: dag %.2f med soltiden %.2f timmar.\n', x_max_analytisk, soltid_max_analytisk);
