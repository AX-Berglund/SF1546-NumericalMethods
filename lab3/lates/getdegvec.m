%kolla så att gradfunktionen funkar och konverterar till grader
function degrevector = getdegvec(tvalue,h,hasv,teta)
    deg = [];
    for i=1:length(tvalue)
        deg(i) = 180*anglecal(tvalue(i),hasv(3,i),hasv(4,i),teta)/pi;        
    end
    degrevector =deg;
end