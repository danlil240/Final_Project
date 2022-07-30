%% Default

clc
clear 
close all

 k=1272.8; %N/m
 c=0.1; %N*s/m
 m=0.48; %kg
 H=1; %ideal sens
 gap=3E-4; %m
 C_magnetic=3.73e-6;%N*m^2/A^2
 Ib=50E-3;%A
%  l(1)=(8-k/m-(4*C_magnetic*Ib^2)/(m*gap^3)+4-c/m)/(c/m+1+k/m+(4*C_magnetic*Ib^2)/(m*gap^3));
%  l(2)=4-c/m-l(1);
 A=[0 1; -k/m-(4*C_magnetic*Ib^2)/(m*gap^3) -c/m];
B=[0;(4*C_magnetic*Ib)/(m*gap^2)];
C=[1 0;0 0];
D=0;
 disp("rank C_b:");
 disp( rank(ctrb(A,B)));%controlability
 sys=ss(A,B,C,D);
Q=diag([400 5]);
R=0.5;
[Kr,S,e]=lqr(sys,Q,R);
Vd=diag([500 10]);
Vn=0.01;
Kf=lqr(A',C',Vd,Vn);

simOut=sim('notLinModel_S_LQG.slx',0.5);
y=simOut.xx.Data;
x=simOut.xx.Time;
figure1=figure('Name','default Q=[4 5]   R=[3]','NumberTitle','Off');
subplot(3,1,1)
p(1)=plot(x,y);
hold on

y1=simOut.I1.Data;
x1=simOut.I1.Time;
y2=simOut.I2.Data;
x2=simOut.I2.Time;
subplot(3,1,2)
p(2:3)=plot(x1,y1,x2,y2);
hold on

y1=simOut.f1.Data;
x1=simOut.f1.Time;
y2=simOut.f2.Data;
x2=simOut.f2.Time;
subplot(3,1,3)
p(4:5)=plot(x1,y1,x2,y2);
hold on


legend(p(1),{'Location'})
legend(p(2:3),{'I1','I2'})
legend(p(4:5),{'F1','F2'})
title(subplot(3,1,1),'Location')
xlabel(subplot(3,1,1),'time [s]')
ylabel(subplot(3,1,1),'location [m]')
title(subplot(3,1,2),'Currents')
xlabel(subplot(3,1,2),'time [s]')
ylabel(subplot(3,1,2),'Current [A]')
title(subplot(3,1,3),'Force')
xlabel(subplot(3,1,3),'time [s]')
ylabel(subplot(3,1,3),'Force [N]')



%% Custom Q & R
clc
clear 
close all
opengl('software')
opengl('save','software')
 k=1272.8; %N/m
 c=0.1; %N*s/m
 m=0.48; %kg
 H=1; %ideal sens
 gap=3E-4; %m
 C_magnetic=3.73e-6;%N*m^2/A^2
 Ib=50E-3;%A
 A=[0 1; -k/m-(4*C_magnetic*Ib^2)/(m*gap^3) -c/m];
 B=[0;(4*C_magnetic*Ib)/(m*gap^2)];
 C=[1 0];
 D=0;
 Vd=diag([50 1]);
Vn=0.01;
Kf=lqr(A',C',Vd,Vn);
 C_b=[B A*B];
 disp("rank C_b:");
 disp(rank(C_b));%controlability
 sys=ss(A,B,C,D);
while input("You wish to continue? y/n: ",'s')=='y'
Q=diag(input("Please enter Q diag vector: "));
R=input("Please enter R: ");
[Kr,S,e]=lqr(sys,Q,R);
simOut=sim('notLinModel_S.slx');
y=simOut.xx.Data;
x=simOut.xx.Time;
figure1=figure('Name','Custom Q & R','NumberTitle','Off');
subplot(3,1,1)
p(1)=plot(x,y);
hold on

y1=simOut.I1.Data;
x1=simOut.I1.Time;
y2=simOut.I2.Data;
x2=simOut.I2.Time;
subplot(3,1,2)
p(2:3)=plot(x1,y1,x2,y2);
hold on

