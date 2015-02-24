%% Constants
dt = 0.2;       % time step
timevect = 0:dt:500;
a = .02; b =.2; c = -65; d = 8; 
I = 0; I2 = 10;    % when t <= 100, I=0; when t > 100, I=10
 
%% Initial values for v and u 
v = -80;         %(mV)  v is the membrane potential
u = b*v;         %(mV)  u is the recovery variable
 
U = []; 
V = [];
for t=timevect
    if t > 100
        I = 10;
    else 
        I = 0; 
    end
 
    u = u + dt*a*(b*v-u);              % u=u+du
    v = v + dt*(0.04*v^2+5*v+140-u+I);   % v=v+dv
    
    if v >= 30      % (mV)
        V(end+1) = 30;
        v = c;  
        u = u+d; 
    else
        V(end+1) = v; 
    end
    U(end+1) = u; 
        
end
 
%% Nullclines for u and v
vv = -80:30; 
NCdvdt0_u = 0.04.*vv.^2 + 5.*vv + 140 + 0;          % nullcline for dv/dt=0, I=0
NCdvdt10_u = 0.04.*vv.^2 + 5.*vv + 140 + 10;        % nullcline for dv/dt=0, I=10
NCdudt_u = b.*vv;                                   % nullcline for du/dt=0
 
%% Plot V vs U and vv vs nullclines
ii = ii+1;
figure(ii)
hold on
plot(V,U,'k.')
set(gca,'YLim',[-25,25])
plot(vv, NCdudt_u)
plot(vv, NCdvdt0_u, '--r')
plot(vv, NCdvdt10_u, 'r')
ylabel('Recovery'), xlabel('Potential (mV)')
axis([-80 25 -25 25])
title('Spike Rate Adaptation')
hold off
