clear; clc;
sep_len = 84;
separator = repmat('_', 1, sep_len);
halv_sep = repmat('_', 1, sep_len/3); % Egentligen tredjedel
halv_sep_blank = repmat(' ', 1, sep_len/3);
kvart_sep = repmat('_', 1, sep_len/4);
sep_stark = repmat('*', 1, sep_len);
%____________________________ Numme Labb 1_______________________________
% Uppg 1 - Linjärt ekvationssystem

% 1a)
fprintf('\n%s\n\n%s Uppg 1 a) %s\n', sep_stark, halv_sep ,halv_sep);

%Vi ska lösa ekvationssystemet Ax=b
%Deffinierar matris A
A=[1 2 3 0;
  0 4 5 6;
  1 1 -1 0;
  1 1 1 1];

b=[7 6 5 4]';

%Definierar x-vektorn
%x=[x1 x2 x3 x4]'

x=A\b;

%fprintf('x ->%d \n',x);
fprintf('Backslash ger: \n x= \n');
for i = 1:length(x)
    fprintf('  [ %.3f ]\n', x(i)); 
end



% 1b)
%Beräknar residualvektorn r
r=b-A*x;

fprintf('The residual vector r becomes: \n r= \n');
for i = 1:length(r)
    fprintf('  [ %e ]\n', r(i)); % Adjust %f for desired formatting
end


% 1c)
% residualvektorn blir inte exakt 0 pga att 
% vektordivisionen inte beräknar värdena exakt utan 
% dessa approximeras, och har inte med fullständiga 
% värdet och därmed blir inte b exakt lika med A*x

%% Uppg 2
%b)
% Initierar ett figurfönster för att presentera plottar.
figure();

% Definierar funktionens definitionsmängd genom att definitera: 
% x inom [-5 , 7.5] , med steglängd 1e-5
x= -5:1e-5:7.5;

% Definierar funktionen f(x)
f = @(x) 61*x - ((x.^2 + x + 0.03)./(3*x + 1)).^7 - 20*x.*exp(-x);


% Ger funktionens värdemängd, y är resultatet av x genom funktionen.
% Skapar en vektor av samma längd
y = f(x);

% Skapar 5 subplottar, 4 för rötter och en för funktionen i helhet.
subplot(3, 2, 1);
    plot(x, y);
        title('Rot 1');
        xlim([-1.15, -1.1]);
        ylim([-1, 1]);
        yline(0, 'color' ,'k', 'linestyle', ':', 'LineWidth', 1);

subplot(3, 2, 2);
    plot(x, y);
        title('Rot 2');
        xlim([-0.30, -0.28]);
        ylim([-1, 1]);
        yline(0, 'color' ,'k', 'linestyle', ':', 'LineWidth', 1);

subplot(3, 2, 3);
    plot(x, y);
        title('Rot 3');
        xlim([-0.001, 0.001]);
        ylim([-0.05, 0.05]);
        yline(0, 'color' ,'k', 'linestyle', ':', 'LineWidth', 1);

subplot(3, 2, 4);
    plot(x, y);
        title('Rot 4');
        xlim([6.35, 6.45]);
        ylim([-2, 2]);
        yline(0, 'color' ,'k', 'linestyle', ':', 'LineWidth', 1);

subplot(3, 2, 5:6);
    plot(x, y);
        title('y=f(x)');
        xlim([-3, 7]);
        ylim([-300, 300]);        
        yline(0, 'color' ,'k', 'linestyle', ':', 'LineWidth', 1);


%exportgraphics(gcf,'arrayAntennaMeshMew.png','Resolution',300);

% Från plottarna kan rötterna grafiskt lokaliseras i följande:
x1 = -1.15;
x2 = -0.29;
x3 = 1e-2; % ca 0
x4 = 6.34;

x_values = [x1 ,x2 ,x3 ,x4];
fprintf('\n%s\n', separator);

%% c) Ta fram en av rötterna med Newtons Metod.
fprintf('\n%s\n\n%s Uppg 2 c): -> Newtons metod %s\n', sep_stark, halv_sep ,halv_sep);

%f =@(x) 61*x - ( ( x^2 + x + 0.03 ) / ( 3*x + 1 ) )^7  - 20*x*exp(-x);

% Derivera funktionen f över x
df_dx= @(x)  61  -  7* ( (x.^2+x+0.03) ./ (3*x+1) ).^6 *  ( ( (3*x + 1 ).*( 2*x +1 ) - ( x.^2 + x + 0.03 )*(3) ) ./ ( (3*x+1).^2 ) ) - 20*( exp(-x) - x.*exp(-x) );

%Initierar variabler x=input av funktion
% Val av x1,x2,x3,x4
%x0=x3;
t0=1;
tolerans = 1e-8;


