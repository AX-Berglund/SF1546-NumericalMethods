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
