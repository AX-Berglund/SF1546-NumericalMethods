# SF1546 numo25 - Laboration 1

**Namn, pers.nr:** .................................................................

## LABORATION 1 (Hela, dvs uppgift 1-7 av 7)

### Ekvationslösning, kurvanpassning och integraler.

Målet med laboration ett är att ge er vana vid de numeriska metoderna för ekvationslösning, interpolation, parameteranpassning och tillförlitlighet. Vi börjar också titta lite på integraler. Ni skall efter labben kunna lösa egna liknande uppgifter helt på egen hand.

Vid redovisningen ska du visa för din lärare att du behärskar de metoder labben tar upp. Båda i labbgruppen ska enskilt kunna redogöra för teori, algoritmer och resultat! 

**Förberedelse inför redovisning:**  
- Kurvor redan plottade  
- Numeriska resultat uppskrivna  
- Alla frågor i deluppgifterna ska vara besvarade  
- Förbered hur du ska berätta om hur du löst uppgiften  
- Koden skall vara prydlig och lättläst och uppladdad i Canvas  
- Även en lista med era resultat skall vara uppladdade  

**Sista dag för bonuspoäng:** Se hemsidan!

---

## 0. Lab0 (Behöver inte redovisas, men är nyttig MATLAB-hjälp inför Lab1.)

Öva på MATLAB genom “Lab0” som finns på sidan för Lab1 i Canvas.  
Om du tycker att det tar alltför lång tid nu att göra hela Lab0 kan du hoppa över del 3 (den om funktioner i MATLAB).  

Om du tycker Lab0 är svår är det ett tecken på att du behöver öva programmering. Totalt sett sparar du labbtid på att göra Lab0 ordentligt innan du gör de “riktiga” Lab1-uppgifterna.

---

## 1. Linjärt ekvationssystem

Vi ska lösa det linjära ekvationssystemet **Ax = b** i MATLAB:

$$
\begin{bmatrix}
1 & 2 & 3 & 0 \\
0 & 4 & 5 & 6 \\
1 & 1 & -1 & 0 \\
1 & 1 & 1 & 1
\end{bmatrix}
\begin{bmatrix}
x_1 \\
x_2 \\
x_3 \\
x_4
\end{bmatrix}
=
\begin{bmatrix}
7 \\
6 \\
5 \\
4
\end{bmatrix}
$$

### Uppgifter
a) Beräkna med MATLAB vektorn **x**.  
**Svar:**

b) Beräkna med MATLAB residualvektorn **r = b − Ax**.  
**Svar:**

c) Varför blir inte residualvektorn **r** exakt lika med noll?  
**Svar:**


**Lämna in i Canvas:**  
Svar på **1c** (ingen MATLAB-kod behöver laddas upp).

---

## 2. Icke-linjär skalär ekvation med Newtons metod

Vi ska nu titta på alla positiva rötter till ekvationen **f(x) = 0** där:

$$
f(x) = 61x - \left(\frac{x^2 + x + 0.03}{3x + 1}\right)^7 - 20xe^{-x}
$$

### Uppgifter
a) Hur kan du förenkla funktionen så att du med papper och penna och en enkel miniräknare kan grovlokalisera den minsta positiva roten?  
**Svar:**

b) Rita sedan funktionen **f(x)** i MATLAB så att man tydligt ser var alla positiva rötterna ligger.  
**Svar:**

c) Skriv MATLAB-kod för att bestämma en rot noggrant med Newtons metod.  
**Svar:** all rötter hittade med Newtons metod:  
x = -1.115142  
x = -0.291013  
x = 0.000000  
x = 6.397063  

d) Hur definieras kvadratisk konvergens för en iterativ metod för ekvationslösning?  
**Svar:**
Kvadratisk konvergens är hastigheten som felet minskar i. Om felet minskar med en konstant faktor vid varje iteration så är konvergensen kvadratisk. Enligt:
$$
\lim_{{n \to \infty}} \left| \frac{e_{n+1}}{e_n^2} \right| = \text{Konstant}
$$

e) Bestäm konvergenskonstanten för den största roten.  
**Svar:**


**Lämna in i Canvas:**  
- Svar på **2acde**  
- MATLAB-kod för **2bce**  

---

## 3. Samma icke-linjära skalära ekvation med sekantmetoden

### Uppgifter
a) Skriv ett MATLAB-program som bestämmer rötterna till ekvationen i föregående uppgift med sekantmetoden. 
**Svar:** Det beror på vilka startvärden du väljer. Den hittar alltid en av rötterna, men för att hitta alla rötter behöver du välja startvärden som ligger på olika sidor om rötterna, och inte för nära andra rötter. Till exempel rot 2 korsar x-axeln i väldigt skarp vinkel, och nära roten i origo, vilket gör att sekantmetoden inte fungerar bra där.
b) Vad blev rötterna? Blir det samma värden?  
**Svar:** Med följande startvärden: 

x0 = -1.5;
x1 = -1.3;
Första roten: -1.11514159, Antal iterationer: 7


x0 = -0.29;
x1 = -0.26;
Andra roten: 0.00000000, Antal iterationer: 18


