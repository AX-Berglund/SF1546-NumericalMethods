function [X, Y, R] = solve_linear_system(xp, yp)
    A = [ones(3,1), xp', yp'];
    b = xp.^2 + yp.^2;

    c = A \ b;

    X = c(2) / 2;
    Y = c(3) / 2;
    R = sqrt(c(1) + X^2 + Y^2);
end
