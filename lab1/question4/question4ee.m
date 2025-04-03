% D: 1 juni - 1 augusti
index_D = 11:13;
p_D = polyfit(datum(index_D), soltid(index_D), 2);
y_D = polyval(p_D, x);

% Plot för alla andragradspolynom
figure;
plot(datum, soltid, 'ro', 'MarkerFaceColor', 'r', 'DisplayName', 'Data');
hold on;
xline(305, 'Color', 'r', 'LineStyle', '--', 'LineWidth', 2, 'DisplayName', '1 nov');
xline(365, 'Color', 'g', 'LineStyle', '--', 'LineWidth', 2, 'DisplayName', '31 dec');
xlim([1,365]);
ylim([5,20]);

plot(x, y_D, 'b-', 'DisplayName', 'polynom'); % Correct DisplayName
title('Andragradspolynom');
xlabel('Dag på året');
ylabel('Soltid (timmar)');
legend(); % Automatic legend - no arguments needed
grid on;

y_358 = polyval(p_D, 358);
% print y(358)
fprintf('y(358) = %.2f\n', y_358);