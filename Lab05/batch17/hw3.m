subplot 121
plot(L)
xlabel('time'), ylabel('L');
title('L vs time');
subplot 122
plot(fe,L);
xlabel('fe'),xlim([-1 1]), ylabel('L'), ylim([-1 1]);
title('L vs fe');
axis tight

%%
clc;
clear all;
close all;
%% bad
xx=timeseries(fe);
yy=timeseries(L);
zz=timeseries(fa);
fe=squeeze(xx.Data);
L=squeeze(yy.Data);
fa=squeeze(zz.data);
figure (1)
plot(fe);
hold on;
plot(L);
xlabel('Time')
ylabel('fe,L');
title('Reproduced L and fe vs time graph');

%% bad
figure(2)
plot(fe,L);
hold on;
plot(fa,L);
title('Reproduced L vs fe graph');
%%
X=ans(2,:)
Y=ans(3,:)
plot(X,Y)



