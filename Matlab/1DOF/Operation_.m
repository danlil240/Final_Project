
clc
clear
close all
%  opengl('software')
%  opengl('save','software')
k=1272.8; %N/m
c=0.1; %N*s/m
mass=0.48; %kg

k=345.0; %N/m
c=0.75; %N*s/m
mass=k/(4.5*2*pi)^2; %kg
H=1; %ideal sens
gap=3E-4; %m
C_magnetic=3.73e-6;%N*m^2/A^2
Ib=50E-3;%A
A=[0 1; -k/mass-(4*C_magnetic*Ib^2)/(mass*gap^3) -c/mass];
B=[0 (4*C_magnetic*Ib)/(mass*gap^2)]';
C=[1 0];
D=0;
disp("rank C_b:");
disp( rank(ctrb(A,B)));%controlability
%LQR
Q=diag([22000 0.1]);
R=0.001;
Kr=lqr(A,B,Q,R);

sys=ss(A,B,C,D);
figure(2)
bode(sys);

sysLQR=ss(A-B*Kr,B,C,D);
figure(3)
bode(sysLQR);


isMLC=0;
isLQR=1;
simOut=sim("notLinModel_S_cc.slx",0.6);
T=simOut.tout;
log1=simOut.logsout{1};
log2=simOut.logsout{2};
log3=simOut.logsout{3};
Y(:,1)=log2.Values.data;
Y(:,2)=log1.Values.data;
bData=log3.Values.data;
Y(:,3)=Y(:,1).^2+Y(:,2).^2+R*bData.^2;
J1=sum(Y(:,3));

figure(1)

subplot(4,1,1)
plot(T,Y(:,1),'linewidth',1.2)
xlabel('t');
ylabel('x');
hold on
subplot(4,1,2)
hold on
plot(T,Y(:,2),'k','linewidth',1.2)
xlabel('t');
ylabel('dx');
hold on
subplot(4,1,3)
hold on
plot(T,bData,'k','linewidth',1.2)
xlabel('t');
ylabel('u');
hold on
subplot(4,1,4)
plot(T,Y(:,3),'k','linewidth',1.2)
xlabel('t');
ylabel('u');

hold on
isMLC=0;
isLQR=1;
simOut=sim("notLinModel_S_cc.slx",0.6);
T=simOut.tout;
log1=simOut.logsout{1};
log2=simOut.logsout{2};
log3=simOut.logsout{3};
clear Y
Y(:,1)=log2.Values.data;
Y(:,2)=log1.Values.data;
bData=log3.Values.data;
Y(:,3)=Y(:,1).^2+Y(:,2).^2+R*bData.^2;
J2=sum(Y(:,3));

subplot(4,1,1)
plot(T,Y(:,1),'linewidth',0.8)
xlabel('t');
ylabel('x');
legend({'MLC','LQR'})
subplot(4,1,2)
plot(T,Y(:,2),'linewidth',0.8)
xlabel('t');
ylabel('dx');
legend({'MLC','LQR'})
subplot(4,1,3)
plot(T,bData,'linewidth',0.8)
xlabel('t');
ylabel('u');
legend({'MLC','LQR'})
subplot(4,1,4)
plot(T,Y(:,3),'linewidth',0.8)
xlabel('t');
ylabel('u');
legend({'MLC','LQR'})
title("J(MLC) = "+num2str(J1)+"   J(LQR) = "+num2str(J2))
%kalman filter
Vd=diag([500 30]);
Vn=0.01;
Kf=lqr(A',C',Vd,Vn)';
% Lanberger filter
% csi = 0.8;
% wn = 600;
% syms v
% P = solve(v^2 + 2*csi*wn*v+wn^2,v)';
% P = [sym2poly(P(1)) sym2poly(P(2))]
% % L = acker(A',C(1,:)',P)'; %
% L = place(A',C',P)' %
% eig(A-L*C(1,:))
% eig(A)
% X0=[1;-2]; % initial state
% X0hat=[0;0]; % initial estimate


% simOutLin=sim('linModel_S.slx',0.4);
%  simOutNoLin=sim('notLinModel_S.slx',0.5);
% figure('Name','Kalman filter','NumberTitle','Off');
% hold on
% xlabel('time[s]');
% ylabel('displacment[m]');
%   plot(simOutNoLin.xx.Time,simOutNoLin.xx.Data)
%  plot(simOutNoLin.xx_hat.Time,simOutNoLin.xx_hat.Data)
%  xOut(1)=simOutNoLin.xx.Time;
%  xOut(2)=simOutNoLin.xx.Data;
% plot(simOutLin.y.Time,simOutLin.y.Data);
% plot(simOutLin.x_hat.Time,simOutLin.x_hat.Data);
%  legend({'x not linear','x hat not linear','x linear','x hat linear'})
%  legend({'x ','x hat'})

%end