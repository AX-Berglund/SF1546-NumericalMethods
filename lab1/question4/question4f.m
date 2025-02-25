% F: Hela året
p_F = polyfit(datum, soltid, 2);
y_F = polyval(p_F, x);

% Plot for F
figure
plot(datum, soltid, 'ro', 'MarkerFaceColor', 'r');
hold on;
plot(x, y_F, '-b');
xlim([1,365]);
title('Andragradspolynom (Hela året)');
xlabel('Dag på året');
ylabel('Soltid (timmar)');
legend('Data', 'polynom');
grid on;