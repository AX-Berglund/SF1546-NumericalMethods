
%funktion beräkning av grader i radianer
function phi = anglecal(t,vvx,vvy,teta)
    if t<=0
        phi = teta;%fix
    else
        phi = atan(vvy/vvx);
    end
end