rot_resultat = zeros(1, length(x_values));
% Itererar genom de olika rötterna kör newton raphson
for i = 1:length(x_values)    
    x0 = x_values(i);     
    fprintf('  x0 = %.2f \n  ----->', x0 );
    rot_resultat(i) = NewtonRaphson(f , df_dx , x0 , t0 , tolerans );
end

%rot_1_nr=-1.115141590525118e+00;
%rot_2_nr=-2.910130809545486e-01;
%rot_3_nr=5.334146342066178e-13; % typ 0
%rot_4_nr=6.397062994660476e+00;
%rotter=[rot_1_nr rot_2_nr rot_3_nr rot_4_nr];

format long;

% Skriv ut rot kolumn titlar
col_head = {"Rot 1", "Rot 2", "Rot 3", "Rot 4"};

fprintf('\n%s Resulterande rötter \n', halv_sep);
fprintf(' | %8s | %8s | %8s | %8s | \n',col_head{:});
fprintf(' | %8.2g | %8.2g | %8.2g | %8.2g | \n',rot_resultat(:));


% d)
% Kvadratisk konvergens definieras som hastigheten med vilken felet minskar
% det vill säga att en lösningsmetod har kvadratisk konvergens om felet
% minskar kvadratiskt, dvs att felet är proportionellt med kvadraten av det
% föregående felet. Alltså är det mått på hur snabbt metoden närmar sig
% rätt svar.
% 
% lim (n → ∞) |e_(n+1)| / |e_n|^2 = Konstant


%% e)
fprintf('\n%s\n\n%s Uppg 2 e): %s\n\n', sep_stark, halv_sep ,halv_sep);

% Upprepar Newton raphsons och plottar differensen: linjärt och kvadratisk 
% konvergens för att se om det finns något sådant samband

%Initierar variabler x=x4 för största roten
x0=x4;
t=1;

NewtonRaphson(f , df_dx , x0 , t0 , tolerans );

rot_NR=x;

% -->  Vi kan se att vi har kvadratisk konvergens då t/t_förra^2 är så gott som konstant



%% Uppg 3 

fprintf('\n%s\n\n%s Uppg 3 a): %s\n\n', sep_stark ,halv_sep ,halv_sep);

% Funktionen f definieras
f = @(x) 61*x - ((x.^2 + x + 0.03)./(3 * x + 1 )).^7 - 20*x.*exp(-x);

tolerans = 1e-8;

% Spara resultaten        
t_n_listor = cell(1, length(x_values)); % Sparar alla korrektions koefficienter
rot_resultat_sekant = zeros(1, length(x_values)); % Sparar rötterna


% Itererar genom de olika rötterna och kör sekant-metoden
for i = 1:length(x_values)    
    x1 = x_values(i);     % Gissning
    fprintf('  x0 = %.2f \n  ----->', x1 );
    [rot, t_n_list] = SekantMetod( f, x1 , tolerans); 
    
    t_n_listor{i} = t_n_list; % Sparar t_n_list
    rot_resultat_sekant(i) = rot;
end

format short ;





%% b) 

fprintf('\n%s\n\n%s Uppg 3 b): %s\n\n', sep_stark ,halv_sep ,halv_sep);


% Skriv ut rot kolumn titlar via col_head (från uppg2)
fprintf('\n%s Resulterande rötter \n', halv_sep);
fprintf(' | %8s | %8s | %8s | %8s | \n',col_head{:});
fprintf(' | %8.2g | %8.2g | %8.2g | %8.2g | \n',rot_resultat(:));
% Ger exakt samma rötter som med newton raphson, men hittar inte -.29


%% c) , d)
% c) Konvergensordning enl. föreläsning:
%   Konvergensordning ca 1.6 (dvs mellan linjär och kvadratisk),
%   superlinjär och subkvadratisk
%   tn ≈ K·(tn−1)^1.6
%   tn = K·tn−1 ·tn−2

%   t[k] = K * t[k-1] ^1.6
%   
%   t[k] = K * t[k-1] * t[k-2]
%   
%   K = t[k] / ( t[k-1]^1.6 )    
%   K = t[k] / ( t[k-1] * t[k-2])

fprintf('\n%s\n\n%s Uppg 3 d): %s\n\n', sep_stark ,halv_sep ,halv_sep);


% Itererar igenom t för att undersöka konvergensordning
t_n_list = t_n_listor{1}; % Väljer den med flest tal


%Skapa en figur för plottning 
figure;
x_range = 1:length(t_n_list);
plot(x_range, t_n_list, "-X" , 'LineWidth', 2, 'MarkerSize', 10) % Plottar t_n 
% Labels and grid
xlabel('Iteration');
ylabel('t');
title('Korrektions koefficient t');
legend('t', 'Location',  'Best', 'FontSize',12);
grid on;
hold off;
    


