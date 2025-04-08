
%hittar där index precis innan y passerar x-axeln
function [ymin,index2] = find_vector_zero(z)
    [y_max1, idy_max] = max(z);
    % Hitta minimi höjd och dess index, innan nedslag
    [y_min1,idx_min] =min(abs(z(idy_max:end)));
    index2=idx_min+idy_max-1;
    ymin=z(index2);
end