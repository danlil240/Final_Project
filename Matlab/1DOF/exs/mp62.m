% Pole placement gain selection using Ackermann's formula.
% mp62.m
% creat by Ziv Brand 20/08/2021
clear all
clc
clear all


A = [-2 -3;-1 -4];
B = [0 1]';
C = [1 0];
D = 0;


    
%     clear all
% clc
% clear all
% 
% k = 1000; % [N/m]
% m = 1; % [Kg]
% c = 10; %[N*sec/m]
% A = [0 1;-k/m -c/m];
% B = [0 1/m]';
% C = [1 0];
% D = 0;
Cf = eye(2);

csi = 0.8;
wn = 10;
syms v
P = solve(v^2 + 2*csi*wn*v+wn^2,v)';
P = [sym2poly(P(1)) sym2poly(P(2))];
L = acker(A',C',P)' % 
% L = place(A',C',P)' % 

eig(A-L*C)
eig(A)

X0=[1;-2]; % initial state
X0hat=[0;0]; % initial estimate

datas = sim('mp62s.slx',4);
figure(1)
subplot(221); 
plot(datas.Xs.time,datas.Xs.signals.values); legend('x1','x2')
title('x')
subplot(223); 
plot(datas.Xshat.time,datas.Xshat.signals.values); legend('x1hat','x2hat')
title('xhat')
subplot(222)
plot(datas.Xs.time,datas.Xs.signals.values(:,2),datas.Xshat.time,datas.Xshat.signals.values(:,2))
legend('x2','x2hat')
subplot(224)
plot(datas.Xs.time,datas.Xs.signals.values(:,1)-datas.Xshat.signals.values(:,1),datas.Xs.time,datas.Xs.signals.values(:,2)-datas.Xshat.signals.values(:,2))
legend('error(x1-x1hat)','error(x2-x2hat)')