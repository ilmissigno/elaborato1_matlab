function [res45, res15s] = ode_comparation(d)

tspan = [0 2/d];
options = odeset('RelTol',10e-4);

[t45, y45] = ode45(@Combustione, tspan, d, options);
[t15s, y15s] = ode15s(@Combustione, tspan, d, options);

res45.t = t45; res45.y = y45; res15s.t = t15s; res15s.y = y15s;
fprintf('[d = %d], [ODE45], Numero di punti: %d\n',d,length(y45));
fprintf('[d = %d], [ODE15s], Numero di punti: %d\n',d,length(y15s));

figure();
subplot(2,2,1), plot(t45,y45,'-g','LineWidth',2), title('ODE45');
subplot(2,2,2), plot(t15s,y15s,'r','LineWidth',2), title('ODE15s');
subplot(2,2,[3,4]), plot(t45,y45,'-g',t15s,y15s,'r','LineWidth',2), legend('ODE45','ODE15s'), title('Confronto');
end

