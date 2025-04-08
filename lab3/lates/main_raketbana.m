% Hitta t-värde vid maxhöjd (y_max)
[t_ymax, numIter1] = findTvalueNearZero(z3(4,:), t_vals3, 1, 0.0001, 1e-6);

% Hitta t-värde vid nedslag (när y = 0)
[t_impact, numIter2] = findTvalueNearZero(z3(2,:), t_vals3, 1, 0.0001, 1e-6);

% Hämta maxhöjd (y_max)
[~, idxMax] = findVectorMaximum(z3(2,:));
y_max = interpolateValue(z3(2,:), t_vals3, t_ymax, 1, idxMax);

% Hämta x-värde vid nedslag
[~, idxZero] = findVectorZeroCrossing(z3(2,:));
x_impact = interpolateValue(z3(1,:), t_vals3, t_impact, 1, idxZero);


% Funktion: Hitta t mellan två närliggande nollgenomgångar med sekantmetod
function [t_value, numIter] = findTvalueNearZero(signal, t_axis, step, h, tol)
    [~, idxZero] = findVectorZeroCrossing(signal);
    targetFunc = @(t) interpolateValue(signal, t_axis, t, step, idxZero);

    t0 = t_axis(idxZero - 1) + h;
    t1 = t_axis(idxZero) - h;

    [t_value, numIter] = secantMethod(targetFunc, t0, t1, tol);
end

% Funktion: Interpolera ett värde med kvadratisk interpolation kring ett index
function interpolatedY = interpolateValue(y_vals, t_vals, t_query, step, idx)
    y_segment = y_vals(idx-step : step : idx+step);
    t_segment = t_vals(idx-step : step : idx+step);
    interpolatedY = quadraticInterpolation(t_segment, y_segment, t_query);
end

% Funktion: Hitta maxvärde och dess index i en vektor
function [maxVal, maxIdx] = findVectorMaximum(vec)
    [maxVal, maxIdx] = max(vec);
end

% Funktion: Hitta index precis innan signalen korsar noll (för nedslag)
function [zeroVal, idxZero] = findVectorZeroCrossing(vec)
    [~, idxMax] = max(vec);  % För att börja söka efter nollgenomgång efter högsta punkt
    [~, relativeIdx] = min(abs(vec(idxMax:end)));
    idxZero = idxMax + relativeIdx - 1;
    zeroVal = vec(idxZero);
end

% Funktion: Sekantmetoden för att hitta nollställe
function [root, iterations] = secantMethod(f, t0, t1, tol)
    iterations = 0;
    maxIter = 31;

    while abs(t1 - t0) > tol && iterations < maxIter
        f0 = f(t0);
        f1 = f(t1);
        t_next = t1 - ((t1 - t0) / (f1 - f0)) * f1;
        t0 = t1;
        t1 = t_next;
        iterations = iterations + 1;
    end

    root = t1;
end

% Funktion: Naiv kvadratisk interpolation
function y_interp = quadraticInterpolation(t, y, t_query)
    A = [1, t(1), t(1)^2;
         1, t(2), t(2)^2;
         1, t(3), t(3)^2];
    coeffs = A \ y(:);
    y_interp = coeffs(1) + coeffs(2)*t_query + coeffs(3)*t_query^2;
end

% Alternativ: Newtons kvadratiska interpolationsmetod (ej använd)
function y_interp = newtonQuadraticInterpolation(t, y, t_query)
    A = [1, 0, 0;
         1, t(2)-t(1), 0;
         1, t(3)-t(1), (t(3)-t(1))*(t(3)-t(2))];
    coeffs = A \ y(:);
    y_interp = coeffs(1) + coeffs(2)*t_query + coeffs(3)*t_query^2;
end
