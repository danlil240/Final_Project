clear
clc
input=importdata('PD_impulse_est.txt');
start=169200;
finish=170200;
t = input(start:finish,1)*500e-6;
t=t-t(1);
x = input(start:finish,2);
u = input(start:finish,3);
impuls = input(start:finish,4);
est_dx = input(start:finish,5);
%est_V=input(start:finish,5);
Q=diag([22000 0.1]);
R=0.001;

J=trapz((Q(1,1)*(x./1000000)).^2)+trapz(Q(2,2)*(est_dx./1000000).^2)+trapz((R*u).^2);figure(1)
subplot(311); plot(t,x); ylabel('displacment [um]');xlabel('t[s]')
subplot(312); plot(t,u); ylabel('Ic [A]');xlabel('t[s]')
subplot(313); plot(t,impuls); ylabel('Impulse [A]');xlabel('t[s]')