f=@(fe,fa,L)L+(fe.^5)./(0.5^5+fe.^5)-1;
interval=[0 1 0 1 0 1];
fimplicit3(f,interval);
hold on;
%%
g=@(fe,fa,L)fa-0.6*L*exp(0.5*L);
fimplicit3(g,interval);
hold on;
%%
h=@(fe,fa,L)fe-fa;
fimplicit3(h,interval);
hold on;
%% hw 2
%%
clc;
clear all;
figure
%%
fe=0:0.001:1;
for i=1:length(fe)
    L(i)=1-((fe(i).^5)/((0.5.^5)+(fe(i).^5)));
end
plot(fe,L);
hold on;

for i=1:length(fe)
    fa(i)=0.6*L(i)*exp(0.5*L(i));
end
plot(fa,L);
hold on;

for i=1:length(fe)
    if abs(fe(i)-fa(i))<0.001
        x=((fe(i)+fa(i))/2);
        y=L(i);
    end
end
%% vulval
fe=0:0.1:1;
L=1-((fe.^5)/((0.5^5)+(fe.^5)));
plot(fe,L);
hold on;
fa=0.6*L.*exp(0.5*L);
plot(fa,L);
hold on;
%%
plot(x,y,'kx','LineWidth',3);
%[x,y]=polyxpoly(fe,L,fa,L)
