clc
clear
format long
x1=linspace(0,10,100);
x2=linspace(0,10,110);
y1=cos(x1); %exemple model
y2=2.5*cos(0.97*x2);  %exemple measure
l=dynamicEstimation(x1,y1,x2,y2,10);

% fnmin-function min
k=linspace(-5,5,1000);
x=0:0.001:10;
y1=interp1(x1,y1,x);
y2=interp1(x2,y2,x);
for i =1:1000
   v(i)= sum(abs(k(i).*y1-y2));
end
spl=spline(k,v); % spline of the error(k) 
% fnplt(spl)
[a,b]=fnmin(spl);
disp("numerical(golden section) solution:")
disp(l)
disp("matlab solution:")
disp(b)