y1=simOut.f1.Data;
x1=simOut.f1.Time;
y2=simOut.f2.Data;
x2=simOut.f2.Time;
subplot(3,1,3)
p(4:5)=plot(x1,y1,x2,y2);
hold on


legend(p(1),{'Location'})
legend(p(2:3),{'I1','I2'})
legend(p(4:5),{'F1','F2'})
title(subplot(3,1,1),'Location')
xlabel(subplot(3,1,1),'time [s]')
ylabel(subplot(3,1,1),'location [m]')
title(subplot(3,1,2),'Currents')
xlabel(subplot(3,1,2),'time [s]')
ylabel(subplot(3,1,2),'Current [A]')
title(subplot(3,1,3),'Force')
xlabel(subplot(3,1,3),'time [s]')
ylabel(subplot(3,1,3),'Force [N]')
end


%% Comparison
clc
clear all
close all

 k=1272.8; %N/m
 c=0.1; %N*s/m
 mass=0.48; %kg
 H=1; %ideal sens
 gap=3E-4; %m
 C_magnetic=3.73e-6;%N*m^2/A^2
 Ib=50E-3;%A
 A=[0 1; -k/mass-(4*C_magnetic*Ib^2)/(mass*gap^3) -c/mass];
 B=[0;(4*C_magnetic*Ib)/(mass*gap^2)];
 C=[1 0];
 D=0;
 Vd=diag([50 1]);
Vn=0.01;
Kf=lqr(A',C',Vd,Vn);
 C_b=[B A*B];
 disp("rank C_b:");
 disp(rank(C_b));%controlability
 sys=ss(A,B,C,D);
fig1=figure('Name','Location','NumberTitle','Off','windowState','maximized');
fig2=figure('Name','Currents','NumberTitle','Off','windowState','maximized');
fig3=figure('Name','Force','NumberTitle','Off','windowState','maximized');
for i=1:5
Q=diag([1 10*i]);
R=5;
[Kr,S,e]=lqr(sys,Q,R);
simOut=sim('notLinModel_S.slx',1);
y=simOut.xx.Data;
x=simOut.xx.Time;
figure(fig1);
subplot(3,1,1)
p(i,1)=plot(x,y);
hold on

y1=simOut.I1.Data;
x1=simOut.I1.Time;
y2=simOut.I2.Data;
x2=simOut.I2.Time;
figure(fig2);
subplot(3,1,1)
p(i,2:3)=plot(x1,y1,x2,y2);
hold on

y1=simOut.f1.Data;
x1=simOut.f1.Time;
y2=simOut.f2.Data;
x2=simOut.f2.Time;
figure(fig3);
subplot(3,1,1)
p(i,4:5)=plot(x1,y1,x2,y2);
hold on

Q=diag([i*5000 1]);
R=0.5;
[Kr,S,e]=lqr(sys,Q,R);
simOut=sim('notLinModel_S.slx',1);
y=simOut.xx.Data;
x=simOut.xx.Time;
figure(fig1);
subplot(3,1,2)
p(i+5,1)=plot(x,y);
hold on

y1=simOut.I1.Data;
x1=simOut.I1.Time;
y2=simOut.I2.Data;
x2=simOut.I2.Time;
figure(fig2);
subplot(3,1,2)
p(i+5,2:3)=plot(x1,y1,x2,y2);
hold on

y1=simOut.f1.Data;
x1=simOut.f1.Time;
y2=simOut.f2.Data;
x2=simOut.f2.Time;
figure(fig3);
subplot(3,1,2)
p(i+5,4:5)=plot(x1,y1,x2,y2);
hold on

Q=diag([1 1]);
R=2^-i;
[Kr,S,e]=lqr(sys,Q,R);
simOut=sim('notLinModel_S.slx',1);
y=simOut.xx.Data;
x=simOut.xx.Time;
figure(fig1);
subplot(3,1,3)
p(i+10,1)=plot(x,y);
hold on

