
%function [T , h] = TrapetsRegel( f, a , b , n )
function T  = TrapetsRegel( f, a , b , h )

    % TrapetsRegel för att beräkna integral av f i intervallet a -> b
    % 
    % In:
    %   f   - funktion f(x)
    %   a   - nedre gräns
    %   b   - övre gräns
    %   n   - antal steg
    %
    % Ut:
    %   resultat - beräknat värde på integralen
    %   h - steglängd
    
    
    %n = (b - a) / h;

    %x = linspace(a, b, n+1);
    x = a: h: b;
    y = f(x);
    %h = (b - a) / n;
    

    T = h * ( sum(y) - 0.5* (y(1) + y(end))  ); % Trapetsformeln

end