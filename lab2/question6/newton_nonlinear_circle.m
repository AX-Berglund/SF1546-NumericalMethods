function [X, Y, R] = newton_nonlinear_circle(X0, Y0, R0, xp, yp, multiply_third)
    if nargin < 6
        multiply_third = false;
    end

    tol = 1e-9;
    max_iter = 200;
    R = [X0; Y0; R0];

    for it = 1:max_iter
        x = R(1);
        y = R(2);
        r = R(3);

        F = [(xp(1)-x)^2 + (yp(1)-y)^2 - r^2;
             (xp(2)-x)^2 + (yp(2)-y)^2 - r^2;
             (xp(3)-x)^2 + (yp(3)-y)^2 - r^2];

        if multiply_third
            F(3) = 3 * F(3);
        end

        J = [-2*(xp - x)', -2*(yp - y)', -2*r*ones(3,1)];
        
        t = J\(-F);
        R = R + t;

        if norm(t) < tol
            break;
        end
    end

    X = R(1);
    Y = R(2);
    R = R(3);
end
