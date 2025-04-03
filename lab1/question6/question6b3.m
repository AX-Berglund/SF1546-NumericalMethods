% Definiera integranden
f = @(x) (1 - exp(- (x / 5).^3)) ./ (5 * x.^3);

f2 = @(x) (1 - exp(- (x / 5))); 

f3 = @(x) (-exp((x/5)^3)/(5 * x^3));

f3(100);

1/(10^-(4.5))

