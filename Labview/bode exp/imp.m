format 
clear
clc
input=importdata('test8.txt');
time=(input(:,1)-input(1,1))*350e-6-5.7;
y=input(:,2);
fig1=figure(1);
plot(time,y);
hold on
time2=linspace(0,time(end),10e6);
sinW=sin(0.5*pi*time2.^2);
plot(time2,sinW)

