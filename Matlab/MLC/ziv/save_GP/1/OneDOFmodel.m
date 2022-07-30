close all
clear all
clc

% m = 0.48;
% k = 1272.8;
% c = 0.2557;
% 
% 
% A = [0 1;-k/m -c/m];
% B = [0 1/m]';
% C = [1 0;0 1];
% D = 0;
% 

k=1272.8; %N/m
c=0.2557; %N*s/m
mass=0.48; %kg
gap=3E-4; %ms
C_magnetic=3.73e-6;%N*m^2/A^2
Ib=30E-3;%A
A=[0 1; -k/mass-(4*C_magnetic*Ib^2)/(mass*gap^3) -c/mass];
B=[0 (4*C_magnetic*Ib)/(mass*gap^2)]';
C=[1 0];
D=0;


sys = ss(A,B,C,D);

Q=diag([22000 0.1]);%Q = diag([1000 0.5]);
R = 0.001;
[K,S,e] = lqr(sys,Q, R);
K
[Kd,Sd,ed] = lqrd(A,B,Q,R,400e-6);
Kd

% Acl = A-B*K;
% syscl = ss(Acl,B,C,D);
% 
% impulse(sys,syscl); legend('sys','syscl')
