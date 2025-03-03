function I_ex = richardsonEx(I1, I2, p)
    % Richardson extrapolation för att förbättra integralens noggrannhet.
    % I1 = Integral med steglängd h
    % I2 = Integral med steglängd h/2
    % p  = Ordningen av metoden (p=2 för trapetsmetoden)
    
    I_ex = (2^p * I2 - I1) / (2^p - 1);
end
