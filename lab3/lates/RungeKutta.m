%RUnge kutta som löser diffekva
function [z_val,t_vals] = RungeKutta(a,b,N,h,v,x0,y0,xdot0,ydot0,teta)
    
    t_vals = a:h:b;
    N = length(t_vals);
    z = zeros(4,N);
    
    z(:,1) = [x0; y0; xdot0; ydot0];%z ären matris med x,y, xprick och yprick
    %Runge-kutta
    for i = 1:N-1
        t = t_vals(i);
        z_i = z(:,i);
        k1 = funcsolve(t,z_i,v,teta);
        k2 = funcsolve(t + h/2 ,z_i + (h/2)*k1,v,teta);
        k3 = funcsolve(t + h/2 ,z_i + (h/2)*k2,v,teta);
        k4 = funcsolve(t + h ,z_i + h*k3,v,teta);
        z(:,i+1) = z_i + (k1 + 2*k2 + 2*k3 + k4)*(h/6);
        
    end

    z_val = z;

end