clear
clc
input=importdata('LQR_impulse.txt');
start=52500;
finish=54000;
t = input(start:finish,1)*500e-6;
t=t-t(1);
x = input(start:finish,2);
u = input(start:finish,3);
impuls = input(start:finish,4);
est_V=input(start:finish,5);


figure(1)
subplot(311); plot(t,x); ylabel('displacment [um]');xlabel('t[s]')
subplot(312); plot(t,u); ylabel('Ic [A]');xlabel('t[s]')
subplot(313); plot(t,impuls); ylabel('Impulse [A]');xlabel('t[s]')