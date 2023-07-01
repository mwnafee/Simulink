%%
clear; clc
f=0.01:0.001:0.1;
w=2*pi*f;
Glung=7.018; taulung=0.439;
Gc=0.04; tauc=120; Tc=14.2;
%%
% Construct loop transfer functions 
%num1 = [Glung*Gp]; den1 = [taulung*taup (taulung+taup) 1]; 
%Hs1 = tf(num1, den1);  
num2 = [Glung*Gc]; den2 = [taulung*tauc (taulung+tauc) 1];
Hs2 = tf(num2, den2);
% Compute Nyquist results, excluding effect of pure delays 
%[R1,I1] = nyquist(Hs1,w); R1 = squeeze (R1); I1 = squeeze(I1); 
[R2,I2] = nyquist(Hs2,w); R2 = squeeze(R2); I2 = squeeze(I2);
%%
% Add delay to results 
%R1del = real((R1 + j*I1).*exp(-j*w*Tp)); 
%I1del = imag((R1 + j*I1).*exp(-j*w*Tp)); 
R2del = real((R2 + j*I2).*exp(-j*w*Tc)'); 
I2del = imag((R2 + j*I2).*exp(-j*w*Tc)'); 
Rdel =  R2del; 
Idel =  I2del;
% Plot Nyquist diagram of overall frequency response  
axis square; plot(Rdel,Idel); grid;