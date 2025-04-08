
function [time_valu,indec] = find_t_between(zzval,ttval,step,h,tol)
    [~,index] = find_vector_zero(zzval);
    % zzval - vektorn med alla y-värden
    % ttval - alla tidsvärden
    % ftg är funktionen jag vill hitta nolstället på
    ftg=@(t) find_xy_val(zzval,ttval,t,step,index);
    t0=ttval(index-1)+h;
    t1= ttval(index)-h;
    
    % nollstället för g och antal iterationer i SEKANT
    [time_valu,indec] = find_root_secant(ftg,t0,t1,tol);

end