% Beräknar log av t[n] och t[n-1] för att analysera konvergens (abs diff av t)
log_t_n = log( abs( t_n_list(2:end) ) );   % log av abs av t[n]
log_t_prev = log(abs(t_n_list(1:end-1))); % log av abs av t[n-1]


% linjär regression, ger estimering av konvergens ordning
% log(t[n]) = log( K * t[n-1]^p ) = p * log( t[n-1] ) + log(K) <-> p * x + C 
p_koeff_och_C = polyfit(log_t_prev, log_t_n, 1); % -> p , C
est_p = p_koeff_och_C(1); % Estimerade p <-> lutningen

% Plottar konvergens ordningen via lutningen mellan båda vektorerna
figure;
plot(log_t_prev, log_t_n, 'X-', 'LineWidth', 2, 'MarkerSize', 10);
hold on;
% Plottar linjära regressionen för jämförelse
plot(log_t_prev, polyval(p_koeff_och_C, log_t_prev), '--r', 'LineWidth', 2); 

% Labels and Grid
xlabel('log( | t_{n-1} | )');
ylabel('log( | t_n | )');
title(sprintf(' Konvergens analys (-> p = %.3f)', est_p)); 
legend('t_n', 'Linjär regression', 'Location', 'Best', 'FontSize',12);
grid on;
hold off;

fprintf('\n\n   %s Estimerat p: \n\n %s p = %g \n %s\n', halv_sep_blank ,  halv_sep_blank, est_p, separator);

% Vi kan se att våran estimerade konvergens ordning är nära den väntade!


%% uppg 4 Interpolation och linjära minsta kvadratmetoden

% Matrisen A ger datum: tid (sekunder)

A = [1 32 60 91 121 152 182 213 244 274 305 335 365;
    374 486 633 794 955 1084 1104 998 845 684 527 396 374]';

% Definierar x och y utifrån matrisen 
x = A(:,1);
y = A(:,2);

% Definierar antal dagar
d = 1:1:365;

% Skapar anpassningar
figure()

% A) Interpolationspolynom över alla punkter 
subplot(3,3,1);
    % grad
    grad = length(x) -1;
    
    % Anpassa polynomet till datan
    k1 = polyfit(x,y,grad);
    
    % Skapa polynom med koefficienter
    p1 = polyval(k1,d);
    
    % Plotta
    hold on;
    plot(d,p1);
    plot(x,y,'b.');
    title("Interpolationspolynom genom alla punkter (grad 12)");
    xlabel("Dagar");
    ylabel("Minuter");
    axis([0,365,0,1300]);
    hold on;
    
% B) Styckvis linjär interpolation genom samma punkter 
subplot(3,3,2);
    k2 = interp1(x,y,d,"linear");
    plot(d,k2);
    hold on;
    plot(x,y,'b.');
    title("Styckvis linjär interpolation genom alla punkter");
    xlabel("Dagar");
    ylabel("Minuter");
    axis([0,365,0,1300]);
    hold on;

% C) Splines-approximation genom alla punkter 
subplot(3,3,3);
    k3 = spline(x,y,d);
    plot(d,k3);
    hold on;
    plot(x,y,'b.');
    title("Splines-approximation genom alla punkter");
    xlabel("Dagar");
    ylabel("Minuter");
    axis([0,365,0,1300]);
    hold on;
    
% D) Andragradspolynom mellan 1 juni- 1 augusti
subplot(3,3,4);
    delX = x(6:8);
    delY = y(6:8);
    % Grad 2
    k4 = polyfit(delX,delY,2);
    p2 = polyval(k4,d);
    plot(d,p2);
    hold on;
    plot(x,y,'b.');
    title("2a gradspolynom (1 jun-1 aug)");
    xlabel("Dagar");
    ylabel("Minuter");
    axis([0,365,0,1300]);
    hold on;

% E) Minsta kvadratanpassat andragradspolynom 1 april- 1 september
subplot(3,3,5);
    delX2 = x(4:9);
    delY2 = y(4:9);
    % Grad 2
    k5 = polyfit(delX2, delY2, 2);
    p3 = polyval(k5,d);
    plot(d,p3);
    hold on;
    plot(x,y,'b.');
    title("MK 2a gradspolynom (1 apr-1 sept)");
    xlabel("Dagar");
    ylabel("Minuter");
    axis([0,365,0,1300]);
    hold on;

% F) Minstakvadratanpassat andragradspolynom 1 januari- 31 december
subplot(3,3,6);
    % Grad 2
    k6 = polyfit(x,y,2);
    p4 = polyval(k6,d);
    plot(d,p4);
    hold on;
    plot(x,y,'b.');
    title("MK 2a gradspolynom genom alla punkter");
    xlabel("Dagar");
    ylabel("Minuter");
    axis([0,365,0,1300]);
    hold on;

