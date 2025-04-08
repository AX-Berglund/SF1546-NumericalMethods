%funktion för interpolation newton kvadratisk
function f_inter3 = interpol_Newton_quad2(tvalue2,yvalue2,t2)
    t_11 = tvalue2(1); y_11 = yvalue2(1);
    t_21 = tvalue2(2); y_21 = yvalue2(2);
    t_31 = tvalue2(3); y_31 = yvalue2(3);
    A=[1,0,0;1,(t_21-t_11),0;1,(t_31-t_11),(t_31-t_11)*(t_31-t_21)];
    b=[y_11;y_21;y_31];
    c=A\b;
    f_inter3 = c(1)+c(2)*t2+c(3)*t2^2;
end