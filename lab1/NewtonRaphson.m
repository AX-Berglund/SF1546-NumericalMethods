function rot = NewtonRaphson( f, df_dx , x0 , t0 , tol)

    % NewtonRaphson finn roten via  Newton-Raphson metod
    % 
    % In:
    %   f   - funktion f(x)
    %   df  - funktion för derivata f'(x)
    %   x0  - inital gissning på rot
    %   t0  - inital gissning på korrektions tillskott
    %   tol - tolerans för error (default 1e-8)
    %
    % Ut:
    %   rot - slutgiltig rot

    if nargin < 5 % Om ingen tolerans given
        tol = 1e-8; % Default tolerans
    end
    

    %Initierar variabler x=input av funktion
    % Val av x1,x2,x3,x4
    x=x0;
    t=t0;
    %x=1;
    rel_fel=1;
    
    fprintf('\n%s Newton-Raphson metod \n',repmat(' ' , 1 , 30) ); 
    fprintf('%s\n', repmat('-', 1, 80));
    fprintf(" Iter |     x      |    f(x)    |    f'(x)   |      t     |   Lin    |   Kvad   |\n");
    fprintf('%s\n', repmat('-', 1, 80));

    format short         
    
    iteration = 0;
    %Iterativ metod med Newton raphson
    while abs(rel_fel)>tol
        fx  = f(x);          % beräkna f  av x  
        dfx_dx = df_dx(x);   % beräkna f' av x  

        %Newton Raphsons metod
        g=t; % Spara förra värdet
        t = fx./dfx_dx;  % beräkna nuvarande korrektions term
        
        lin  = t / g;       % Linjär konvergens
        kvad = t / (g^2);  % kvadratisk konvergens
        
        % Skriv ut resultat               
        fprintf('%5d | %10.2e | %10.2e | %10.2e | %10.2e | %8.4f | %8.4f |\n', iteration, x, fx, dfx_dx, t, lin, kvad);

        % Uppdatera värden
        x_next = x - t;         
        rel_fel = (x_next-x) / x_next;
        x=x_next; 
        iteration = iteration + 1;
    end;    
    % Skriv ut rot
    rot = x;
    fprintf('%s\n', repmat('-', 1, 80)); 
end