figure
plot(fe_sim,L_sim,"r");
figure (1)
plot(fe_sim);
hold on;
plot(L_sim);
xlabel('Time')
ylabel('fe,L');
title('Reproduced L and fe vs time graph');