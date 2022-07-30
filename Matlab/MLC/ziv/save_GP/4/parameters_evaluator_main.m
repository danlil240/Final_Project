%MLC_EX_LQR_PROBLEM parameters scropt for MLC
%Type mlc=MLC('parameters_evaluator_main') to create corresponding MLC object
% mlc.go(n)   mlc.go(50,1)
% mlc.show_best
% mlc.show_ind(n2);  man(n2) = mlc.table.number;
% readmylisp_to_formal_MLC('(* (* 2.718 (* 2.718 (* S1 -0.9538))) (* (cos (sin (* 2.718 (* S1 -0.9538)))) (cos (* 2.718 (* S0 -1.093e+04)))))')
% syms S0 S1
% expand    simplify
parameters.size = 1000;
parameters.sensors = 2;
parameters.sensor_spec = 0;
parameters.sensor_list = 0;
parameters.controls = 1;
parameters.sensor_prob = 0.2;
parameters.leaf_prob = 0.3;
parameters.range = 6000;%10000;
parameters.precision = 4;
parameters.opsetrange = [1 3];%[1 2 3];
parameters.formal = 0;
parameters.end_character = '';
parameters.maxdepth = 15;%15;
parameters.maxdepthfirst = 8;%8;
parameters.mindepth = 2;
parameters.mutmaxdepth = 15;
parameters.mutmindepth = 2;
parameters.mutsubtreemindepth = 2;
parameters.generation_method = 'mixed_ramped_gauss';
parameters.gaussigma = 3;
parameters.ramp = [2 3 4];
parameters.maxtries = 10;
parameters.mutation_types = [1 2 3 4];
parameters.elitism = 10;
parameters.probrep = 0.1;
parameters.probmut = 0.4;
parameters.probcro = 0.5;
parameters.selectionmethod = 'tournament';
parameters.tournamentsize = 7;
parameters.lookforduplicates = 1;
parameters.simplify = 1;%0;
parameters.evaluation_method = 'multithread_function';
parameters.evaluation_function='evaluator_fun';
parameters.indfile='ind.dat';
parameters.Jfile='J.dat';
parameters.exchangedir=fullfile(pwd,'evaluator0');
parameters.evaluate_all = 0;
parameters.ev_again_best = 0;
parameters.ev_again_nb = 5;
parameters.ev_again_times = 5;
parameters.artificialnoise = 0;
parameters.execute_before_evaluation = '';
parameters.badvalue = 1e+36;
parameters.badvalues_elim = 'first';
parameters.preevaluation = 0;
parameters.preev_function = '';
parameters.save = 1;
parameters.saveincomplete = 1;
parameters.verbose = 3;
parameters.fgen = 250;
parameters.show_best = 1;
parameters.problem_variables.Tf=0.4;
parameters.problem_variables.Tevmax=15;
parameters.problem_variables.R=0.001;%0.001;
parameters.problem_variables.Q=diag([22000 0.1]);%Q=diag([1000 0.5]);%Q=diag([22000 0.1]);
parameters.problem_variables.dt=0.001;%0.001;%0.001;
parameters.problem_variables.Tevmax=10;
parameters.problem_variables.x0=[5e-5;0];
% MLC behaviour parameters

parameters.savedir=fullfile(pwd,'save_GP');
