%funktion för massan
function mass = M(m0,t)
    if t<= 0.08
        mass = m0-0.08*t;
    else
        mass = m0-0.08*0.08;%massa kvar efter brinntid
    end
end