% G) Minstakvadrat med sinusanpassning
subplot(3,3,7);
    w = 2*pi/365;
    c1 = ones(13,1);
    c2 = cos(w*x);
    c3 = sin(w*x);
    C = [c1,c2,c3];

    %beräknar minsta kvadrat c
    c = (C'*C)^(-1)*(C'*y); % Samma som backslash

    p5 = c(1)+c(2)*cos(w*d)+c(3)*sin(w*d);

    plot(d,p5);
    hold on;
    plot(x,y,'b.');
    title("Minstakvadratanpassad med sinus");
    xlabel("Dagar")
    ylabel("Minuter");
    axis([0,365,0,1300]);

% Uppgiftssvar:
% a)
% I vilken ansats behövdes flest koefficienter beräknas (totalt över hela 
% intervallet)?
% Hur många koefficienter är det?
% I kubisk styckvis interpolation är den interpolerade funktionen en serie 
% kubiska polynom. För att hitta koefficienterna var varje polynom behöves
% krävs det n-1 funktioner då vi har samma antal okända. Varje polynom har 
% sedan 4 koefficienter vilket ger 4(n-1) där n är antalet datapunkter 
% (12). Detta ger i detta fall 44 koefficienter

% b)
% De tre anpassningar som bara behöver tre koefficienter är 
% D) Andragradspolynom mellan 1 juni- 1 augusti
% E) Minsta kvadratanpassat andragradspolynom 1 april- 1 augusti
% F) Minstakvadratanpassat andragradspolynom 1 januari- 31 december
% G) Minstakvadrat med sinusanpassning
% då dessa enbart är ett polynom av grad 2 förutom i G) då denna ger 
% koefficienter amplitud, fasförskjutning och skiftnign i y-led.

% c) 
% För att beräkna den längsta dagen ges att alternativ 
% D) Andragradspolynom mellan 1 juni- 1 augusti. Detta för att det ger en 
% bra anpassning för intervallet där den längsta dagen infaller samt att
% den ger effektiv beräknignsmetod där det enbart krävs 3 koefficienter.

% d)
% Julafton infaller vid dag 358 av 365 vilket sätter krav på anpassningen
% vid ändpunkterna. Här ger
% B) Styckvis linjär interpolation genom samma punkter 
% C) Splines-approximation genom alla punkter 
% G) Minstakvadrat med sinusanpassning
% Här har B) inte nog med prestanda då den enbart är en styckvis 
% interpolation mellan punkterna, den är snabb men inte en bra
% anpassning. Här ger spline den bästa prestandan men har 44 koefficienter
% medan G) ger relativt bra prestanda men med enbart 3 koefficienter.
% Väljer G) som den bästa anpassningen.

% e)
% En potentiell förbättring är att använda D) Andragradspolynom mellan 
% 1 juni- 1 augusti med modifikationen att använda data mellan 1 nov- 31
% dec där julafton ligger i intervallet

subplot(3,3,8);
    delX = x(11:13);
    delY = y(11:13);
    % Grad 2
    k4 = polyfit(delX,delY,2);
    p2 = polyval(k4,d);
    plot(d,p2);
    hold on;
    plot(x,y, 'b.');
    title("2a gradspolynom (1 nov-31 dec )");
    xlabel("Dagar");
    ylabel("Minuter");
    axis([0,365,0,1300]);
    hold on;

% f) Olika metoder ger olika fördelar men för att täcka in flest
% datapunkter med bra prestanda ges av C) Splines-approximation genom 
% alla punkter. Däremot är den inte lika effektiv som de andra metoderna.
% Det går inte att säga att en är bättre än den andra, det beror på vad som
% pritoriteras.


%% Uppgift 5 Tillförlitlighet
fprintf('\n%s\n\n%s Uppg 5 a):  %s\n', sep_stark, halv_sep ,halv_sep);

% f(x) och df(x)/dx
f = @(x) 61*x - ((x.^2 + x + 0.03)./(3*x + 1)).^7 - 20*x.*exp(-x);
df_dx= @(x)  61  -  7* ( (x.^2+x+0.03) ./ (3*x+1) ).^6 *  ( ( (3*x + 1 ).*( 2*x +1 ) - ( x.^2 + x + 0.03 )*(3) ) ./ ( (3*x+1).^2 ) ) - 20*( exp(-x) - x.*exp(-x) );


% Från plottarna i uppg 2
x1 = -1.15;
x2 = -0.29;
x3 = 1e-2; % ca 0
x4 = 6.34;
x_values = [x1 ,x2 ,x3 ,x4];

% Upprepar uträkningen från uppg 2 för att få fram rötter att jämföra med
t0=1; % Initierar 
tolerans = 1e-8;
rot_resultat = zeros(1, length(x_values));
% Itererar genom de olika rötterna kör newton raphson
for i = 1:length(x_values)    
    x0 = x_values(i);     
    fprintf('  x0 = %.2f \n  ----->', x0 );
    rot_resultat(i) = NewtonRaphson(f , df_dx , x0 , t0 , tolerans );
