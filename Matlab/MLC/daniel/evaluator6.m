function J=evaluator6(ind,parameters,i,fig)
Tf=parameters.problem_variables.Tf;
dt=parameters.problem_variables.dt;
Tevmax=parameters.problem_variables.Tevmax;
x0=parameters.problem_variables.x0;
Q=parameters.problem_variables.Q;
R=parameters.problem_variables.R;

m=readmylisp_to_formal_MLC(ind);
m=strrep(m,'S0','y(1)');
m=strrep(m,'S1','y(2)');
m=strrep(m,'S2','y(3)');
m=strrep(m,'S3','y(4)');
b=@(y)(y);
eval(['b=@(y)(' m ');']);
J=parameters.badvalue;
try
    tic
    % Wnoise =Wnoise_LPF(dt,Tf)';
    % stepF=step_BPF(dt,Tf)*9;

    %  f=@(T,Y) Dynamic_model_lin(Y,b(Y(1:2))+0.005*sin(100*T),Q,R,Tevmax);
    %  f=@(T,Y) Dynamic_model_lin(Y,b(Y(1:2))+stepF(floor(T/dt+1)),Q,R,Tevmax);
    %  f=@(T,Y) Dynamic_model_lin(Y,b(Y(1:2))+Wnoise(floor(T/dt+1)),Q,R,Tevmax);
    f=@(T,Y) Dynamic_model_lin6(Y,b(Y(1:4)),Q,R,Tevmax);
    opts = odeset('RelTol',1e-11,'AbsTol',1e-14);
    [T,Y]=ode45(f,[0:dt:Tf],[x0 ;0]',opts);
    if T(end)==Tf
        J=Y(end,5);
    end
catch
    fprintf('crashed\n');
end

if nargin>3 %3
    %LQR
    %   Wnoise =Wnoise_LPF(0.0005,Tf+1)';
%     m1='-4.381112427840022e+03*S0 -24.633634789067290*S1';
    m1='-100.36*S0 -1.3403*S1 -107.61*S2 -6.722*S3';
    m1=strrep(m1,'S0','y(1)');
    m1=strrep(m1,'S1','y(2)');
    m1=strrep(m1,'S2','y(3)');
    m1=strrep(m1,'S3','y(4)');
    b1=@(y)(y);
    eval(['b1=@(y)(' m1 ');']);
    % f=@(T1,Y1) Dynamic_model_lin(Y1,b1(Y1(1:2))+stepF(floor(T1/dt+1)),eye(2),1,100);
    %f=@(T1,Y1) Dynamic_model_lin(Y1,b1(Y1(1:2))+0.005*sin(100*T1),eye(2),1,100);
    % f=@(T1,Y1) Dynamic_model_lin(Y1,b1(Y1(1:2))+Wnoise(floor(T1/0.0005+1)),eye(2),1,100);
    f=@(T1,Y1) Dynamic_model_lin6(Y1,b1(Y1(1:4)),Q,R,100);
    opts = odeset('RelTol',1e-11,'AbsTol',1e-14);
    [T1,Y1]=ode45(f,[0:dt:Tf],[x0 ;0]',opts);

    figure(999)
    subplot(4,1,1)
    plot(T,Y(:,1),'linewidth',1.2)
    hold on
    plot(T1,Y1(:,1),'linewidth',1.2)
    legend({'MLC','LQR'})
    ylabel('displacment[m]');
    title({"b = " + m," "},'FontSize',8 )
    hold off
    subplot(4,1,2)

    plot(T,Y(:,2),'linewidth',1.2)
    hold on
    plot(T1,Y1(:,2),'linewidth',1.2)
    legend({'MLC','LQR'})
    ylabel('velocity[m/s]');
    hold off
    subplot(4,1,3)

    m=strrep(m,'y(1)','y(:,1)');
    m=strrep(m,'y(2)','y(:,2)');
    m=strrep(m,'y(3)','y(:,3)');
    m=strrep(m,'y(4)','y(:,4)');
    b=@(y)(y);
    eval(['b=@(y)(' m ');']);
    plot(T,b(Y(:,1:4)),'linewidth',1.2)
    hold on
    m1=strrep(m1,'y(1)','y(:,1)');
    m1=strrep(m1,'y(2)','y(:,2)');
    m1=strrep(m1,'y(3)','y(:,3)');
    m1=strrep(m1,'y(4)','y(:,4)');
    b1=@(y)(y);
    eval(['b1=@(y)(' m1 ');']);
    plot(T1,b1(Y1(:,1:4)),'linewidth',1.2)
    ylabel('u')
    legend({'MLC','LQR'})
    hold off
    subplot(4,1,4)

    plot(T,Y(:,5),'linewidth',1.2)
    hold on
    plot(T1,Y1(:,5),'linewidth',1.2)
    legend({'MLC','LQR'})
    ylabel('$\int_0^t\frac{dJ}{dt}dt$','interpreter','latex')
    title("J mlc = "+num2str(Y(end,5))+"  J lqr = "+num2str(Y1(end,5)))
    hold off
end