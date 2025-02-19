% A) Beräkna interpolationspolynom

% Intuition: dra en enda linje som går exakt genom alla punkter, utan att missa en enda punkt.

p = polyfit(datum, soltid, length(datum)-1);

% Beräkna värden
y = polyval(p, x);

% Plot
figure;
plot(datum, soltid, 'ro', 'MarkerFaceColor', 'r');
hold on;
xlim([1,365]);
plot(x, y, 'b-');
title('Interpolationspolynom');
xlabel('Dag på året');
ylabel('Soltid (timmar)');
legend('Data', 'Interpolationspolynom');
grid on;
