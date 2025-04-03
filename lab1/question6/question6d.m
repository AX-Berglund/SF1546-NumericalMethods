function plot_integrand_AtoB()
    % Gränser
    A = 1e-4;
    B = 3163;   % = 10000

    % Antal punkter och logaritmiskt fördelade x-värden
    N = 300;
    xvals = logspace(log10(A), log10(B), N);

    % Definiera integranden
    f = @(x) (1 - exp(-(x/5).^3)) ./ (5*x.^3);

    % Beräkna f(x)
    fvals = f(xvals);

    % Plotta på logaritmisk x-axel
    figure;
    semilogx(xvals, fvals, 'b-o','LineWidth',1.2);
    grid on;
    xlabel('x');
    ylabel('f(x)');
    title('Integranden f(x) = (1 - e^{-(x/5)^3}) / (5 x^3),  x \in [1e-4, 1e4]');
end
