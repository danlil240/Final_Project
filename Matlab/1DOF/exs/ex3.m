k=1272.8; %N/m
c=0.1; %N*s/m
m=0.48; %kg
H=1; %ideal sens
l=3E-4; %m
C=3.73e-6;
Ib=50E-3;
ts=1;
Kp=7433.33;
Kd=8.15;
a=sim('ex3S.slx',ts);
plot(a.xx);
hold on
Kp=1;
Kd=0;
a=sim('ex3S.slx',ts);
plot(a.xx);
legend({'With PD','Without PD'})
ylabel('Displacment [m]')
xlabel('time [s]')