end
%original_rot_resultat = rot_resultat;

% ________________________________ ÖKAR med en procent
konstant = 20*1.01; % Ökar med en procent
% definierar f och df/dx med en procent ökning av konstanten 20
f = @(x) 61*x - ((x.^2 + x + 0.03)./(3*x + 1)).^7 - konstant *x.*exp(-x);
df_dx= @(x)  61  -  7* ( (x.^2+x+0.03) ./ (3*x+1) ).^6 *  ( ( (3*x + 1 ).*( 2*x +1 ) - ( x.^2 + x + 0.03 )*(3) ) ./ ( (3*x+1).^2 ) ) - konstant*( exp(-x) - x.*exp(-x) );

rot_resultat_plus = cell(2, 4); %zeros(1, length(x_values));

% Itererar genom de olika rötterna kör newton raphson
for i = 1:length(x_values)    
    x0 = x_values(i);     
    fprintf('  x0 = %.2f \n  ----->', x0 );
    %rot_resultat_plus(i) = NewtonRaphson(f , df_dx , x0 , t0 , tolerans );

    rot = NewtonRaphson(f , df_dx , x0 , t0 , tolerans );

    rot_resultat_plus{ 1, i} = rot; % sparar rot
    diff = rot - rot_resultat(i);
    rot_resultat_plus{ 2, i} = diff / rot_resultat(i);  % Beräknar relativa skillnaden

end

% Skriv ut rötterna och procentuella förändringen
fprintf('\n%s Resulterande rötter ( 20 -> ++1%% )\n', halv_sep);
fprintf('%s\n', separator);
fprintf('           | %12s | %12s | %12s | %12s | \n',col_head{:});
fprintf('   orig -> | %12.4e | %12.4e | %12.4e | %12.4e | \n%s\n',rot_resultat, separator);
fprintf('   alt  -> | %12.4e | %12.4e | %12.4e | %12.4e | \n',rot_resultat_plus{1 , :});
fprintf('   diff -> | %12.4f | %12.4f | %12.4f | %12.4f | \n',rot_resultat_plus{2 , :});

fprintf('\n\n')
fprintf('Procentuell förändring av x3 = %g %% \n', rot_resultat_plus{2,3}*100)
fprintf('Procentuell förändring av x4 = %g %% \n', rot_resultat_plus{2,4}*100)

format long;
rot_resultat_plus{1 , 3}
rot_resultat_plus{1 , 4}

% a) 
% Den minsta postitiva roten blir 5.360294118255728e-13
% vilket motsvarar en procentuell ändring på ca 0.5 %.

% Den största postitiva roten blir 6.397056504773738
% vilket motsvarar en procentuell MINSKNING på 0.000101451 % 

% Påverkas inte likadant.
% Varför ändringen blir som den blir beror på att kosntanten
% står framför en negativ exponent vilket betyder att den har exponentiellt
% mindre påverkan för högre värden på x





%% b)
fprintf('\n%s\n\n%s Uppg 5 b):  %s\n', sep_stark, halv_sep ,halv_sep);

% ________________________________ MINSKAR med en procent 
konstant = 20*0.99; % Minskar med en procent
% definierar f och df/dx med en procent minsking av konstanten 20
f = @(x) 61*x - ((x.^2 + x + 0.03)./(3*x + 1)).^7 - konstant *x.*exp(-x);
df_dx= @(x) 61 - 7* ( (x.^2+x+0.03) ./ (3*x+1) ).^6 *  ( ( (3*x + 1 ).*( 2*x +1 ) - ( x.^2 + x + 0.03 )*(3) ) ./ ( (3*x+1).^2 ) ) - konstant*( exp(-x) - x.*exp(-x) );
rot_resultat_mindre = cell(2, 4);

% Itererar genom de olika rötterna kör newton raphson
for i = 1:length(x_values)    
    x0 = x_values(i);     
    fprintf('  x0 = %.2f \n  ----->', x0 );
    %rot_resultat_mindre(i) = NewtonRaphson(f , df_dx , x0 , t0 , tolerans );

    rot = NewtonRaphson(f , df_dx , x0 , t0 , tolerans );

    rot_resultat_mindre{ 1, i} = rot; % sparar rot
    diff = rot - rot_resultat(i);
    rot_resultat_mindre{ 2, i} = diff / rot_resultat(i);  % Beräknar relativa skillnaden
end

