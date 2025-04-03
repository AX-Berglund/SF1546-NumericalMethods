% Uppgift 6f: Beräkning av den totala felgränsen
clear; clc;

fprintf('\n\n Uppgift 6f - Skattning av den totala felgränsen: \n\n');

% Läs in trunkeringsfelet från föregående beräkning
E_trunk = 1.246524e-09; % Trunkeringsfelet från Richardson-extrapoleringen

% Felet från att vi kapar svansen (från tidigare undersökningar)
E_svans = 6.0526e-9; % Svansens bidrag

% Totalt fel
E_tot = E_trunk + E_svans;

% Skriv ut och spara resultatet
fprintf('\n Felgräns: \n\n');
fprintf('E_trunk + E_svans = %g + %g = %g\n', E_trunk, E_svans, E_tot);
fprintf('\n -> E_tot = %g\n', E_tot);

% Spara resultatet i en textfil
fileID = fopen('question6f_results.txt', 'w');
fprintf(fileID, 'Feluppskattning:\n');
fprintf(fileID, 'E_trunk = %g\n', E_trunk);
fprintf(fileID, 'E_svans = %g\n', E_svans);
fprintf(fileID, 'E_tot = %g\n', E_tot);
fclose(fileID);

% Kontrollera om felet är acceptabelt
if E_tot < 1e-8
    fprintf('\n Felgränsen är acceptabel! (Fel < 10^-8)\n');
else
    fprintf('\n Felgränsen är för stor! Justering av numerisk integration kan behövas.\n');
end

fprintf('\nResultatet har sparats i question6f_results.txt\n');
