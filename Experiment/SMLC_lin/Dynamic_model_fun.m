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
% Q=diag([22000 0.1])
% R=0.001
% lqrd(A,B,Q,R,0.0005)
testt(toc,Tevmax);
dX=[0 0 0]';
dX(1:2)=A*X(1:2)+B*u+[0;excitation];
dX(3)= (X(1:2)' * Q * X(1:2) + R * u^2)*10^6;
end

