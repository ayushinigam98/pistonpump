close all;
clear;
tspan = 0:1:100;
Tinit = [20;20;20;20;0.15e6;21e6;0.15e6];

[t,T] = ode45('pistonpump2',tspan,Tinit);

plot(t,T(:,1),"b");
hold on;
plot(t,T(:,2),"r");
plot(t,T(:,3),"g");
plot(t,T(:,4),"k");
xlabel("time");
ylabel("Temperature");

legend('Tt','Tp','Tl','Tw');