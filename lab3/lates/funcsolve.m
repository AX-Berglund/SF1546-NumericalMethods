%funktionen för diffekvationerna
function dzdt = funcsolve(t,z,v,teta)
    %parametrar
    x = z(1);
    y = z(2);
    x_dot = z(3);
    y_dot = z(4);
    g=9.82;
    m0 = 0.05;
    k_x=0.001;
    k_y=k_x;
    k=0.08;
    
    %system av diffekvationer
    dzdt = zeros(4,1);
    dzdt(1) = x_dot;
    dzdt(2) = y_dot;
    dzdt(3) = (F_lyft(t,v)*cos(anglecal(t,x_dot,y_dot,teta)) -k_x*x_dot*sqrt(x_dot^2+y_dot^2))/M(m0,t);
    dzdt(4) = (F_lyft(t,v)*sin(anglecal(t,x_dot,y_dot,teta)) -k_y*y_dot*sqrt(x_dot^2+y_dot^2))/M(m0,t) -g; 

    %dzdt = dzdt';
end