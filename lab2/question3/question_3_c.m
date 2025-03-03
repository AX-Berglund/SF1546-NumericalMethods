clc; clear; close all;

% Parametrar för pendelrörelsen
g = 9.81;      % Tyngdaccelerationen (m/s^2)
L = 2.5;       % Pendelns längd (m)
phi0 = 6*pi/7; % Begynnelsevinkel (rad)
omega0 = 0.8;  % Begynnelsehastighet (rad/s)
T_final = 10;  % Total simuleringstid (sekunder)

% Definiera tidsintervallet för simuleringen
tspan = [0, T_final]; 

% Initialvillkor för systemet
% y0(1) = initialvinkel phi
% y0(2) = initial vinkelhastighet omega
y0 = [phi0; omega0]; 

% ode45 MATLAB-funktion använder en adaptiv Runge-Kutta-metod av 4:e och 5:e ordningen
% för att lösa ordinära differentialekvationer numeriskt.
%
% Den tar in:
% - En funktion som beskriver differentialekvationen (här `pendelODE`)
% - Ett tidsintervall (tspan)
% - Ett initialt tillståndsvektor (y0)
%
% ode45 returnerar:
% - En vektor `t` med tidpunkter där lösningen beräknats
% - En matris `y` där varje rad motsvarar lösningen vid en viss tidpunkt
[t, y] = ode45(@(t, y) pendelODE(t, y, g, L), tspan, y0);

% ode45 arbetar adaptivt och anpassar steglängden baserat på felet i beräkningen.
% Det innebär att den tar längre steg där lösningen är jämn och kortare steg där den ändras snabbt.

% Kör animation av pendelns rörelse
pendelAnimering(t, y(:,1), L);
