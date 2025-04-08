function [rooten,iterna] = find_root_secant(f_unc,t_start0,t_start1,tol)
    iteration=0;
    while abs(t_start1-t_start0)>tol && iteration<31
        t = ((t_start1-t_start0)/(f_unc(t_start1)-f_unc(t_start0)));
        t_next = t_start1 -t*f_unc(t_start1);
        t_start0 = t_start1;
        t_start1 = t_next;
        iteration = iteration+1;
    end
    rooten = t_start1;
    iterna = iteration;

end