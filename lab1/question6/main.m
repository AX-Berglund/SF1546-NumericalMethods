Lämna in i Canvas

1c) Varför blir inte residualvektorn r exakt lika med noll?

residualvektorn blir inte lika med noll eftersom divisionen inte beräknar exakta värden, utan de approximeras. 
Därför får vi inte exakt samma värde i differensen eftersom värdena inte är exakt demsamma. 


2a) Vi kan studera de dominerande termerna för olika värden på x
för väldigt små x kan mittentermen försummas och sista e^-x termen kan approximeras till 1. 
Då har vi kvar f(x) = 61x - 20x = 41x

2c)
x0 = -1.5;
Root found at x = -1.1151415905 with relative error 5.1571525234e-14 after 6 iterations

x0 = -0.28; 
Root found at x = -0.2910130810 with relative error 4.0057793005e-15 after 14 iterations

x0 = -0.1;
Root found at x = 0.0000000000 with relative error 0.0000000000e+00 after 6 iterations

x0 = 6;
Root found at x = 6.3970629947 with relative error 1.2570856714e-11 after 5 iterations


2d) lim (n → inf) |e_(n+1)| / |e_n|^2 = C

2e) Constant C = 0.5074593301


3a) Bestäm rötterna med SEKANTMETODEN
>> question3a
------------------------------------------------------------------------------------------
 Iter |      x1      |    f(x1)     | Correction t |  Conv. K     |  Proportions  |
------------------------------------------------------------------------------------------
    0 | -1.30000e+00 |  1.61017e+01 | -1.19943e-01 | -1.19943e+01 | -1.19943e+00 |
    1 | -1.18006e+00 |  4.82786e+00 | -5.13637e-02 |  4.28235e+00 |  4.28235e-01 |
    2 | -1.12869e+00 |  9.39404e-01 | -1.24089e-02 | -2.01420e+00 |  2.41588e-01 |
    3 | -1.11628e+00 |  7.78789e-02 | -1.12172e-03 | -1.75993e+00 |  9.03965e-02 |
    4 | -1.11516e+00 |  1.45143e-03 | -2.13024e-05 | -1.53043e+00 |  1.89909e-02 |
    5 | -1.11514e+00 |  2.31464e-06 | -3.40259e-08 | -1.42396e+00 |  1.59728e-03 |
    6 | -1.11514e+00 |  6.89795e-11 | -1.01405e-12 | -1.39901e+00 |  2.98023e-05 |
Rot funnen vid x = -1.1151415905 ± 9.0934793790e-13
------------------------------------------------------------------------------------------
Fall 1: Rot = -1.11514159
------------------------------------------------------------------------------------------
 Iter |      x1      |    f(x1)     | Correction t |  Conv. K     |  Proportions  |
------------------------------------------------------------------------------------------
    0 | -2.60000e-01 | -8.99653e+00 |  5.99592e-03 |  5.99592e-01 |  5.99592e-02 |
    1 | -2.65996e-01 | -9.03968e+00 | -1.25610e+00 | -2.09492e+03 | -2.09492e+02 |
    2 |  9.90102e-01 |  5.30308e+01 |  1.07317e+00 | -1.42491e+02 | -8.54364e-01 |
    3 | -8.30631e-02 | -3.26170e+00 | -6.21815e-02 |  4.61287e-02 | -5.79421e-02 |
    4 | -2.08816e-02 | -8.47335e-01 | -2.18229e-02 |  3.27028e-01 |  3.50955e-01 |
    5 |  9.41242e-04 |  3.86086e-02 |  9.51022e-04 |  7.00838e-01 | -4.35791e-02 |
    6 | -9.78004e-06 | -4.00980e-04 | -9.77555e-06 |  4.71019e-01 | -1.02790e-02 |
    7 | -4.48577e-09 | -1.83938e-07 | -4.48632e-09 |  4.82568e-01 |  4.58933e-04 |
