% E: 1 april - 1 september
index_E = 4:9;

% polyfit löser minsta kvadrat-problemet och returnerar koefficienterna a0 a1 a2
p_E = polyfit(datum(index_E), soltid(index_E), 2); 

% polyval används för att utvärdera det funna polynomet vid olika värden av x
y_E = polyval(p_E, x);

% Plot for E
figure;

plot(datum, soltid, 'ro', 'MarkerFaceColor', 'r', 'DisplayName', 'Data');
hold on;
plot(x, y_E, 'b-', 'DisplayName', 'polynom');xline(90, 'Color', 'r', 'LineStyle', '--', 'LineWidth', 2, 'DisplayName', '1 april');
xline(244, 'Color', 'g', 'LineStyle', '--', 'LineWidth', 2, 'DisplayName', '1 september');
title('Andragradspolynom (1 apr - 1 sep)');
xlabel('Dag på året');
ylabel('Soltid (timmar)');
xlim([1,365]);
legend();
grid on;