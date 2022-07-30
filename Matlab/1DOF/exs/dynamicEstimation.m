function k=dynamicEstimation(tspan_model,dx_model,tspan_measure,dx_measure,time)
x=0:0.001:time;
dx_measure=interp1(tspan_measure,dx_measure,x);
dx_model=interp1(tspan_model,dx_model,x);

% Golden section method
figure('Name','Error','NumberTitle','Off');
hold on;
a=-5;
b=5;
epsilon=10E-6;
iter= 50;
tau=double((sqrt(5)-1)/2);
cnt=0;

x1=a+(1-tau)*(b-a);
x2=a+tau*(b-a);

f_x1=sum(abs(x1.*dx_model-dx_measure));
f_x2=sum(abs(x2.*dx_model-dx_measure));

plot(x1,f_x1,'rx')
plot(x2,f_x2,'rx')

while ((abs(b-a)>epsilon) && (cnt<iter))
    cnt=cnt+1;
    if(f_x1<f_x2)
        b=x2;
        x2=x1;
        x1=a+(1-tau)*(b-a);
        f_x1=sum(abs(x1.*dx_model-dx_measure));
        f_x2=sum(abs(x2.*dx_model-dx_measure));
        plot(x1,f_x1,'rx');
    else
        a=x1;
        x1=x2;
        x2=a+tau*(b-a);
        f_x1=sum(abs(x1.*dx_model-dx_measure));
        f_x2=sum(abs(x2.*dx_model-dx_measure));
        plot(x2,f_x2,'rx')
    end
    cnt=cnt+1;
end

if(f_x1<f_x2)
    plot(x1,f_x1,'ro')
    k=x1;
else
    plot(x2,f_x2,'ro')
    k=x2;
end
% graphics:
K=linspace(-5,5,1000);
v=zeros(1000,1);
for i =1:1000
   v(i)= sum(abs(K(i).*dx_model-dx_measure));
end
plot(K,v);
xlabel('k')
ylabel('Error')
figure('Name','Comparison','NumberTitle','Off');
hold on
plot(x,dx_measure)
plot(x,dx_model)
plot(x,k.*dx_model)
legend({'dx-measure','dx-model','k*dx-model'})
xlabel('time [s]')
ylabel('Velocity [m/s]')
end
