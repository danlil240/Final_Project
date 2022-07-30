function [dx]=od(x,u,Kr,Kf)
k=1272.8; %N/m
c=0.1; %N*s/m
m=0.48; %kg
H=1; %ideal sens
gap=3E-4; %m
C_magnetic=3.73e-6;%N*m^2/A^2
Ib=50E-3;%A
A=[0 1; -k/m-(4*C_magnetic*Ib^2)/(m*gap^3) -c/m];
B=[0;(4*C_magnetic*Ib)/(m*gap^2)];
C=[1 0;0 0];
D=0;

dx(1:2)= (A-Kf*C)*x(1:2)-B.*Kr'.*x(3:4)+Kf*C*x(3:4);
dx(3:4)=(A*x(3:4)+B.*Kr'.*x(1:2))';
dx=dx';
end