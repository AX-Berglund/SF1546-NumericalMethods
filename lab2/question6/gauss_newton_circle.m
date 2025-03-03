function [X, Y, R] = gauss_newton_circle(X0, xp, yp)
    tol = 1e-9;
    max_iter = 200;
    R = X0(:);

    for it = 1:max_iter
        x = R(1);
        y = R(2);
        r = R(3);

        F = (xp - x).^2 + (yp - y).^2 - r^2;
        J = [-2*(xp - x)', -2*(yp - y)', -2*r*ones(length(xp),1)];

        t = (J'*J) \ (-J'*F);
        R = R + t;

        if norm(t) < tol
            break;
        end
    end

    X = R(1);
    Y = R(2);
    R = R(3);
end
