function [xvl, yvl] = velocity(vxy, teta)
    xvl = vxy * cos(teta);
    yvl = vxy * sin(teta);
end