% Skriv ut rötterna och procentuella förändringen
fprintf('\n%s Resulterande rötter ( 20 -> --1%% )\n', halv_sep);
fprintf('%s\n', separator);
fprintf('           | %12s | %12s | %12s | %12s | \n',col_head{:});
fprintf('   orig -> | %12.4e | %12.4e | %12.4e | %12.4e | \n%s\n',rot_resultat, separator);
fprintf('   alt  -> | %12.4e | %12.4e | %12.4e | %12.4e | \n',rot_resultat_mindre{1 , :});
fprintf('   diff -> | %12.4f | %12.4f | %12.4f | %12.4f | \n',rot_resultat_mindre{2 , :});

fprintf('\n\n')
fprintf('Procentuell förändring av x3 = %g %% \n', rot_resultat_mindre{2,3}*100)
fprintf('Procentuell förändring av x4 = %g %% \n', rot_resultat_mindre{2,4}*100)




format long;
rot_resultat_plus{1 , 3}
rot_resultat_plus{1 , 4}



% b)
% Den minsta postivia roten blir 5.360294118255728e-13 vilket motsvara
% en procentuell MINSKNING på ca 0.5% 

% Den största postivita roten blir 6.397056504773738
% vilket motsvara en procentuell ÖKNING på  0.000101449 % 

% Det går här att se att rötterna ändra
% ungefär lika mycket som i a) fast med omvänt tecken. Detta beror på samma
% förklaring som i a)




%% c)
fprintf('\n%s\n\n%s Uppg 5 c):  %s\n', sep_stark, halv_sep ,halv_sep);


% Antag nu i stället att konstanten 61 i första termen och konstanten 3 i nämnaren i andra termen har en osäkerhet på ±1.0%

% Vi använder störningsräkning!

permutationer = { [0.99, 1] , [1.01, 1] , [1, 0.99] , [1, 1.01] }; % Celler med permutationerna
perm_rot_resultat_head = {'61 * 99%' , '61 * 101%' , '3 * 99%' , '3 * 101%'};
perm_rot_resultat = cell(2, 4);

x0 = x_values(4); % Största roten
x_rot = rot_resultat(4);

for i = 1:length(permutationer)
    vektor = permutationer{i};
    konstant_61 = 61 * vektor(1);
    konstant_3  = 3 *  vektor(2);

    % definierar f och df/dx med en procent minsking av konstanten 20
    f     = @(x) konstant_61*x - ((x.^2 + x + 0.03)./(konstant_3*x + 1)).^7 - 20 *x.*exp(-x);
    df_dx = @(x)  konstant_61  -  7* ( (x.^2+x+0.03) ./ (konstant_3*x+1) ).^6 *  ( ( (konstant_3*x + 1 ).*( 2*x +1 ) - ( x.^2 + x + 0.03 )*(konstant_3) ) ./ ( (konstant_3*x+1).^2 ) ) - 20*( exp(-x) - x.*exp(-x) );      
    
    rot = NewtonRaphson(f , df_dx , x0 , t0 , tolerans );
    
    perm_rot_resultat{ 1, i} = rot; % Sparar rot
    fel = rot - x_rot;
    perm_rot_resultat{ 2, i} = abs(fel); % Beräknar relativa felet
end




% Skriv ut rötterna och procentuella förändringen
%fprintf('\n%s Resulterande rötter \n%s\n', halv_sep, separator);
fprintf('\n%s Största roten (x4) för olika permutationer \n', halv_sep);
fprintf('           | %12s | %12s | %12s | %12s | \n%s\n',perm_rot_resultat_head{:} , separator);
fprintf('   rot   ->| %12.4e | %12.4e | %12.4e | %12.4e | \n',perm_rot_resultat{1 , :});
fprintf(' abs fel ->| %12.4f | %12.4f | %12.4f | %12.4f | \n',perm_rot_resultat{2 , :});

% Felgränsen ges via störningsräkning till |e_3| + |e_61|


fel_61 = max( [perm_rot_resultat{2, 1} , perm_rot_resultat{2, 2}] );
fel_3 = max( [perm_rot_resultat{2, 3} , perm_rot_resultat{2, 4}] );

fel = fel_61 + fel_3 ;

fprintf('\n\n')
fprintf('Resulterande felgräns för den största positiva roten (x4):\n e_{61} + e_{3} = e_{tot} \n %g + %g = %g \n -> %.4f\n',fel_61 , fel_3, fel, fel);




% Störningsräkning ger oss att Ef blir (+-) 0.0910


%% Uppg 6 a)            
fprintf('\n%s\n\n%s Uppg 6:  %s\n', sep_stark, halv_sep ,halv_sep);

% Definierar integranden
f_integrand= @(x) ( 1-exp( -(x/5).^3)) ./(5*x.^3);


% Definierar intervall 
x_values = linspace(1e-8, 1e-4, 1000); 
y_values = f_integrand(x_values);

