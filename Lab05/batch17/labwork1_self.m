
%%
fe=0:0.01:1;
for i=1:length(fe)
    L(i)=1-((fe(i).^5)/((0.5.^5)+(fe(i).^5)));
end
plot(fe,L);
[fefe,LL]=meshgrid(fe,L);
figure
surf(fefe,LL);
hold on;
%%
for i=1:length(fe)
   
    fa(i)=0.6*L(i)*exp(0.5*L(i));
end
%plot(fa,L);
[LL,fafa]=meshgrid(L,fa);

surf(LL,fafa);
hold on;
%%
for i=1:length(L)
   fe(i)=-fa(i);
end
%plot(fa,fe);
[fafa,fefe]=meshgrid(fa,fe);

surf(fafa,fefe);
hold on;