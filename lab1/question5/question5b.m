% Uppgift 5: Tillförlitlighetsanalys av rötter vid förändring av konstanter

% Uppgift 5b: Effekt av 1% minskning av konstanten 20 på rötterna
clear; clc;

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

% Läs in tidigare beräknade rötter från question5a
fileID = fopen('question5a_results.txt', 'r');
data = textscan(fileID, '%*s %*s %*s %*s min rot = %f, max rot = %f');
fclose(fileID);

root_min_orig = data{1}(1);
root_max_orig = data{2}(1);

% Beräkna rötter för C = 19.8 (-1%)
C_minus = 19.8;
root_min_minus = newton_method(f, df, x0_min, C_minus, tol, max_iter);
root_max_minus = newton_method(f, df, x0_max, C_minus, tol, max_iter);

% Beräkna procentuell förändring i rötterna
change_min_minus = 100 * (root_min_minus - root_min_orig) / root_min_orig;
change_max_minus = 100 * (root_max_minus - root_max_orig) / root_max_orig;

% Se om det är en procentuell ökning eller minskning
if change_min_minus >= 0
    min_text = sprintf("ÖKAR med %.5f%%", change_min_minus);
else
    min_text = sprintf("MINSKAR med %.5f%%", -change_min_minus); % sätt minus för att vi definierar minskning
end

if change_max_minus >= 0
    max_text = sprintf("ÖKAR med %.5f%%", change_max_minus);
else
    max_text = sprintf("MINSKAR med %.5f%%", -change_max_minus); % sätt minus för att vi definierar minskning
end

% Spara resultaten i en fil
fileID = fopen('question5b_results.txt', 'w');
fprintf(fileID, 'Original C = 20: min rot = %.15f, max rot = %.15f\n', root_min_orig, root_max_orig);
fprintf(fileID, 'C = 19.8  (-1%%): min rot = %.15f, max rot = %.15f\n\n', root_min_minus, root_max_minus);
fprintf(fileID, 'Procentuell förändring vid -1%% i C:\n');
fprintf(fileID, 'Minsta roten  %s\n', min_text);
fprintf(fileID, 'Största roten %s\n\n', max_text);

% Påverkas båda rötterna lika mycket?
if abs(change_min_minus - change_max_minus) < 1e-5
    fprintf(fileID, 'Båda rötterna påverkas ungefär lika mycket.\n');
else
    fprintf(fileID, 'Båda rötterna påverkas olika mycket.\n');
end

% Påverkas de åt samma håll?
if sign(change_min_minus) == sign(change_max_minus)
    fprintf(fileID, 'Båda rötterna förändras åt samma håll.\n\n');
else
    fprintf(fileID, 'Rötterna förändras i olika riktningar.\n\n');
end

fprintf(fileID, 'e^-x termen försvinner för större x värden.\n');

fclose(fileID);

% Öppna textfilen automatiskt i MATLAB för att visa resultaten
open('question5b_results.txt');
