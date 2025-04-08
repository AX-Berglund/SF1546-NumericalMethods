
% funktion för att hitta värde kring interpolerade värdet 
function yval = find_xy_val(z22,t11,t00,step,idx_max)
    % t00 - tvärdet vi söker y-värdet i
    % index för intressanta vektorvärden
    
    z_vect =[z22(idx_max-step),z22(idx_max),z22(idx_max+step)];
    t_vect =[t11(idx_max-step),t11(idx_max),t11(idx_max+step)];

    yval = interpol_quad2(t_vect,z_vect,t00);

end