x0 = 0.29;
x1 = -0.29;
Tredje roten: 0.00000000, Antal iterationer: 10

x0 = 4;
x1 = 6;
Fjärde roten: 6.39706299, Antal iterationer: 8


c) Hurdan konvergens har sekantmetoden enligt teorin? 
Den väljer x0 och x1 punkter på grafen f(x0) och f(x1) och drar en sekant. Där sekanten skär x-axeln tar vi nästa x-värde x2 och drar en ny sekant från f(x1) till f(x2). Detta upprepas tills vi är tillräckligt nära roten. 
d) Visa att ditt program har sådan konvergens. Vad blir konvergenskonstanten?  
e) Vilken av metoderna, Newton eller sekant, föredrar du för denna ekvation? Varför?

**Lämna in i Canvas:**  
- Svar på **3bcd**  
- MATLAB-kod för **3ad**  

---

## 4. Interpolation och linjära minsta kvadratmetoden

I tabellen finns hur länge solen antas vara uppe i Stockholm under ett normalår. (Första
kolumnen är datumet, andra kolumnen är antalet timmar och sista antalet minuter)

| Datum   | Tid  |
|---------|------|
| 1 jan   | 6:15 |
| 1 feb   | 8:06 |
| 1 mrs   | 10:33 |
| 1 apr   | 13:14 |
| 1 maj   | 15:55 |
| 1 jun   | 18:04 |
| 1 jul   | 18:24 |
| 1 aug   | 16:38 |
| 1 sep   | 14:05 |
| 1 okt   | 11:24 |
| 1 nov   | 8:47 |
| 1 dec   | 6:36 |
| 31 dec  | 6:14 |

Vi skall nu göra **7 olika anpassningar** till dessa data:  
A) Ett interpolationspolynom som går genom samtliga punkter.  
B) Styckvis linjär interpolation genom samtliga punkter.  
C) Splines-approximation genom samtliga punkter.  
D) Ett andragradspolynom som använder data från **1 juni - 1 augusti**.  
E) Ett minstakvadratanpassat andragradspolynom för **1 april - 1 september**.  
F) Ett minstakvadratanpassat andragradspolynom för **hela året**.  
G) Funktionen **y = c1 + c2 cos(w * x) + c3 sin(w * x)** anpassad till hela året där **w = 2π/365**.

### Uppgifter

Note: Interpolation = att läsa mellan raderna

a) I vilken ansats behövdes flest koefficienter beräknas (totalt över hela intervallet)?
Hur många koefficienter är det?  
**Svar:**  
Ansats A) Interpolationspolynom genom alla punkter, 13 koefficienter (en för varje punkt).  
Ansats B) Styckvis linjär interpolation. 2 koefficienter per intervall (k & m), 12 x 2 = 24 koefficienter.  
Ansats C) Splines-approximation, varje intervall har 4 koefficienter, 12 x 4 = 48 koefficienter.  
Ansats D) Andragradspolynom. Polynom av grad 2 har 3 koefficienter.  
Ansats E) Minstakvadratanpassat andragradspolynom. Polynom av grad 2 har 3 koefficienter.  
Ansats F) Minstakvadratanpassat andragradspolynom. Polynom av grad 2 har 3 koefficienter.  
Ansats G) Funktionen y = c1 + c2 cos(w * x) + c3 sin(w * x) har 3 koefficienter.  

b) Fyra ansatser behövde bara 3 koefficienter totalt, vilka?  
**Svar:** D, E, F, G  

c) Vilken metod är bäst för årets längsta dag? Vilken dag är det och vad blir soltiden?  
d) Vilken metod är bäst för julafton? Vad blir soltiden?  
e) Föreslå en bättre metod för julafton än de i A-G.  
f) Kan du säga vilken metod som är bäst? Varför?  
g) (Frivillig) Kan du förbättra modellen i G?

**Lämna in i Canvas:**  
- MATLAB-kod  
- Svar på **4abcdef**  

---

## 5. Tillförlitlighet

### Uppgifter
a) Om konstanten **20** ökas med **1.0%**, hur påverkas de positiva rötterna?  
b) Om konstanten minskas med **1.0%**, hur påverkas rötterna?  
c) Beräkna felgräns för osäkerheten i konstanterna **61** och **3** för den största roten.

**Lämna in i Canvas:**  
- Svar på **5ac**  

---

## 6. Integral med förbehandling

Beräkna integralen:

$$
\int_0^\infty \frac{1 - e^{-(x/5)^3}}{5x^3} dx
$$

med totalt fel mindre än **10⁻⁸**.

**Lämna in i Canvas:**  
- MATLAB-kod för **6ef**  
- Svar på **6b** (värde på **B**) samt **6ef**  

---

## 7. Säker integral

Beräkna:

$$
\int_0^6 153 e^{-\left(\frac{11x - \pi}{0.004}\right)^2} dx
$$

med **Matlab’s quad och integral**.

**Lämna in i Canvas:**  
- MATLAB-kod för **7a**  
- Svar på **7a, 7b**  

---

Laborant: ......................................  
Uppgift godkänd (datum, lärarsign): ......................................
