

        parameters.size=50;
        parameters.sensors=2;
        parameters.sensor_spec=0;
        parameters.controls=1;
        parameters.sensor_prob=0.33;
        parameters.leaf_prob=0.3;
        parameters.range=150;
        parameters.precision=10;
        parameters.opsetrange=[1:3]; 
        parameters.formal=1;
        parameters.end_character='';
        parameters.individual_type='tree';


        %%  GP algortihm parameters (CHANGE IF YOU KNOW WHAT YOU DO)
        parameters.maxdepth=6;
        parameters.maxdepthfirst=5;
        parameters.mindepth=2;
        parameters.mutmindepth=2;
        parameters.mutmaxdepth=15;
        parameters.mutsubtreemindepth=2;
        parameters.generation_method='mixed_ramped_gauss';
        parameters.gaussigma=3;
        parameters.ramp=[2:8];
        parameters.maxtries=10;
        parameters.mutation_types=1:4;


        %%  Optimization parameters
        parameters.elitism=6;
        parameters.probrep=0.1;
        parameters.probmut=0.4;
        parameters.probcro=0.5;
        parameters.selectionmethod='tournament';
        parameters.tournamentsize=7;
        parameters.lookforduplicates=1;
        parameters.simplify=0;
        parameters.cascade=[1 1];

        %%  Evaluator parameters 
        %parameters.evaluation_method='standalone_function';
        %parameters.evaluation_method='standalone_files';
        parameters.evaluation_method='mfile_standalone';
        parameters.evaluation_function='unidim_DS_evaluator';
        parameters.indfile='ind.dat';
        parameters.Jfile='J.dat';
        parameters.exchangedir=fullfile(pwd,'evaluator0');
        parameters.evaluate_all=0;
        parameters.ev_again_best=0;
        parameters.ev_again_nb=5;
        parameters.ev_again_times=5;
        parameters.artificialnoise=0;
        parameters.execute_before_evaluation='';
        parameters.badvalue=10^36;
        parameters.badvalues_elim='first';
        %parameters.badvalues_elim='none';
        %parameters.badvalues_elim='all';
        parameters.preevaluation=0;
        parameters.preev_function='';
        parameters.problem_variables.gamma=0.01;
        parameters.problem_variables.Tf=1;
        parameters.problem_variables.Tevmax=10;
        parameters.problem_variables.objective=0;
        %% MLC behaviour parameters 
        parameters.save=1;
        parameters.saveincomplete=1;
        parameters.verbose=2;
        parameters.fgen=250; 
        parameters.show_best=1;
        parameters.savedir=fullfile(pwd,'save_GP');