% Plotta integranden från x = 0 till x = 1e-4
figure;
plot(x_values, y_values, 'b', 'LineWidth', 1.5);
xlabel('x'); ylabel('f(x)');
title('Integranden i givet intervall');
grid on;


% Resulterar i 'darrande', orsaken är subtraktion av två floats som är
% väldigt nära lika, subtraktionen avrundar diffen vilket ger brusigt
% resultat, vilket ger darrandet.

% Eftersom divisionen är med ett tal som är väldigt nära noll, så blir den
% lilla brusiga darrningen , ett stort fel.

% Om man bortser från darrande så kan man se att det darrar centrerat kring
% typ kring 1.6e-3

%% b) Svans-kapning
fprintf('\n\n Uppg 6 b):  \n\n');
% Definierar integral beräkning som funktion av undre gräns B -> inf
upp_lim_integ = @(B) integral(f_integrand, B, Inf, 'RelTol', 1e-9);

% Finner B där svansbidraget blir försumbart (< 10^-9)
B = 1e-2;
while upp_lim_integ(B) > 1e-9
    B = B + 1; % Öka B tills felet är acceptabelt
end

fprintf('Övre gräns B: %.2f\n%s\n', B, separator);



%% c) Approximation för små x

% e^-(x/5)^3 approximeras till -> 1- (x/5)^3 vilket ger
% integranden approximeras som ( 1 - 1 + (x/5)^3 ) / (5x^3) vilket blir:
% 1 / 5^4
f_approx = 1/5^4; 
f_0_fun = @(x) 1/5^4;

% Byter ut f(x) mot approximationen för x nära 0 ([0, 1e-4] ) 
x_0 = linspace(0, 1e-4, 500);
 

% Integralen av approximerade funktionen blir: [x*0.0016]

% Definierar gränserna
a_approx = 0;
b_approx = 1e-4; 
%b_approx = 0.0016;


I_0 = b_approx* f_approx - a_approx * f_approx;


% % Testar att plotta funktionen för analys: 
% % Finner att vi får väldigt stora värden för x<~0.0016
% % Vilket överensstämmer med vår approximation



%% d), e) Beräkna integralen 
fprintf('\n\n Uppg 6 e):  \n\n');

% d) Behövs vidare förbehandling?
% Bör ej behövas, alla krav är uppfyllda, undersöker detta vidare i e)
% genom att testa och se ifall vi kan approximera väl nog, 
% främsta felet kommer från trunkeringsfel, 
% kan undersökas via richardson extrapolering


% Kontroller för att verifiera resultatet:
% 1. Skillnaderna mellan värdena för olika h (dvs ∆-värden på en rad) skall minska när vi extrapolerar.
% 2. ∆-värdena i en kolumn skall avta på regelbundet sätt.

% ∆ = I(h/2) - I(h)

% Om E_trunk(2h) / E_trunk(h) ≈ 2^p -> c_p*h^p domineras ovh bör elimineras
% E_trunk = |T_hat(h) - T_hat(2h)|

n_0 = 10000; % Initierar antal intervall för trapetsregeln
h0 = 1;

fprintf('\n%s Trapets-regeln \n',halv_sep_blank); 
fprintf('%s\n', separator);
fprintf("     n     |     h    |       T(h)       |       ∆      |   konv ord.  |   E_trunk    |\n");
fprintf(' %s', separator);

delta = nan;
T_prev = 0;

% Definierar gränserna
a = 1e-4;%0.0016; % b approx
b = round(B); % ger heltal för linspace
konv_ord = nan;
e_trunk = nan;
T0 = I_0; % Approximerade integralen kring 0

format long;

% Richardson extrapolering
for i = 1:10
    % Dubblar n <-> halverar h
    h = h0 * 0.5^(i-1);
    n = b/h;

    %h = (b - a) / n;
    
    T_0 = TrapetsRegel(f_0_fun, 0, a, h); % Trapetsregeln ger vår skattade integral nära 0
    T_1 = TrapetsRegel(f_integrand, a, b, h); % Trapetsregeln ger vår skattade integral
    
    T = T_0+T_1;
        
    if i >1
        delta = T - T_prev;
        e_trunk = abs(T - T_prev); 
    end   
    
    if i > 2 
        % Trapetsregeln ska ha konvergens ording av 2^p, där p=2
        konv_ord = abs(T_pre_prev - T_prev) / abs(T_prev - T);

        %konv_ord = ( log(abs(delta)) - log(abs(delta_prev)) )/ log(2);        
    end
    
    fprintf('\n%10d | %8.4f | %16.10e | %12.2e | %12f | %12e |', n,  h, T, delta , konv_ord, e_trunk);
    
    delta_prev = delta;
    T_pre_prev = T_prev;
    T_prev = T;

end
fprintf('\n')

% Beräknar totala integralen genom att summera ihop trapets-integralen och
% integralen för x nära noll

