
fun=@(X) abs(X^2+2*X-3+3*sin(X));
nvars=1;

options = optimoptions('ga','PlotFcn',@gaplotbestf,'ConstraintTolerance',1e-8,'FunctionTolerance',1e-8,...
    'PopulationSize',100,'InitialPopulationRange',[-10;10]);
[x,fval] = ga(fun,nvars,options)
