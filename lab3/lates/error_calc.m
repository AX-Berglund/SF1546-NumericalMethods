
function [E,pp] = error_calc(zz,nr)
    %nr är vilken del av matrisen alltså läget eller farten
    E = zeros(3,1);
    z11 = zz{1};
    z22 = zz{2};
    z33 = zz{3};
    pp= (z11(nr,end)-z22(nr,end))/(z22(nr,end)-z33(nr,end));
    E(2) = z22(nr,end)-z11(nr,end);
    E(3) = z33(nr,end)-z22(nr,end);
end