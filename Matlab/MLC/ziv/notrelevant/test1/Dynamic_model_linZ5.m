function dX= Dynamic_model_linZ5(X,u,Q,R,Tevmax)
k=1272.8; %N/m
c=0.2557; %N*s/m
mass=0.48; %kg
gap=3E-4; %ms
C_magnetic=3.73e-6;%N*m^2/A^2
Ib=50E-3;%A
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
dX(3)= X(1:2)' * Q * X(1:2) + R * u^2;

end

