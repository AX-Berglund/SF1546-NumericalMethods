% Uppgift 5c: Felgräns vid osäkerhet på konstanterna 61 och 3
clear; clc;

% Definiera funktionen f(x)
f = @(x, C) 61*x - ((x.^2 + x + 0.03) ./ (3*x + 1)).^7 - C*x.*exp(-x);
% Derivata av f(x)
df = @(x) 61 - 7 * ((x.^2 + x + 0.03) ./ (3*x + 1)).^6 .* ...
     (((3*x + 1).*(2*x + 1) - (x.^2 + x + 0.03)*3) ./ ((3*x+1).^2)) ...
     - 20 * (exp(-x) - x .* exp(-x));


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


% Startvärden för rötterna
x0_max = 6;
tol = 1e-8;
max_iter = 50;

% Läs in tidigare beräknade rötter från question5a
fileID = fopen('question5a_results.txt', 'r');
data = textscan(fileID, '%*s %*s %*s %*s min rot = %f, max rot = %f');
fclose(fileID);

root_max_orig = data{2}(1);

% ±1% förändring av konstanterna 61 och 3
dC_61 = 0.01 * 61;  % ±1% av 61
dC_3 = 0.01 * 3;    % ±1% av 3

% Beräkna rötter för förändringar i 61
root_max_61_plus = newton_method(@(x, C) f(x, C + dC_61), df, x0_max, 20, tol, max_iter);
root_max_61_minus = newton_method(@(x, C) f(x, C - dC_61), df, x0_max, 20, tol, max_iter);

% Beräkna rötter för förändringar i 3
root_max_3_plus = newton_method(@(x, C) f(x, C + dC_3), df, x0_max, 20, tol, max_iter);
root_max_3_minus = newton_method(@(x, C) f(x, C - dC_3), df, x0_max, 20, tol, max_iter);

% Beräkna felgränser
error_61 = max(abs(root_max_61_plus - root_max_orig), abs(root_max_61_minus - root_max_orig));
error_3 = max(abs(root_max_3_plus - root_max_orig), abs(root_max_3_minus - root_max_orig));
total_error = error_61 + error_3; % Approximerad total felgräns

% Spara resultaten i en fil
fileID = fopen('question5c_results.txt', 'w');
fprintf(fileID, 'Original C = 20: största rot = %.15f\n', root_max_orig);
fprintf(fileID, 'Rötter vid förändring av konstant 61:\n');
fprintf(fileID, 'C +1%% av 61: största rot = %.15f\n', root_max_61_plus);
fprintf(fileID, 'C -1%% av 61: största rot = %.15f\n', root_max_61_minus);
fprintf(fileID, 'Påverkan av ±1%% på 61: ±%.15f\n\n', error_61);

fprintf(fileID, 'Rötter vid förändring av konstant 3:\n');
fprintf(fileID, 'C +1%% av 3: största rot = %.15f\n', root_max_3_plus);
fprintf(fileID, 'C -1%% av 3: största rot = %.15f\n', root_max_3_minus);
fprintf(fileID, 'Påverkan av ±1%% på 3: ±%.15f\n\n', error_3);

fprintf(fileID, 'Total uppskattad felgräns: ±%.15f\n', total_error);
fclose(fileID);

% Öppna textfilen automatiskt i MATLAB för att visa resultaten
open('question5c_results.txt');
