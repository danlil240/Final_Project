
%sim1=sim("try1.slx");
mdl='try1';
load_system(mdl);
set_param(mdl,'StopTime','inf');
set_param(mdl,'SimulationCommand','Start');
%set_param(mdl,'SimulationCommand','WriteDataLogs');
set_param('try1/K','value','2');
a=0;
while(a<5)
    set_param(mdl,'SimulationCommand','Pause');
    set_param(mdl,'SimulationCommand','update');
%set_param(mdl,'SimulationCommand','WriteDataLogs');
   a=out.logsout{1}.Values.Time

   set_param(mdl,'SimulationCommand','continue');
end
set_param(mdl,'SimulationCommand','Stop');