Rot funnen vid x = 0.0000000000 ± 8.0861148109e+03
------------------------------------------------------------------------------------------
Fall 2: Rot = 0.00000000
------------------------------------------------------------------------------------------
 Iter |      x1      |    f(x1)     | Correction t |  Conv. K     |  Proportions  |
------------------------------------------------------------------------------------------
    0 | -2.90000e-01 | -1.63529e+00 | -6.32932e-02 | -6.32932e+00 | -6.32932e-01 |
    1 | -2.26707e-01 | -8.13722e+00 |  7.92120e-02 | -1.25151e+01 | -1.25151e+00 |
    2 | -3.05919e-01 |  2.52875e+02 | -7.67425e-02 |  1.53069e+01 | -9.68824e-01 |
    3 | -2.29176e-01 | -8.21066e+00 |  2.41341e-03 | -3.97012e-01 | -3.14481e-02 |
    4 | -2.31590e-01 | -8.28183e+00 | -2.80836e-01 |  1.51630e+03 | -1.16365e+02 |
    5 |  4.92459e-02 |  2.06641e+00 |  5.60792e-02 | -8.27407e+01 | -1.99687e-01 |
    6 | -6.83333e-03 | -2.79229e-01 | -6.67578e-03 |  4.23885e-01 | -1.19042e-01 |
    7 | -1.57551e-04 | -6.45908e-03 | -1.58079e-04 |  4.22252e-01 |  2.36795e-02 |
    8 |  5.28818e-07 |  2.16815e-05 |  5.28859e-07 |  5.01144e-01 | -3.34552e-03 |
    9 | -4.01146e-11 | -1.66657e-09 | -4.06480e-11 |  4.86211e-01 | -7.68599e-05 |
Rot funnen vid x = 0.0000000000 ± 7.6204948882e+01
------------------------------------------------------------------------------------------
Fall 3: Rot = 0.00000000
------------------------------------------------------------------------------------------
 Iter |      x1      |    f(x1)     | Correction t |  Conv. K     |  Proportions  |
------------------------------------------------------------------------------------------
    0 |  6.00000e+00 |  1.06499e+02 | -1.84540e+00 | -1.84540e+02 | -1.84540e+01 |
    1 |  7.84540e+00 | -9.73570e+02 |  1.66343e+00 | -9.01396e+00 | -9.01396e-01 |
    2 |  6.18196e+00 |  6.33333e+01 | -1.01601e-01 |  3.30982e-02 | -6.10793e-02 |
    3 |  6.28357e+00 |  3.51961e+01 | -1.27091e-01 |  7.51984e-01 |  1.25088e+00 |
    4 |  6.41066e+00 | -4.49647e+00 |  1.43971e-02 |  1.11497e+00 | -1.13282e-01 |
    5 |  6.39626e+00 |  2.64138e-01 | -7.98811e-04 |  4.36571e-01 | -5.54841e-02 |
    6 |  6.39706e+00 |  1.81644e-03 | -5.53134e-06 |  4.80962e-01 |  6.92447e-03 |
    7 |  6.39706e+00 | -7.41588e-07 |  2.25733e-09 |  5.10883e-01 | -4.08099e-04 |
Rot funnen vid x = 6.3970629947 ± 3.5287026394e-10
------------------------------------------------------------------------------------------
Fall 4: Rot = 6.39706299

>> 

3b) ad blev rötterna? Blir det samma värden?
Första roten: x = -1.1151415905 med relativt fel 9.0937125770e-13 efter 6 iterationer
Andra roten:  x = 0.0000000000  med relativt fel 8.7810498822e-11 efter 9 iterationer
Tredje roten: x = 0.0000000000  med relativt fel 0.0000000000e+00 efter 11 iterationer
Fjärde roten: x = 6.3970629947  med relativt fel 3.5287021389e-10 efter 7 iterationer

Rötterna blir inte riktigt desamma. Sekantmetoden verkar inte kunna skilja på de två mellan rötterna, så vi hittar egentligen bara 3 rötter. 
Största och minsta roten är desamma. 

