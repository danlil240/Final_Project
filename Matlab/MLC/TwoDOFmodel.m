clc
close all
clear all

k2=1272.8; %N/m
c2=0.2557; %N*s/m
m2=0.48; %kg

wn1 = 2*pi*90;
k1 = k2;
m1 = k1/wn1^2;
c1 = 0.001;
% gap=3E-4; %ms
% C_magnetic=3.73e-6;%N*m^2/A^2
% Ib=50E-3;%A
% A=[0 1; -k/mass-(4*C_magnetic*Ib^2)/(mass*gap^3) -c/mass];
% B=[0 (4*C_magnetic*Ib)/(mass*gap^2)]';


A = [0 1 0 0;...
    -k1/m1  -c1/m1 k1/m1 c1/m1;...
    0 0 0 1;...
    k1/m2 c1/m2 -(k1+k2)/m2 -(c1+c2)/m2];
B = [0 1/m1 0 0]';
C = [1 0 0 0;0 1 0 0];
D = 0;

sys = ss(A,B,C,D);

% bode(sys)
% 
% damp(sys)

% impulse(sys)

Q=diag([22000 0.1 0 0]);
% Q = diag([1000 0.5]);
R = 0.1;
[K,S,e] = lqr(sys,Q, R);

Acl = A-B*K;
syscl = ss(Acl,B,C,D);
figure
impulse(sys,syscl); legend('sys','syscl')
