close all; clear all; clc 

Vlung=2.5;  

K_CO2=0.0065;  

Gp=0.02;  

Gc=0.04; 

tau_p=20;  

tau_c=120;  

VE=0.12;  

VD=0.03;  

PaCO2=40; 

PICO2=0; 

% % For Normal Subject 

Q_N=0.1;  

Tp_N=6.1;  

Tc_N=7.1; 

G_lung_N=(PaCO2-PICO2)/(VE-VD+863*Q_N*K_CO2); 

tau_lung_N=Vlung/(VE-VD+863*Q_N*K_CO2); 

f = [0.01:0.001:0.1]'; 

w = 2*pi*f; 

num1_N=[G_lung_N*Gp]; 

den1_N=[tau_lung_N*tau_p (tau_lung_N+tau_p) 1]; 

Hs1_N = tf(num1_N, den1_N); 

num2N=[G_lung_N*Gc]; 

den2N=[(tau_lung_N*tau_c) (tau_lung_N+tau_c) 1]; 

Hs2N = tf(num2N, den2N); 

[R1_N,I1_N] = nyquist(Hs1_N,w); R1_N=squeeze(R1_N); I1_N=squeeze(I1_N); 

R1del_N=real((R1_N+j*I1_N).*exp(-j*w*Tp_N)); 

I1del_N = imag((R1_N+j*I1_N).*exp(-j*w*Tp_N)); 

[R2_N,I2_N] = nyquist(Hs2N,w); R2_N=squeeze(R2_N); I2_N=squeeze(I2_N); 

R2del_N=real((R2_N+j*I2_N).*exp(-j*w*Tc_N)); 

I2del_N=imag((R2_N+j*I2_N).*exp(-j*w*Tc_N)); 

Rdel_N=R1del_N+R2del_N; 

Idel_N=I1del_N+I2del_N; 

figure(1); 

axis square; plot(Rdel_N,Idel_N, 'b-', 'linewidth', 1.2);  

grid on; hold on; 

title('Nyquist Diagrams for Cheyene-Stokes Breathing Model')  

% For Congestive Heart Failure Patient 

Q_C=0.05;  

Tp_C=12.2;  

Tc_C=14.2; 

G_lung_C=(PaCO2-PICO2)/(VE-VD+863*Q_C*K_CO2); 

tau_lung_C=Vlung/(VE-VD+863*Q_C*K_CO2); 

num1_C=[G_lung_C*Gp]; 

den1_C=[tau_lung_C*tau_p (tau_lung_C+tau_p) 1]; 

Hs1_C = tf(num1_C, den1_C); 

num2_C=[G_lung_C*Gc]; 

den2_C=[(tau_lung_C*tau_c) (tau_lung_C+tau_c) 1]; 

Hs2_C = tf(num2_C, den2_C); 

[R1_C,I1_C] = nyquist(Hs1_C,w); R1_C=squeeze(R1_C); I1_C=squeeze(I1_C); 

R1del_C=real((R1_C+j*I1_C).*exp(-j*w*Tp_C)); 

I1del_C=imag((R1_C+j*I1_C).*exp(-j*w*Tp_C)); 

[R2_C,I2_C] = nyquist(Hs2_C,w); R2_C=squeeze(R2_C); I2_C=squeeze(I2_C); 

R2del_C=real((R2_C+j*I2_C).*exp(-j*w*Tc_C)); 

I2del_C=imag((R2_C+j*I2_C).*exp(-j*w*Tc_C)); 

Rdel_C=R1del_C+R2del_C; 

Idel_C=I1del_C+I2del_C; 

figure(1); 

axis square; plot(Rdel_C,Idel_C, 'r--', 'linewidth', 1.2); 