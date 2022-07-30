clear
clc
close all
input=importdata('LQR_est.txt');
start=6100;
finish=7100;
t = input(start:finish,1)*500e-6;
t=t-t(1);
x = input(start:finish,2);
u = input(start:finish,3);
est_x = input(start:finish,4);
est_dx = input(start:finish,5);
impuls = input(start:finish,6);
Q=diag([22000 0.1]);
R=0.001;

J=trapz((Q(1,1)*(x./1000000)).^2)+trapz(Q(2,2)*(est_dx./1000000).^2)+trapz((R*u).^2);
figure(1)
subplot(311); plot(t,x); ylabel('displacment [um]');xlabel('t[s]')
subplot(312); plot(t,u); ylabel('Ic [A]');xlabel('t[s]')
subplot(313); plot(t,impuls); ylabel('Impulse [A]');xlabel('t[s]')
figure(2)
 
plot(t,x); ylabel('displacment [um]');xlabel('t [s]'); hold on; plot(t,est_x);legend({'measured X','estimated X'});
% figure(3)
% plot(t,est_dx); ylabel('estimates dx');xlabel('t[s]')