tic
Tf=8;
dt=0.0005;
x0=[1e-5 0 0];
Q=diag([22000 0.1]);
R=0.001;
m1='-3913.6*y(1) -18.943*y(2)';
b1=@(y)(y);
eval(['b1=@(y)(' m1 ');']);
f=@(T1,Y1) Dynamic_model_fun(Y1,0,0,Q,R,10000);
opts = odeset('RelTol',1e-13,'AbsTol',1e-10);
[T1,Y1]=ode45(f,[0:dt:Tf],x0,opts);
figure(2)
subplot(4,1,1)
plot(T1,Y1(:,1),'linewidth',1.2)
legend({'LQR'})
ylabel('displacment[m]');
title("LQR on non Linear model",'FontSize',8 )


subplot(4,1,2)
plot(T1,Y1(:,2),'linewidth',1.2)
legend({'LQR'})
ylabel('velocity[m/s]');
title({"LQR = " + m1," "},'FontSize',8 )
subplot(4,1,3)
m1=strrep(m1,'y(1)','y(:,1)');
m1=strrep(m1,'y(2)','y(:,2)');
b1=@(y)(y);
eval(['b1=@(y)(' m1 ');']);
plot(T1,b1(Y1(:,1:2)),'linewidth',1.2)
ylabel('u')
legend({'LQR'})
subplot(4,1,4)
plot(T1,Y1(:,3),'linewidth',1.2)
legend({'LQR'})
ylabel('$\int_0^t\frac{dJ}{dt}dt$','interpreter','latex')
title("  J lqr = "+num2str(Y1(end,3)))