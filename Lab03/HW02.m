% overdamped
clear
clc
k=2;
num=k;
den=[1 2 k];
sys=tf(num,den)
pzmap(sys)