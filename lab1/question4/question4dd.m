% C) Splines-approximation genom samtliga punkter.  
y_spline = spline(datum, soltid, x);

% Intuition: jämn linje som går genom varje punkt. Mjuk och naturlig kurva

% Plot
figure;
plot(datum, soltid, 'ro', 'MarkerFaceColor', 'r');
hold on;
xlim([1,365]);
plot(x, y_spline, 'm-');
title('Splines-approximation');
xlabel('Dag på året');
ylabel('Soltid (timmar)');
legend('Data', 'Splines');
grid on;

% Beräkna tiden för dag nummer 358
soltid_358 = spline(datum, soltid, 358);
fprintf('Soltid för dag 358: %.2f timmar\n', soltid_358);