3c)Hurdan konvergens har sekantmetoden enligt teorin? 

Den väljer x0 och x1 punkter på grafen f(x0) och f(x1) och drar en sekant.
Där sekanten skär x-axeln tar vi nästa x-värde x2 och drar en ny sekant från f(x1) till f(x2). 
Detta upprepas tills vi är tillräckligt nära roten. 

Konvergensordning ca 1.6 (dvs mellan linjär och kvadratisk)
t[k] = K * t[k-1] ^1.6
t[k] = K * t[k-1] * t[k-2]
K = t[k] / ( t[k-1]^1.6 )    
K = t[k] / ( t[k-1] * t[k-2])

3d) Visa att ditt program har sådan konvergens. Vad blir konvergens-konstanten?
Se Conv. K i a)


4a)  I vilken ansats behövdes flest koefficienter beräknas (totalt över hela intervallet)? Hur många koefficienter är det?
SVAR: Ansats C) Splines-approximation, varje intervall har 4 koefficienter, 12 x 4 = 48 koefficienter.  

4b) Fyra av ansatserna behövde bara beräkna 3 koefficienter totalt, vilka?
SVAR: Ansats D,E,F,G

4c) Vilken av metoderna A-G är bäst för att beräkna årets längsta dag? Varför? Vilken
dag är det och vad blir soltiden?
SVAR: Ansats G) är bäst eftersom cos varierar periodiskt över året vilket passar vår data perfekt. 
Man kan se att grafen för G kanske underminerar max värdet en aning, men x värdet det vill säga skattningen för den längsta dagen är perfekt.
Analytiskt beräknad längsta dag: dag 172.09 med soltiden 18.28 timmar. ~21 juni


4d) Vilken av metoderna A-G är bäst för att beräkna värdet på julafton? Varför? Vad blir soltiden?
Splines ser ut att ha en rimlig skattning för tiden på julafton

4e)
En modifierad trigonometrisk anpassning där vi lägger till en extra harmonisk frekvens, alltså en fyra-termer-modell:
$$
y(x) = c_1 + c_2 \cos(w x) + c_3 \sin(w x) + c_4 \cos(2 w x) + c_5 \sin(2 w x)
$$



4f) Kan du säga vilken metod som är bäst? Varför?
Det beror lite på datan vi använder. I vårt fall fungerar den trigonometriska modellen väldigt bra efter som den är rent periodisk och 
passar med vår data. Den är också relativt billig räknemässigt. Splines fittar en väldigt bra modell till vår data, men är beräknemässigt tung. 


5a)
Original C = 20: min rot = 0.000000000000533, max rot = 6.397062994660478
C = 20.2 (+1%): min rot = 0.000000000004158, max rot = 6.397056504773738

Procentuell förändring vid +1% i C:
Minsta roten ÖKAR med 679.57986%
Största roten MINSKAR med 0.00010%

Båda rötterna påverkas olika mycket.
Rötterna förändras i olika riktningar.

5c)
Original C = 20: största rot = 6.397062994660478
Rötter vid förändring av konstant 61:
C +1% av 61: största rot = 6.397043200150097
C -1% av 61: största rot = 6.397082788112102
Påverkan av ±1% på 61: ±0.000019794510381

Rötter vid förändring av konstant 3:
C +1% av 3: största rot = 6.397062021184722
C -1% av 3: största rot = 6.397063968133669
Påverkan av ±1% på 3: ±0.000000973475756

Total uppskattad felgräns: ±2.07680e-05

6b) Kort beskrivning av värdet på B
Genom att använda integral kan vi se och bestämma B för en få ett fel mindre än 10^-8 med B: 3163.00
6c) kort beskrivning av tankesättet
Använd l'hopital för att få ut en funktion som inte ger osäker division av 0/0 för lim x->0. Använd denna funktion nära för att approximera för x [0,A]
A = 1e-4
6d) kort beskrivning av tankesätt
6e)
6f)




