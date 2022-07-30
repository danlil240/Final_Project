function dX= Dynamic_model_fun(X,u,Q,R,Tevmax)
k=309.2904;%1272.8; %N/m
c=0.1790;%0.2557; %N*s/m
mass=0.1800;%0.48; %kg

% k=1272.8; %N/m
% c=0.2557; %N*s/m
% mass=0.48; %kg
% 
% k = 0.86*1272.8;
% c = 1.8*0.2557; %1.8
% mass = 1.2180*0.48;
% 

gap=3E-4; %ms
C_magnetic=3.73e-6;%N*m^2/A^2
Ib=30E-3;%A
I1=Ib+u;
I2=Ib-u;
x1=gap+X(1);
x2=gap-X(1);
testt(toc,Tevmax);
I1=min(max(I1,0),2); %saturation
I2=min(max(I2,0),2); %saturation
dX=[0 0 0]';
dX(1)=X(2);
dX(2)=(C_magnetic*(I1^2/x1^2-I2^2/x2^2)-k*X(1)-c*X(2))/mass;
dX(3)= (X(1:2)' * Q * X(1:2) + R * u^2);
%%%%%%
% 
% k=309.2904;%1272.8; %N/m
% c=0.1790;%0.2557; %N*s/m
% mass=0.1800;%0.48; %kg
% gap=3E-4; %ms
% C_magnetic=3.73e-6;%N*m^2/A^2
% Ib=30E-3;%A
% A=[0 1; -k/mass-(4*C_magnetic*Ib^2)/(mass*gap^3) -c/mass];
% B=[0 (4*C_magnetic*Ib)/(mass*gap^2)]';
% C=[1 0];
% D=0;
% testt(toc,Tevmax);
% dX=[0 0 0]';
% dX(1:2)=A*X(1:2)+B*u;
% dX(3)= (X(1:2)' * Q * X(1:2) + R * u^2);
% 

end

