

%hittar max eller och vilket index 
function [ymax,index1] = find_vector_max(z)
    [y_max1, idy_max] = max(z);
    % Hitta maximal värdet och dess index
    
    ymax=y_max1;
    index1=idy_max;
end