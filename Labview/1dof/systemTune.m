close all 
clear 
clc

k=345.0; %N/m
c=0.75; %N*s/m
mass=k/(4.5*2*pi)^2; %kg
gap=3E-4; %ms
C_magnetic=3.73e-6;%N*m^2/A^2
Ib=50E-3;%A
A=[0 1; -k/mass-(4*C_magnetic*Ib^2)/(mass*gap^3) -c/mass];
B=[0 (4*C_magnetic*Ib)/(mass*gap^2)]';
C=[1 1];
D=0;

init=40000;
sys=ss(A,B,C,D);

inputNoControl=importdata('impulse.txt');
inputNoControl(init:end,1)=(inputNoControl(init:end,1)-inputNoControl(1,1))*300e-6;
inputNoControl(init:end,2)=inputNoControl(init:end,2)-mean(inputNoControl(init:end,2));
t=inputNoControl(init:end,1)-inputNoControl(init,1);
u=-inputNoControl(init:end,3);
[y,tOut,x] = lsim(sys,u,t);
y=x(:,1)*1e+6;

figure('DefaultAxesFontName','David','DefaultAxesFontSize',14, 'DefaultAxesFontWeight', 'bold','units','normalized','outerposition',[0 0 1 1])
subplot(3,1,1)

plot(t,inputNoControl(init:end,2),'DisplayName','Real System','LineWidth',1);hold on
plot(t,y,'DisplayName','Tuned Model','LineWidth',1);
legend;ylabel('Displacment[\mum]')
title('System Tuning')
subplot(3,1,2)
plot(t,u,'LineWidth',1)
xlabel('Time[s]');ylabel('Input Current[A]')
subplot(3,1,3)
plot(t,u,'LineWidth',1)
xlabel('Time[s]');ylabel('Input Current[A]')

%% PD comparison real to sim
Q=diag([22000 0.1]);
R=0.001;
Kr=lqr(A,B,Q,R);
Kr=[15000,7]

sysCL=ss(A-B*Kr,B,C,D);
init=192000;%find(abs(input(:,4))>0.0001);
fin=init+1000;
input=importdata('PD_impulse_est.txt');
input(:,1)=(input(:,1)-input(1,1))*300e-6;
input(init:fin,2)=input(init:fin,2)-mean(input(init:fin,2));
t=input(init:fin,1)-input(init,1);
u=input(init:fin,4);
[y,tOut,x] = lsim(sysCL,u,t);
y=x(:,1)*1e+6;
x_real=[input(init:fin,2)*1e-6 input(init:fin,3)];
% J_sim=zeros(length(t),1);
% J_real=zeros(length(t),1);
% for i=2:length(t)
%     J_sim(i)=J_sim(i-1)+x(i,:)*Q*x(i,:)'+u(i)*R*u(i)';
%     J_real(i)=J_real(i-1)+x_real(i,:)*Q*x_real(i,:)'+u(i)*R*u(i)';
% end

figure('DefaultAxesFontName','David','DefaultAxesFontSize',14, 'DefaultAxesFontWeight', 'bold','units','normalized','outerposition',[0 0 1 1])
subplot(2,1,1)

plot(t,input(init:fin,2),'DisplayName','Real System','LineWidth',1);hold on
plot(t,y,'DisplayName','Tuned Model','LineWidth',1);
xlim([0,t(end)])
legend;ylabel('Displacment[\mum]')
title('PD Copmarison')
subplot(2,1,2)
plot(t,u,'LineWidth',1)
ylabel('Input Current[A]')
xlim([0,t(end)]) ;xlabel('Time[s]')
% 
% subplot(3,1,3)
% plot(t,J_sim,'LineWidth',1,'DisplayName','Tuned Model')   ;hold on
% % plot(t,J_real,'LineWidth',1,'DisplayName','Real System')
% xlabel('Time[s]');ylabel('J');
% legend
xlim([0,t(end)])

%% PD comparison sim to sim

Q=diag([22000 0.1]);
R=0.001;
Kr=lqr(A,B,Q,R);
Kr=[15000,7]

sysCL=ss(A-B*Kr,B,C,D);
sysOL=ss(A,B,C,D);
init=192000;%find(abs(input(:,4))>0.0001);
fin=init+1000;
input=importdata('PD_impulse_est.txt');
input(:,1)=(input(:,1)-input(1,1))*300e-6;
input(init:fin,2)=input(init:fin,2)-mean(input(init:fin,2));
t=input(init:fin,1)-input(init,1);
u=input(init:fin,4);
[y,tOut,x_cl] = lsim(sysCL,u,t);
[y2,tOut2,x_ol] = lsim(sysOL,u,t);
y=x_cl(:,1)*1e+6;
x_real=[input(init:fin,2)*1e-6 input(init:fin,3)];
% J_sim=zeros(length(t),1);
% J_real=zeros(length(t),1);
% for i=2:length(t)
%     J_sim(i)=J_sim(i-1)+x(i,:)*Q*x(i,:)'+u(i)*R*u(i)';
%     J_real(i)=J_real(i-1)+x_real(i,:)*Q*x_real(i,:)'+u(i)*R*u(i)';
% end

figure('DefaultAxesFontName','David','DefaultAxesFontSize',14, 'DefaultAxesFontWeight', 'bold','units','normalized','outerposition',[0 0 1 1])
subplot(2,1,1)

plot(t,x_ol(:,1)*1e+6,'DisplayName','Open Loop System','LineWidth',1);hold on
plot(t,y,'DisplayName','Closed Loop System','LineWidth',1);
xlim([0,t(end)])
legend;ylabel('Displacment[\mum]')
title('PD Copmarison')
subplot(2,1,2)
plot(t,u,'LineWidth',1)
ylabel('Input Current[A]')
xlim([0,t(end)]) ;xlabel('Time[s]')
% 
% subplot(3,1,3)
% plot(t,J_sim,'LineWidth',1,'DisplayName','Tuned Model')   ;hold on
% % plot(t,J_real,'LineWidth',1,'DisplayName','Real System')
% xlabel('Time[s]');ylabel('J');
% legend
xlim([0,t(end)])




%% LQR comparison
% Q=diag([22000 0.1]);
% R=0.001;
% Kr=lqr(A,B,Q,R);
Kr=[5000,7.2]
sysCL=ss(A-B*Kr,B,C,D);

input=importdata('LQR_impulse.txt');
init=52800;%find(abs(input(:,4))>0.0001);
fin=init+1000;
input(init:fin,1)=(input(init:fin,1)-input(1,1))*300e-6;
input(init:fin,2)=input(init:fin,2)-mean(input(init:fin,2));
t=input(init:fin,1)-input(init,1);
u=input(init:fin,4);
[y,tOut,x] = lsim(sysCL,u,t);
y=x(:,1);

figure('DefaultAxesFontName','David','DefaultAxesFontSize',14, 'DefaultAxesFontWeight', 'bold','units','normalized','outerposition',[0 0 1 1])
subplot(2,1,1)

plot(t,input(init:fin,2),'DisplayName','Real System','LineWidth',1);hold on
plot(t,y,'DisplayName','Tuned Model','LineWidth',1);
xlim([0,t(end)])
legend;ylabel('Displacment[\mum]')
title('LQR Copmarison')
subplot(2,1,2)
plot(t,u,'LineWidth',1)
xlabel('Time[s]');ylabel('Input Current[A]')
xlim([0,t(end)])
