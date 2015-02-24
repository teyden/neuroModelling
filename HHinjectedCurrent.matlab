%% HHcurrentInjection - Modelling Membrane Potential Over Time

%% Sub & Supra - threshold electrode current
Isub = .115;   
Isupra = .116; 
odefun = @(t,yy) HHfun(0,yy,Isub);     
[TOUT, YOUT] = ode45(odefun, tspan, zeros(4,1));
VV = YOUT(:,1);
TT = TOUT; 
n = YOUT(:,2);
m = YOUT(:,3);
h = YOUT(:,4);
 
figure(2)
subplot(4,1,1)
plot(TT, VV)
set(gca,'XLim',[0,350])
xlabel('t (ms)'), ylabel('V (mV)')
title('Subthreshold Injected Current for Membrane Potential vs. Time')
 
subplot(4,1,2)
plot(TT, n, 'g')
set(gca,'XLim',[0,350])
xlabel('t (ms)'), ylabel('n')
 
subplot(4,1,3)
plot(TT, m, 'r')
set(gca,'XLim',[0,350])
xlabel('t (ms)'), ylabel('m')
 
subplot(4,1,4)
plot(TT, h, 'k')
set(gca,'XLim',[0,350])
xlabel('t (ms)'), ylabel('h')

