%% HH model for asymptotic K+ current vs. membrane potential

RT_F = 27; n = 1; 
K_out = 15; K_in = 400;     			% mM/l
EK = (RT_F/n).*reallog(K_out/K_in);       % Nersnt potential for K+  (mV)
 
memV = -90:50;
gbarK = 0.36;       				% Max conductance for K+
[taun, ninf] = ndyn(memV);
Im = gbarK.*ninf.^4.*(memV-EK);   		% Asymptotic K+ current
% as gbarK --> inf 
plot(memV,Im)
title('Potassium Current vs. Membrane Potential')
xlabel('Potential (mV)'), ylabel('Current (microamps/mm^2)')
axis([-90 50 -5 45])