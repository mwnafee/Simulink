%% hw 02
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