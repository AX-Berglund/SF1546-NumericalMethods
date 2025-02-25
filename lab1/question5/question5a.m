% Uppgift 5: Tillförlitlighetsanalys av rötter vid förändring av konstanter


% Uppgift 5a: Effekt av 1% ökning av konstanten 20 på rötterna
clear; clc;


% a) 
% Antag att konstanten som ges som 20 i ekvationen i uppgift 2 ökas med 1.0%. 
% Hur många procent påverkas den minsta positiva roten?
% Hur många procent påverkas den största positiva roten? 
% Påverkas båda rötterna lika mycket? 
% Påverkas de åt samma håll?




% Definiera funktionen f(x)
f = @(x, C) 61*x - ((x.^2 + x + 0.03) ./ (3*x + 1)).^7 - C*x.*exp(-x);

% Newtons metod
function root = newton_method(f, df, x0, C, tol, max_iter)
    x = x0;
    for i = 1:max_iter
        fx = f(x, C);
        dfx = df(x);
        if abs(dfx) < 1e-10
            warning('Derivatan nära noll vid x = %.15f', x);
            break;
        end
        x_new = x - fx / dfx;
        if abs(x_new - x) < tol
            root = x_new;
            return;
        end
        x = x_new;
    end
    root = NaN; % Returnera NaN om ingen konvergens
end

% Derivata av f(x)
df = @(x) 61 - 7 * ((x.^2 + x + 0.03) ./ (3*x + 1)).^6 .* ...
     (((3*x + 1).*(2*x + 1) - (x.^2 + x + 0.03)*3) ./ ((3*x+1).^2)) ...
     - 20 * (exp(-x) - x .* exp(-x));

% Startvärden för rötterna
x0_min = 0.1;
x0_max = 6;
tol = 1e-8;
max_iter = 50;

% Beräkna rötter för originalkonstanten C = 20
C_original = 20;
root_min_orig = newton_method(f, df, x0_min, C_original, tol, max_iter);
root_max_orig = newton_method(f, df, x0_max, C_original, tol, max_iter);

% Beräkna rötter för C = 20.2 (1% ökning)
C_plus = 20.2;
root_min_plus = newton_method(f, df, x0_min, C_plus, tol, max_iter);
root_max_plus = newton_method(f, df, x0_max, C_plus, tol, max_iter);

% Beräkna procentuell förändring i rötterna
change_min_plus = 100 * (root_min_plus - root_min_orig) / root_min_orig;
change_max_plus = 100 * (root_max_plus - root_max_orig) / root_max_orig;

% Se om det är en procentuell ökning eller minskning
if change_min_plus >= 0
    min_text = sprintf("ÖKAR med %.5f%%", change_min_plus);
else
    min_text = sprintf("MINSKAR med %.5f%%", -change_min_plus); % sätt minus för att vi definierar minskning
end

if change_max_plus >= 0
    max_text = sprintf("ÖKAR med %.5f%%", change_max_plus);
else
    max_text = sprintf("MINSKAR med %.5f%%", -change_max_plus); % sätt minus för att vi definierar minskning
end


% Spara resultaten i en fil
fileID = fopen('question5a_results.txt', 'w');
fprintf(fileID, 'Original C = 20: min rot = %.15f, max rot = %.15f\n', root_min_orig, root_max_orig);
fprintf(fileID, 'C = 20.2 (+1%%): min rot = %.15f, max rot = %.15f\n\n', root_min_plus, root_max_plus);
fprintf(fileID, 'Procentuell förändring vid +1%% i C:\n');
fprintf(fileID, 'Minsta roten %s\n', min_text);
fprintf(fileID, 'Största roten %s\n\n', max_text);

% Påverkas båda rötterna lika mycket?
if abs(change_min_plus - change_max_plus) < 1e-5
    fprintf(fileID, 'Båda rötterna påverkas ungefär lika mycket.\n');
else
    fprintf(fileID, 'Båda rötterna påverkas olika mycket.\n');
end

% Påverkas de åt samma håll?
if sign(change_min_plus) == sign(change_max_plus)
    fprintf(fileID, 'Båda rötterna förändras åt samma håll.\n');
else
    fprintf(fileID, 'Rötterna förändras i olika riktningar.\n');
end

fclose(fileID);

% Öppna textfilen automatiskt i MATLAB för att visa resultaten
open('question5a_results.txt');
