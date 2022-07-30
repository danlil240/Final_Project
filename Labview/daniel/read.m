clear
clc
input=importdata('ts1.txt');
start=1;
finish=54000;
t = input(start:end,1)*500e-6;
t=t-t(1);
x = input(start:end,2);
u = input(start:end,3);
impuls = input(start:end,4);
%est_V=input(start:end,5);


figure(1)
subplot(311); plot(t,x); ylabel('displacment [um]');xlabel('t[s]')
subplot(312); plot(t,u); ylabel('Ic [A]');xlabel('t[s]')
subplot(313); plot(t,impuls); ylabel('Impulse [A]');xlabel('t[s]')