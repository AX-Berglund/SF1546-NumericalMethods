function plot_circle(X, Y, R, xp, yp, title_text)
    theta = linspace(0, 2*pi, 100);
    xc = X + R * cos(theta);
    yc = Y + R * sin(theta);

    figure;
    plot(xp, yp, 'ro', 'MarkerSize', 10, 'DisplayName', 'Givna punkter');
    hold on;
    plot(X, Y, 'bo', 'MarkerSize', 10, 'MarkerFaceColor', 'b', 'DisplayName', 'Centrum');
    plot(xc, yc, 'g-', 'LineWidth', 1.5, 'DisplayName', 'Beräknad cirkel');
    
    axis equal;
    xlabel('x');
    ylabel('y');
    title(title_text);
    legend;
    grid on;
end
