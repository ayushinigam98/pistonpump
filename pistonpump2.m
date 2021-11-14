function Tdot = pistonpump2(~,T)
    load('pistonvar2.mat');
    %T(1):Tt#T(2):Tp#T(3):Tl#T(4):Tw#T(5):Pt#T(6):Pp#T(7):Pl
    
    Tin = 20;
    cw = 8;
    
    Q = D*w;
    Qel = 0.8*Q*(1-nv);
    Qil = 0.2*Q*(1-nv);
    
    k1 = 1e5;
    k2 = 4e6;
    k3 = 4e5;
    
    b1 = 0;
    b2 = 0;
    b3 = 0;
    
    f1 = T(1)*alphap*(1/rho)/(cp);
    f2 = T(2)*alphap*(1/rho)/(cp);
    f3 = T(3)*alphap*(1/rho)/(cp);
    
    phi1 = (1/(cp*mp))*(rho*Qil*(cp*(T(2) - T(1)) + (1 - alphap*(T(2) + T(1))/2)*v*(T(6) - T(5))) + rho*w*D*(cp*(Tin - T(1))));
    phi2 = (1/(cp*mp*0.1))*(rho*w*D*(cp*(T(1) - T(2)) + (1 - alphap*(T(2) + T(1))/2)*v*(T(5) - T(6))) + D*w*(T(6) - T(5)));
    phi3 = (1/(cp*ml))*(rho*Qel*(cp*(T(2) - T(3)) + (1 - alphap*(T(2) + T(3))/2)*v*(T(6) - T(5))) - kfw*Afw*(T(3) - T(4)));
    phi4 = (1/(cw*mw))*(kfw*Afw*(T(3) - T(4)) - kwa*Awa*(T(4) - Ta) - e*sig*Awa*(T(4)^4 - Ta^4) + w*D*(Pp - Pt)*(1-nm)/nm);% - sig*e*Awa*(T(4)^4 - Ta^4) + w*D*(Pp - Pt)*(1 - nm)/nm);
    
    Tdot(1) = (phi1 + f1*b1)/(1-f1*k1);
    Tdot(2) = (phi2 + f2*b2)/(1-f2*k2);
    Tdot(3) = (phi3 + f3*b3)/(1-f3*k3);%(T(3) - T(4)));
    Tdot(4) = phi4;
    
    Tdot(5) = b1 + k1*Tdot(1);
    Tdot(6) = b2 + k2*Tdot(2);
    Tdot(7) = b3 + k3*Tdot(2);
    
    Tdot = Tdot';
end