%T_tot = T0 + T_1;

fprintf('\nTotala integralen beräknas till T = %.10f\n', T)

format long;

%quad(f_integrand, 1e-4,round( B))



%% f
fprintf('\n\n Uppg 6 f):  \n\n');
% För att beräkna totala felgränsen för integralberäkningen så summerar vi
% våra fel

% E_trunk + E_svans 

% Felet från att vi kapar svansen
E_svans = 1e-9;

E_tot = e_trunk + E_svans;
fprintf('\n Felgränsen beräknas enligt E_trunk + E_svans = \n\n %g + %g = %g\n\n -> E_tot = %g\n', e_trunk, E_svans, E_tot, E_tot)



%% Uppg 7

fprintf('\n%s\n\n%s Uppg 7:  %s\n', sep_stark, halv_sep ,halv_sep);

% Vi ser att vi har en väldigt snäv topp på ett ställe i intervallet
% Vilket säger att vi måste se till att fånga upp de punkterna mer
% noggrant

% Därför delar vi upp i delintervall och använder fler datapunkter nära
% toppen




f_i =@(x) 153 * exp(-( (11.*x - pi)./0.004).^2 );

x_linsp = linspace(0, 6, 100000);
integrand = f_i(x_linsp);


%f_i_alt =@(x) 153 * ( 2*11*pi.*x )./(11^2.*x.^2+pi^2); % Ogilitig förenkling?

%integrand_alt = f_i_alt(x_linsp);


figure;
plot(x_linsp, integrand, '-b', 'LineWidth', 1.5);
title('Uppg 7 integrand plot')
legend('integrand f(x)');
hold on;


% Genom att plotta integranden kan vi se att vi har en smal topp
% kring ca 0.285 ≈ pi / 11 (ses i ekv.)


%%

% Delar upp i intervall, (x<0.2 ), [0.2->0.3] , [0.3->6]

% steg_per_x = 10000; % Konstant steglängd för intervall 1 och 3
% 
% intervall_1 = linspace( 0 , 0.2 , 0.2*steg_per_x);
% intervall_2 = linspace( 0.2 , 0.3 , 1000000);
% intervall_3 = linspace( 0.3 , 6 , (6-0.3)*steg_per_x);

% Integral över intervallen
I_1 = quad(f_i , 0 , 0.2 , 1e-8)
I_2 = quad(f_i, 0.2 , 0.3 , 1e-12)
I_3 = quad(f_i, 0.3 , 6 , 1e-8)

% Genom uppdelning i delintervall ser vi att intervallen utan toppen blir 0


fprintf('\n%s Konvergens-analys av quad() \n',halv_sep_blank); 
fprintf('%s\n', separator);
fprintf("  AbsTol   |         I        |   E_trunk    |\n");
fprintf(' %s', separator);



% Beräknar med hjälp av quad()
% Initierar
I_prev = nan;
E_trunk = nan;
i0 = 6;
i_max = 12;
for i = i0:i_max % Minskar toleransen stegvis
    tol = 10^(-i);

    I = quad(f_i, 0.2 , 0.3 , tol);    

    fprintf('\n%10.0e | %16.10e | %12.2e |', tol, I, E_trunk);
    
    if i>i0 % Beräkna trunkeringsfelet för att bestämma toleransgräns och felgräns
        E_trunk = abs(I-I_prev);
    end

    I_prev = I;
end
fprintf('\n\n')
fprintf('\nquad() resulterar i:\n %.12e \n\n med felgräns:\n e_trunk = %.12e \n\n', I, E_trunk);


% Upprepa med funktionen integral()
fprintf('\n%s Konvergens-analys av integral()\n',halv_sep_blank); 
fprintf('%s\n', separator);
fprintf("  AbsTol   |         I        |   E_trunk    |\n");
fprintf('%s', separator);

% Initierar
I_prev = nan;
E_trunk = nan;
i0 = 6;
i_max = 12;
for i = i0:i_max % Minskar toleransen stegvis
    tol = 10^(-i);

    I = integral(f_i, 0.2 , 0.3 ,'AbsTol',tol);    
    
    fprintf('\n%10.0e | %16.10e | %12.2e |', tol, I, E_trunk);
    
    if i>i0 % Beräkna trunkeringsfelet för att bestämma toleransgräns och felgräns
        E_trunk = abs(I-I_prev);
    end

    I_prev = I;
end
fprintf('\n')
fprintf('\nintegral() resulterar i:\n %.12e \n\n med felgräns:\n e_trunk = %.12e \n\n', I, E_trunk);


%% 7b)

% Då integralen över intervallen som inte innehar toppen blir lika med noll
% Så kan vi minimera arbetet för datorn, genom att dela upp intervallet 
% så nära som möjligt till den snäva toppen, då det bara är den som
% relevanta värden.







