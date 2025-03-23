function [rot, t_n_list] = SekantMetod( f, x1, tol)     
    % SekantMetod: finner roten via  Sekant-metoden
    % 
    % In:
    %   f   - funktion f(x)    
    %   x0  - inital gissning på rot
    %   x1  - andra initala gissning på rot
    %   t0  - inital gissning på korrektions tillskott
    %   tol - tolerans för error (default 1e-8)
    %
    % Ut:
    %   rot         - slutgiltig rot
    %   t_n_list    - lista med korr termer

    if nargin < 3 % Om ingen tolerans given
        tol = 1e-8; % Default tolerans
    end
    
    %Initierar variabler  (relativt godtyckligt)
    x_prev = x1 + 1;    % Föregående x värde (x0)
    x = x1;         % Nuvarande x värde (x1)
    f_prev = f(x_prev); % f(x0)    
    t_prev=.1;
    t_prev_prev=0.1;

    t_n_list = [];  % Lista för att spara korrektionstermer    

    iteration = 0;

    % Printa en rubrik    
    fprintf('%s Sekant-metoden \n',repmat(' ' , 1 , 30) );    
    fprintf('%s\n', repmat('-', 1, 80));
    fprintf(" Iter |     x      |    f(x)    |t: korr-term| konverg. K |    Prop    |\n");    
    fprintf('%s\n', repmat('-', 1, 80));        
    
    format short e
    while abs(x-x_prev)>tol
        
        f_n=f(x); %Beräknar nuvarande funktionsvärdet
    
        t_n= f_n *  ( x - x_prev ) ./ ( f_n - f_prev ); % Sekantmetodens ekvation
        
        t_n_list = [t_n_list , t_n]; % Sparar tn         
        %t_n_list{end+1}=t_n; 
        
        prop=t_n/(t_prev);
    
        k= t_n / ( t_prev * t_prev_prev );
    
        %disp([x f_n t_n k prop]) 
    

        fprintf('%5d | %10.3e | %10.3e | %10.3e | %10.3e | %10.3e |\n', iteration, x, f_n, t_n, k, prop);


        % Tar ett steg: n -> n+1
        x_prev = x;
        f_prev = f_n; 
        t_prev_prev = t_prev;
        t_prev = t_n;
        
        x=x-t_n;           
        iteration = iteration+1;
    
    end
    rot = x;
    fprintf('Resulterande rot : x = %g \n %s\n', rot, repmat('-', 1, 80)); 
end


