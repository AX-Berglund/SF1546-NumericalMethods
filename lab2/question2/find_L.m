
function [L_opt, last_diff] = find_L(V_target, L0, L1, tol)
    % Hittar axellängden L där volymen blir V_target med sekantmetoden.
    % V_target = önskad volym
    % L0, L1 = initiala gissningar för L
    % tol = tolerans

    % Definiera funktionshandle för volymdifferens
    f = @(L) computeVolume(L, 100, 'RK4', true) - V_target;

    % Anropa den generiska sekantmetoden
    [L_opt, last_diff] = sekantMetod(f, L0, L1, tol, 50);
end
