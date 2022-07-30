function dX= Dynamic_model_lin_mod2(t,X,u,Q,R,Tevmax)

% k=1272.8; %N/m
% c=0.2557; %N*s/m
% mass=0.48; %kg
% gap=3E-4; %ms
% C_magnetic=3.73e-6;%N*m^2/A^2
% Ib=30E-6;%A
% Kx = (4*C_magnetic*Ib^2)/(mass*gap^3);
% Ki = (4*C_magnetic*Ib)/(mass*gap^2);
% 
% sys1 = tf(Ki,[mass c k+Kx]);
% wn2 = 2*pi*90;
% xi = 0.01;
% sys2 = tf(wn2^2,[1 2*xi*wn2 wn2^2]);
% % bode(sys1,sys1*sys2)
% sys = sys1*sys2;
% [a b] = tfdata(sys,'v');
% [A,B,C,D] = tf2ss(a,b);
% A=[-11.8,-322432,-200336,-847937882;...
%   1,0,0,0;...
%   0,1,0,0;...
%   0,0,1,0];
% B=[1 0 0 0]';            
% C = [0,0,0,6902;0 0 6902 0];
% D=0;
k2=1272.8; %N/m
c2=0.2557; %N*s/m
m2=0.48; %kg

wn1 = 2*pi*90;
k1 = k2;
m1 = k1/wn1^2;
c1 = 0.001;
A = [0 1 0 0;...
    -k1/m1  -c1/m1 k1/m1 c1/m1;...
    0 0 0 1;...
    k1/m2 c1/m2 -(k1+k2)/m2 -(c1+c2)/m2];
B = [0 1/m1 0 0]';
C = [1 0 0 0;0 1 0 0];
D = 0;
 testt(toc,Tevmax);
dX=zeros(5,1);
dX(1:4)=A*X(1:4)+B*u;
y=C*X(1:4)+D*u;
dX(5)= (y(1:2)' * Q * y(1:2) + R * u^2);%*10^6;
end

