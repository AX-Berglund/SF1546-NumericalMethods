% Uppgift 6c: Approximation och analytisk integralberäkning nära x = 0
clear; clc;

% Approximation av f(x) för små x:
% e^(-(x/5)^3) approximeras som 1 - (x/5)^3 med taylor utveckling för e^y
% runt y = 0
% vilket förenklar integranden till en konstant 1/5^4.
f_approx = 1 / 5^4;

% Definiera gränser för det lilla x-området
a = 0;
b = 1e-4;

% Analytisk beräkning av integralen av en konstant i område a-b
I_0 = (b * f_approx) - (a * f_approx);

% Skriv ut och spara resultatet
fprintf('Integralen för små x approximeras till: %.9f\n', I_0);

% Spara resultatet i en textfil
fileID = fopen('question6c_results.txt', 'w');
fprintf(fileID, 'Approximerad integral nära x = 0: %.9f\n', I_0);
fclose(fileID);

% Bekräfta att filen har sparats korrekt
fprintf('Resultatet har sparats i question6c_results.txt\n');
