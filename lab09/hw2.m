% linear model of the pupillary light reflex with critical value of k
close all; clear all;clc
%%
D=0.18;
tau=0.1;
k=1.01:0.01:2.1;

for i=1:numel(k)
    K=k(i);
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
    for j=1:length(Idel)
        if(Rdel(j)<=-0.99 && Rdel(j)>=-1.01)
            if(Idel(j)<=0.0115 && Idel(j)>=-0.0115)
            
                critical=K;
            end
            
        end
    end
    
end

%%
num=[critical];
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
plot (-1,0,"g*")
str="Critical value of k is " +num2str(critical);

annotation('textbox', [0.5, 0.4, 0.1, 0.1], 'String', str)
hold off