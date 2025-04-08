clear all, close all, clf
%bordsraket
v_yx = 21; %hastighet initialt
teta = deg2rad(81); % vinkel initialt
h=0.01;
F=1; %kraften
t1=0;
t2=0.08;
tend=4;
initial_force = 1;
initial_component = 1;  % Component index to evaluate error on

% (z1, t_vals1) - h
% (z2, t_vals2) - h/2
% (z3, t_vals3) - h/4


[sol_h, sol_h2, sol_h4, time_h, time_h2, time_h4, error_summary] = RocketMan(t1, t2, tend, h, initial_force, v_yx, initial_component, teta);


% sol_h (x, y, x', y') 

% 
% Plotta lösningen
plot(sol_h(1,:), sol_h(2,:), 'b'); 
xlim([-1,10])
ylim([-18,18]);
yline(0,'-k');
xlabel('x-position (m)'); 
ylabel('y-position (m)');
title('Raketens bana i x-y planet');


sol_h 