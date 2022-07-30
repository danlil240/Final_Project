function dX= Dynamic_model_fun(X,u,excitation,Q,R,Tevmax)
k=309.2904;%1272.8; %N/m
c=0.1790;%0.2557; %N*s/m
mass=0.1800;%0.48; %kg
gap=3E-4; %ms
C_magnetic=3.73e-6;%N*m^2/A^2
Ib=30E-3;%A
A=[0 1; -k/mass-(4*C_magnetic*Ib^2)/(mass*gap^3) -c/mass];
B=[0 (4*C_magnetic*Ib)/(mass*gap^2)]';
C=[1 0];
D=0;
Vd=eye(2);
Vn=.1;
Vdn=[0;0];
sys=ss(A,B,C,D);
Q=1;
R=1;
N=0;
[kalmf,L,P] = kalman(sys,Q,R,N,[1],[],'delayed');
Aest=A-L*C;
Best=L;
Cest=eye(2);
Dest=[0;0];
sysk=ss(Aest,Best,Cest,Dest);
[b,a]=ss2tf(Aest,Best,Cest,Dest)


testt(toc,Tevmax);
dX=[0 0 0]';
dX(1:2)=A*X(1:2)+B*(u+excitation);
dX(3)= (X(1:2)' * Q * X(1:2) + R * u^2)*10^6;
end

