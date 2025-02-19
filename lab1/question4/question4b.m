% B) Styckvis linjär interpolation

% Intuition: dra raka linjer mellan varje par av punkter

y_lin = interp1(datum, soltid, x, 'linear');

% Plot
figure;
plot(datum, soltid, 'ro', 'MarkerFaceColor', 'r');
hold on;
xlim([1,365]);
plot(x, y_lin, 'g-');
title('Styckvis linjär interpolation');
xlabel('Dag på året');
ylabel('Soltid (timmar)');
legend('Data', 'Linjär interpolation');
grid on;
