%% HH model of Firing Rate vs. Driving Current

%% Modification for (3C) from EK = -77 to the value below
    RT_F = 27; n = 1;                       % RT/nF
    K_out = 15; K_in = 400;                 % mM/l
    EK = (RT_F/n).*reallog(K_out/K_in);     % Nersnt potential for K+  (mV)


%% Plot firing rate as a function of electrode current
%% Inital Variables, Vo = -70, n,m,h = 0 
Vo = -70;
yy = [Vo 0 0 0];
%% Time vector
t0 = 0; T = 1000; tspan = [t0 T];
%% Current range 0 to 1
I = 0:.1:1;      % I (microamps/mm^2)    x-axis for plot
%% Firing rate vector for each input current in the range [0 1]
V_Hz = [];
 
%% Determine spike rate for each input current i with t = 1s
for i=I
    odefun = @(t,yy) HHfun(0,yy,i);
    [TOUT, YOUT] = ode45(odefun, tspan, zeros(4,1));
    voltages = YOUT(:,1);
    
    numofspikes = 0;
    for j=2:size(voltages,1)
        if (voltages(j) > 0) && (voltages(j-1) < 0)     % Find spikes
            numofspikes = numofspikes + 1;
        end
    end
 
    firingRate = numofspikes/1;                         % 150 spikes/s
    V_Hz(end+1) = firingRate;
end

figure(1)
plot(I,V_Hz) 
xlabel('I (microamps/mm^2)'), ylabel('V(Hz)')
title('Hodgkin and Huxley Firing Rate vs Current')

