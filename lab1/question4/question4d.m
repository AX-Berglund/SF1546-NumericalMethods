% D: 1 juni - 1 augusti
index_D = 6:8;
p_D = polyfit(datum(index_D), soltid(index_D), 2);
y_D = polyval(p_D, x);


% Plot för alla andragradspolynom
figure;
plot(datum, soltid, 'ro', 'MarkerFaceColor', 'r');
hold on;
xline(50, 'Color', 'r', 'LineStyle', '--', 'LineWidth', 2);
xlim([1,365]);
plot(x, y_D, 'b-');
title('Andragradspolynom');
xlabel('Dag på året');
ylabel('Soltid (timmar)');
legend('Data', '1 juni - 1 aug', '1 apr - 1 sep', 'Hela året');
grid on;
