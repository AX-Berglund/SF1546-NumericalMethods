
% 1) Skapa en vektor av x‐värden från 0 till t.ex. 1e-4
x_min = 0;
x_max = 1e-4;
N = 200;                         % Antal punkter
xvals = linspace(x_min, x_max, N);

% 2) Beräkna funktionen y = exp(-(x/5).^3) / 625 för alla dessa punkter
yvals = exp(-(xvals/5).^3) / 625;

% 3) Plotta
figure;
plot(xvals, yvals, 'bo-','LineWidth',1.2); 
grid on;
xlabel('x');
ylabel('y');
title('y = exp(-(x/5)^3) / 625, nära x=0');
