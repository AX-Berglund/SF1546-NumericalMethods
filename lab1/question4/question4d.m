% D: 1 juni - 1 augusti
index_D = 6:8;
p_D = polyfit(datum(index_D), soltid(index_D), 2);
y_D = polyval(p_D, x);

% Plot för alla andragradspolynom
figure;
plot(datum, soltid, 'ro', 'MarkerFaceColor', 'r', 'DisplayName', 'Data');
hold on;
xline(152, 'Color', 'r', 'LineStyle', '--', 'LineWidth', 2, 'DisplayName', '1 juni');
xline(213, 'Color', 'g', 'LineStyle', '--', 'LineWidth', 2, 'DisplayName', '1 aug');
xlim([1,365]);
plot(x, y_D, 'b-', 'DisplayName', 'polynom'); % Correct DisplayName
title('Andragradspolynom');
xlabel('Dag på året');
ylabel('Soltid (timmar)');
legend(); % Automatic legend - no arguments needed
grid on;