function plot_solution(x, T, x2, T2, x3, T3)
    % Funktion för att plotta lösningen av T(x) för olika precisionsnivåer

    figure;
    plot(x, T(:,1), 'o-r', 'DisplayName', 'Standard precision');
    hold on;
    plot(x2, T2(:,1), '*-b', 'DisplayName', 'Hög precision (RelTol=1e-9)');
    plot(x3, T3(:,1), 's-g', 'DisplayName', 'Mycket hög precision (RelTol=1e-12)');
    
    xlabel('x');
    ylabel('Temperatur T(x)');
    title('Lösning av temperaturfördelning med inskjutningsmetoden');
    legend;
    grid on;
end