y1=simOut.I1.Data;
x1=simOut.I1.Time;
y2=simOut.I2.Data;
x2=simOut.I2.Time;
figure(fig2);
subplot(3,1,3)
p(i+10,2:3)=plot(x1,y1,x2,y2);
hold on

y1=simOut.f1.Data;
x1=simOut.f1.Time;
y2=simOut.f2.Data;
x2=simOut.f2.Time;
figure(fig3);
subplot(3,1,3)
p(i+10,4:5)=plot(x1,y1,x2,y2);
hold on
end
figure(fig1);
legend(p(1:5,1),{'1','2','3','4','5'})
title(subplot(3,1,1),'R=5   Q=[1 10*i]')
xlabel(subplot(3,1,1),'time [s]')
ylabel(subplot(3,1,1),'location [m]')
legend(p(6:10,1),{'1','2','3','4','5'})
title(subplot(3,1,2),'R=0.5   Q=[i*5000 1]')
xlabel(subplot(3,1,2),'time [s]')
ylabel(subplot(3,1,2),'location [m]')
legend(p(11:15,1),{'1','2','3','4','5'})
title(subplot(3,1,3),'R=2^-i   Q=[1 1]')
xlabel(subplot(3,1,3),'time [s]')
ylabel(subplot(3,1,3),'location [m]')

figure(fig2);
legend(reshape(p(1:5,2:3),[10,1]),{'I1_1','I1_2','I1_3','I1_4','I1_5','I2_1','I2_2','I2_3','I2_4','I2_5'},'NumColumns',2)
title(subplot(3,1,1),'R=5   Q=[1 10*i]')
xlabel(subplot(3,1,1),'time [s]')
ylabel(subplot(3,1,1),'Current [A]')
legend(reshape(p(6:10,2:3),[10,1]),{'I1_1','I1_2','I1_3','I1_4','I1_5','I2_1','I2_2','I2_3','I2_4','I2_5'},'NumColumns',2)
title(subplot(3,1,2),'R=0.5   Q=[i*5000 1]')
xlabel(subplot(3,1,2),'time [s]')
ylabel(subplot(3,1,2),'Current [A]')
legend(reshape(p(11:15,2:3),[10,1]),{'I1_1','I1_2','I1_3','I1_4','I1_5','I2_1','I2_2','I2_3','I2_4','I2_5'},'NumColumns',2)
title(subplot(3,1,3),'R=2^-i   Q=[1 1]')
xlabel(subplot(3,1,3),'time [s]')
ylabel(subplot(3,1,3),'Current [A]')

figure(fig3);
legend(reshape(p(1:5,4:5),[10,1]),{'F1_1','F1_2','F1_3','F1_4','F1_5','F2_1','F2_2','F2_3','F2_4','F2_5'},'NumColumns',2)
title(subplot(3,1,1),'R=5   Q=[1 10*i]')
xlabel(subplot(3,1,1),'time [s]')
ylabel(subplot(3,1,1),'Force [N]')
legend(reshape(p(6:10,4:5),[10,1]),{'F1_1','F1_2','F1_3','F1_4','F1_5','F2_1','F2_2','F2_3','F2_4','F2_5'},'NumColumns',2)
title(subplot(3,1,2),'R=0.5   Q=[i*5000 1]')
xlabel(subplot(3,1,2),'time [s]')
ylabel(subplot(3,1,2),'Force [N]')
legend(reshape(p(11:15,4:5),[10,1]),{'F1_1','F1_2','F1_3','F1_4','F1_5','F2_1','F2_2','F2_3','F2_4','F2_5'},'NumColumns',2)
title(subplot(3,1,3),'R=2^-i   Q=[1 1]')
xlabel(subplot(3,1,3),'time [s]')
ylabel(subplot(3,1,3),'Force [N]')

%G=tf((4*C*Ib)/(m*l^2),[1 c/m k/m+(4*C*Ib^2)/(m*l^3)]);

% step(G);
% hold on;
% step(feedback(G,tf(K,1)));



