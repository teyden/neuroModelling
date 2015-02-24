% Hodgkin-Huxley model. 
% 
% t: time
% y: [V, n, m, h]
% injected: injected current (mS/mm^2*mV = microamps/mm^2)
% 
% Use like this (for example) ... 
% options = odeset('AbsTol', 1e-8, 'RelTol', 1e-6);
% injected = .1;
% odefun = @(t,y) HHfun(t,y,injected);
% [TOUT,YOUT] = ode45(odefun, [0 1000], zeros(4,1));
function dy = HHfun(t, y, injected) 
    %%
    R = 8.314;
    T = 312;
    F = 9.65e4;
%     EK = -77; % EK from Dayan & Abbott    
    ENa = 80;    % ENa from D&A is 50, orig here was 80
    EL = -54.387;
    
    %% Modification for (3C)
    RT_F = 27; n = 1;                       % RT/nF
    K_out = 15; K_in = 400;                 % mM/l
    EK = (RT_F/n).*reallog(K_out/K_in);     % Nersnt potential for K+  (mV)

    %% 
    gbarK = .36; %mS/mm^2
    gbarNa = 1.2;
    gbarL = .003;
    V = y(1);
    n = y(2);
    m = y(3);
    h = y(4);
    
    [taun, ninf] = ndyn(V);
    [taum, minf] = mdyn(V);
    [tauh, hinf] = hdyn(V);
    
    C = .01; % microfarads/mm^2    
    dV = (1/C)*(gbarL*(EL-V)+gbarK*n^4*(EK-V)+gbarNa*m^3*h*(ENa-V)+injected);
    dn = (1/taun) * (ninf-n);
    dm = (1/taum) * (minf-m);
    dh = (1/tauh) * (hinf-h);
    dy = [dV; dn; dm; dh];
end
