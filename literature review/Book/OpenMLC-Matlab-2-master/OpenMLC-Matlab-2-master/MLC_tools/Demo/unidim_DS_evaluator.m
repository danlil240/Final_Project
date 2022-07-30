
%mlc=MLC2('unidim_DS_script')
function J=unidim_DS_evaluator(ind,mlc_parameters,i,fig)
%% Obtaining parameters from MLC object.
Tf=mlc_parameters.problem_variables.Tf;
objective=mlc_parameters.problem_variables.objective;
gamma=mlc_parameters.problem_variables.gamma;
Tevmax=mlc_parameters.problem_variables.Tevmax;
k =1272.8; %N/m
c=0.1; %N*s/m
mass=0.48; %kg
H=1; %ideal sens
gap=3E-4; %m
C_magnetic=3.73e-6;%N*m^2/A^2
Ib=50E-3;%A
assignin("base","mass",mass);
assignin("base","k",k);
assignin("base","c",c);
assignin("base","gap",gap);
assignin("base","C_magnetic",C_magnetic);
assignin("base","Ib",Ib);
%% Interpret individual.

m=ind.formal;
m=strrep(m,'S0','y(1)');
m=strrep(m,'S1','y(2)');
K=@(y)(y);
eval(['K=@(y)([0;' m ']);']);
assignin("base","K",K);

%f=@(t,y)(A*y(1:2)+K(y(1:2))+testt(toc,Tevmax));

%% Evaluation
try                       % Encapsulation in try/catch.
    tic
    y=[3e-5;0];
    b=sum(K(y));
    assignin("base","b",b);
    mdl='notLinModel_S';
    load_system(mdl);
    %set_param(mdl,'StopTime','inf');
    set_param(mdl,'SimulationCommand','update');
    set_param(mdl,'SimulationCommand','Start');
    T=0;
    while(T<1)
        set_param(mdl,'SimulationCommand','Pause');
        %set_param(mdl,'SimulationCommand','WriteDataLogs');
        out = evalin('base', 'out');
        T=out.y.time(end);
        y(1)=out.y.data(end,1);
        y(2)=out.y.data(end,2);
        b=sum(K(y));
        set_param(mdl,'SimulationCommand','update');
        set_param(mdl,'SimulationCommand','continue');
    end
    set_param(mdl,'SimulationCommand','Stop');
    if  T(end)==Tf             % Check if Tf is reached.
        b=Y*0+K(Y);           % Computes b.
        Jt=1/Tf*cumtrapz(T,(Y-objective).^2+gamma*b.^2); % Computes J.
        J=Jt(end);
    else
        J=mlc_parameters.badvalue;  % Return high value if Tf is not reached.
    end
catch err
    J=mlc_parameters.badvalue;    % Return high value if ode45 fails.
end

if nargin>3   % If a fourth argument is provided, plot the result
    subplot(3,1,1)
    plot(T,Y,'-k','linewidth',1.2)
    ylabel('$a$','interpreter','latex','fontsize',20)
    subplot(3,1,2)
    plot(T,b,'-k','linewidth',1.2)
    ylabel('$b$','interpreter','latex','fontsize',20)
    subplot(3,1,3)
    plot(T,Jt,'-k','linewidth',1.2)
    ylabel('$(a-a_0)^2+\gamma b^2$','interpreter','latex','fontsize',20)
    xlabel('$t$','interpreter','latex','fontsize',20)
end