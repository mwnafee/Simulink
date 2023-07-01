% linear model of the pupillary light reflex
close all; clear all;clc
%%
D=0.18;
tau=0.1;
while D>0
    K=input("Enter loop gain: ");
    if K==0
        break
    end
    num=[K];
    den=[tau^3 3*tau^2 3*tau 1];
    Hs=tf(num,den);
    f=[0.01:0.01:10]';
    w=2*pi*f;
    %Compute nyquist plot w/o delay;
    [R I]=nyquist(Hs,w);
    I=squeeze(I);
    R=squeeze(R);
    %Add delay to results
    Rdel=real((R+1j*I).*exp(-1j*w*D));
    Idel=imag((R+1j*I).*exp(-1j*w*D));
    
    %figure
    axis square;
    plot(Rdel,Idel);
    grid;
    hold on;
end
