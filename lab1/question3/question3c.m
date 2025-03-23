% 3 c) 
% Hurdan konvergens har sekantmetoden enligt teorin? 
% Den väljer x0 och x1 punkter på grafen f(x0) och f(x1) och drar en sekant.
% Där sekanten skär x-axeln tar vi nästa x-värde x2 och drar en ny sekant från f(x1) till f(x2). 
% Detta upprepas tills vi är tillräckligt nära roten. 
% Konvergensordning ca 1.6 (dvs mellan linjär och kvadratisk)

%   t[k] = K * t[k-1] ^1.6
%   t[k] = K * t[k-1] * t[k-2]
%   K = t[k] / ( t[k-1]^1.6 )    
%   K = t[k] / ( t[k-1] * t[k-2])