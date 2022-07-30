function dX= Dynamic_model_not_lin(t,X,u,Q,R,Tevmax)

persistent X1 filtVel
if t==0 
X1=[];
filtVel=[];
end


if isempty(X1)
    X1=X(1);
else
    X1=[X1,X(1)];
end
k=1272.8; %N/m
c=0.2557; %N*s/m
mass=0.48; %kg
gap=3E-4; %ms
C_magnetic=3.73e-6;%N*m^2/A^2
Ib=30E-3;%A
I1=Ib+u;
I2=Ib-u;
x1=gap+X(1);
x2=gap-X(1);
% testt(toc,Tevmax);
I1=min(max(I1,0),2); %saturation
I2=min(max(I2,0),2); %saturation
dX=[0 0 0]';
Dnum=[246.5320 0 -246.5320];
Dden=[1.0000 -1.1257 0.3722];
L=length(filtVel);
if L>3
    filtVel=[filtVel,Dnum*X1(L-[0:2])'-Dden(2:3)*filtVel(L-[1:2])'];
elseif isempty(filtVel)
    filtVel=X(2);
else
    filtVel=[filtVel,X(2)];
end

dX(1)=filtVel(end);
dX(2)=(C_magnetic*(I1^2/x1^2-I2^2/x2^2)-k*X(1)-c*X(2))/mass;
dX(3)= X(1:2)' * Q * X(1:2) + R * u^2;

end

