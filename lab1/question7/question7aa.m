%% Exempel på MATLAB-kod för uppgift 7 i Lab1
clear; clc;

% Definiera integranden som en anonym funktion:
fun = @(x) 153 * exp(-((11*x - pi)/0.004).^2);

% ================================
% 1) Enkel anrop med 'integral'
% ================================
AbsTol = 1e-12;
RelTol = 1e-12;

% Beräkning med integral
I_integral = integral(fun, 0, 6, 'AbsTol', AbsTol, 'RelTol', RelTol);

% Skriv ut resultatet med många decimaler
fprintf('Resultat med integral:\n   %.15f\n', I_integral);


% ===========================
% 2) Beräkning med 'quad'
% ===========================
% Obs: 'quad' är en äldre funktion i MATLAB, men fungerar fortfarande.
% Den femte parametern anger toleransen.
I_quad = quad(fun, 0, 6, 1e-12);

fprintf('Resultat med quad:\n      %.15e\n', I_quad);


% =====================================
% 3) Manuell uppdelning av intervallet
% =====================================
% Eftersom integranden är starkt koncentrerad kring x ~ pi/11,
% kan man dela upp [0,6] så att vi använder finare mesh nära toppen.

xMid = 0.28;    % Nedre gräns för det "centrala" intervallet
xMid2 = 0.29;   % Övre gräns för det "centrala" intervallet

% Integrera styckevis för att jämföra
I1 = integral(fun, 0,      xMid,  'AbsTol',1e-12,'RelTol',1e-12);
I2 = integral(fun, xMid,   xMid2, 'AbsTol',1e-12,'RelTol',1e-12);
I3 = integral(fun, xMid2,  6,     'AbsTol',1e-12,'RelTol',1e-12);

I_piecewise = I1 + I2 + I3;

fprintf('\nResultat med uppdelat intervall:\n   %.15f\n', I_piecewise);

% =================
% 4) Jämförelser
% =================
diff_integral_piecewise = abs(I_integral - I_piecewise);
fprintf('\nSkillnad integral - styckvis: %g\n', diff_integral_piecewise);

diff_quad_integral = abs(I_quad - I_integral);
fprintf('Skillnad quad - integral:    %g\n\n', diff_quad_integral);

% I praktiken ska alla dessa tre metoder ge praktiskt taget samma
% resultat (runt ~0.0986129...), med mycket små skillnader < 1e-12
