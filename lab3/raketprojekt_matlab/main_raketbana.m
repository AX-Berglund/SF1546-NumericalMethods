clear all; close all; clf;

% Initieringsvärden
v_yx = 21;
teta = deg2rad(81);
h = 0.01;
F = 1;
t1 = 0;
t2 = 0.08;
tend = 4;

% Simulering av raketens bana
[z1,z2,z3,t_vals1,t_vals2,t_vals3,Error] = Rocketman(t1,t2,tend,h,F,v_yx,1,teta);
graderVektor = getdegvec(t_vals1, h, z1, teta);

% Felanalys
ord1 = Error(2,4);
ord2 = Error(3,4);
delta11 = Error(2,2);
delta12 = Error(3,2);
delta21 = Error(2,3);
delta22 = Error(3,3);

fprintf('Ordning nr 1 = %.4f\n', ord1);
fprintf('Ordning nr 2 = %.4f\n', ord2);
fprintf('Felet första halvering i första delen = %.13f\n', delta11);
fprintf('Felet andra halvering i första delen = %.13f\n', delta12);
fprintf('Felet första halvering i andra delen = %.13f\n', delta21);
fprintf('Felet andra halvering i andra delen = %.13f\n', delta22);

% Beräkna tidpunkt och position för högsta punkten
[t_for_ymax,~] = find_t_between(z3(4,:), t_vals3, 1, 0.0001, 1e-6);
[~, itera] = find_vector_max(z3(2,:));
ymax = find_xy_val(z3(2,:), t_vals3, t_for_ymax, 1, itera);

% Beräkna nedslagsplats
[t_for_impact,~] = find_t_between(z3(2,:), t_vals3, 1, 0.0001, 1e-6);
[~, itera2] = find_vector_zero(z3(2,:));
x_impact = find_xy_val(z3(1,:), t_vals3, t_for_impact, 1, itera2);

% Plotta raketens bana
figure;
plot(z1(1,:), z1(2,:), 'b'); hold on;
plot(z2(1,:), z2(2,:), 'g');
plot(z3(1,:), z3(2,:), 'r');
plot(z3(1,34), z3(2,34), '*-k');
xlim([-1, 10]); ylim([-18, 18]);
yline(0, '-k');
xlabel('x-position (m)');
ylabel('y-position (m)');
title('Raketens bana i x-y planet');
grid on;