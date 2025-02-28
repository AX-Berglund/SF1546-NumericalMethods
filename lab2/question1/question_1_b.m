% 1 b) 
% Hur många gånger måste steglängden 0.5 halveras i Eulers metod för att man ska säga att Euler-värdet på y(4) har 1 säker decimal? 
% Vilken steglängd är det då?
% Vad blir y(4) (med felgräns)?

% Att en decimal är säker betyder att den inte ändras när vi gör en förfining av beräkningen.

% Uppgift 1b: Hur många halveringar behövs för 1 säker decimal?

clc;
fprintf('\nAnalys för att hitta 1 säker decimal:\n');

h = 0.5;  % Börja med steglängd 0.5
y0 = 2.5;  % Begynnelsevärde
x0 = 0;    % Startpunkt
x_end = 4; % Slutpunkt
y_prev = NaN;  % Första iterationen har ingen jämförelse
decimal_saker = false;
halveringar = 0;

while ~decimal_saker
    % Beräkna y(4) med Eulers metod
    n_steps = (x_end - x0) / h; % antal steg
    x_vals = linspace(x0, x_end, n_steps + 1); 
    y_vals = zeros(1, n_steps + 1);
    y_vals(1) = y0;
    
    %Eulers metod
    for j = 1:n_steps
        y_vals(j + 1) = y_vals(j) + h * f(x_vals(j), y_vals(j));
    end
    
    y_current = y_vals(end);
    
    % Skriv ut resultatet
    fprintf('h = %.6f, y(4) = %.6f\n', h, y_current);
    
    % Kontrollera om första decimalen är stabil
    if ~isnan(y_prev) && (round(y_current, 1) == round(y_prev, 1))
        decimal_saker = true;
    else
        y_prev = y_current;
        h = h / 2; % Halvera steglängden
        halveringar = halveringar + 1;
    end
end

fprintf('\nQ1: Hur många gånger måste steglängden 0.5 halveras i Eulers metod för att man ska säga att Euler-värdet på y(4) har 1 säker decimal?\n');
fprintf('- Svar:\n    Antal halveringar: %d\n', halveringar);

fprintf('\nQ2: Vilken steglängd är det då?\n');
fprintf('- Svar:\n    Steglängden är då: %.6f\n', h);

fprintf('\nQ3: Vad blir y(4) (med felgräns)?\n');
fel = abs(y_prev - y_current);
fprintf('- Svar:\n    y(4) = %.4f ± %.4f\n', y_current, fel);