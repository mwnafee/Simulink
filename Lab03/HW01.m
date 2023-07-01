num=400;
den=[1 12 400];
sys=tf(num,den);
ltiview(sys);
%%
clear
num=625;
den=[1 0 625];
sys=tf(num,den);
ltiview(sys);

%%
clear
num=900;
den=[1 90 900];
sys=tf(num,den);
ltiview(sys);
%%
clear
num=225;
den=[1 30 225];
sys=tf(num,den);
ltiview(sys);
%%
clear
w_n=sqrt(13);
E=4/(2*w_n);
sig=E*w_n;
w_d=w_n*sqrt(1-E^2);
zeroes= [];
poles= [-sig+i*w_d,-sig-i*w_d];
gain=13;
sys=zpk(zeroes,poles,gain)
zeroes= [];
poles= [2*sig+i*w_d,2*sig-i*w_d];
gain=13;
sys=zpk(zeroes,poles,gain)
%ltiview(sys)
poles= [3*sig+i*w_d,3*sig-i*w_d];
gain=13;
sys=zpk(zeroes,poles,gain)
ltiview(sys)
%%
zeroes= [];
poles= [sig+i*2*w_d,sig-i*2*w_d];
gain=13;
sys=zpk(zeroes,poles,gain)
%ltiview(sys)
poles= [sig+i*3*w_d,sig-i*3*w_d];
gain=13;
sys=zpk(zeroes,poles,gain)
ltiview(sys)
