k=100; %N/m
c=0.1; %N*s/m
m=1; %kg
H=tf(1); %ideal sens
G=tf(1,[1 c/m k/m]);
l=3E-4; %m
[A1,A2,A3]=bode(feedback(G,H));
A1 = squeeze(A1);
A2 = squeeze(A2);

Kp=300;
Kd=0.1;
Gc=tf([Kd Kp],1);
[B1,B2,B3]=bode(feedback(G,series(H,Gc)));
B1 = squeeze(B1);
B2 = squeeze(B2);
semilogx(A3,A1,B3,B1)
legend({'Before Pd control','After PD control'})
xlabel('Frequency [rad/s]')
ylabel('Magnitude [dB]')
title('bode plot')

