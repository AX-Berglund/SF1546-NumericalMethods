% 3 a) - Bestäm rötterna till ekvationen i föregående uppgift med sekantmetoden. 

% Inställningar
tol = 1e-8;

% Öppna fil för att skriva x0, x1 och rötterna
fileID = fopen('question3b.txt', 'w');

% Fall: (x0, x1) startvärden
cases = [
    -1.5, -1.3;
    -0.3, -0.26;
     0.29, -0.29;
     4, 6
];

% Spara resultat i variabler för utskrift
roots = zeros(size(cases, 1), 1);
corrections_list = cell(size(cases, 1), 1);

for i = 1:size(cases, 1)
    x0 = cases(i, 1);
    x1 = cases(i, 2);
    
    % Kör sekantmetoden
    [root, corrections] = sekantmetod(@f, x0, x1, tol);
    
    % Spara resultat
    roots(i) = root;
    corrections_list{i} = corrections;
    
    % Skriv till fil
    fprintf(fileID, 'Fall %d: x0 = %.2f, x1 = %.2f, Rot = %.8f\n', i, x0, x1, root);
    
    % Skriv till kommandofönstret
    fprintf('Fall %d: Rot = %.8f\n', i, root);
end

% Stäng filen
fclose(fileID);

% Visualisera konvergens för varje fall
figure;
hold on;
for i = 1:size(cases, 1)
    loglog(corrections_list{i}, 'o-', 'DisplayName', sprintf('Fall %d', i));
end
xlabel('Iteration');
ylabel('Correction term');
title('Konvergensanalys för Sekantmetoden');
legend show;
grid on;
