% Uppgift 7a: Beräkning av integralen med quad och integral
clear; clc;

fprintf('\n\n Uppgift 7a - Numerisk integration med quad och integral: \n\n');

% Definiera integranden f(x)
f = @(x) 153 * exp(-((11*x - pi) / 0.004).^2);

% Integrationsgränser
a = 0.2;
b = 0.3;

fprintf("a: %.2f\n", a)
fprintf("b: %.2f\n\n", b)

% plot - ser en tydlilg topp mellan 0 och 1
x = linspace(a, b, 1000);
y = f(x);

figure;
plot(x, y, 'b-', 'LineWidth', 2);
xlabel('x');
ylabel('f(x)');
title('Plot av integranden f(x)');
grid on;

% studera toppen, printa xvärdet för maxvärdet
[max_y, max_index] = max(y);
max_x = x(max_index);
fprintf('Maxvärdet av f(x) är %.2e och uppnås vid x = %.5f\n\n', max_y, max_x);





% Beräkna integralen med quad (äldre)
I_quad = quad(f, a, b, 1e-9);

% Beräkna integralen med integral (nyare)
I_integral = integral(f, a, b, 'RelTol', 1e-9, 'AbsTol', 1e-12);

% Beräkna skillnaden mellan metoderna
difference = abs(I_quad - I_integral);

% Skriv ut resultaten
fprintf('Resultat från quad():     %.15e\n', I_quad);
fprintf('Resultat från integral(): %.15e\n', I_integral);
fprintf('Skillnad mellan metoderna: %.15e\n', difference);
fprintf('Skillnad mellan metoderna är alltså väldigt liten\n');


% Kontrollera om skillnaden är acceptabel
if difference < 1e-8
    fprintf('Metoderna ger överensstämmande resultat med minst 8 korrekta siffror.\n');
else
    fprintf('Varning! Metoderna skiljer sig mer än tillåtet fel på 10^-8.\n');
end

% Spara resultaten i en textfil
fileID = fopen('question7a_results.txt', 'w');
fprintf(fileID, 'Resultat från quad():     %.15e\n', I_quad);
fprintf(fileID, 'Resultat från integral(): %.15e\n', I_integral);
fprintf(fileID, 'Skillnad mellan metoderna: %.15e\n', difference);
fprintf(fileID, 'Skillnad mellan metoderna är alltså väldigt liten\n');

fclose(fileID);

fprintf('\nResultatet har sparats i question7a_results.txt\n');



