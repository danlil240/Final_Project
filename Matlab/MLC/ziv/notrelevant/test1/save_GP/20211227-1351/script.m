% G:\MY DRIVE\ZIV\SCE\PROJECT PROPOSALS\OCTOBER 2021\פיתוח אלגוריתם בקרה מבוסס מכונה לומדת לדיכוי רעידות במערכת דרגת חופש אחת\MATLAB\MLC\ZIV\NEW FOLDER\SAVE_GP\20211227-1351\SCRIPT parameters scropt for MLC
% Type mlc=MLC('G:\My Drive\ziv\SCE\Project proposals\October 2021\פיתוח אלגוריתם בקרה מבוסס מכונה לומדת לדיכוי רעידות במערכת דרגת חופש אחת\Matlab\MLC\ziv\New Folder\save_GP\20211227-1351\script') to create corresponding MLC object
parameters.size = 1000;
parameters.sensors = 2;
parameters.sensor_spec = 0;
parameters.sensor_list = 0;
parameters.controls = 1;
parameters.sensor_prob = 0.2;
parameters.leaf_prob = 0.3;
parameters.range = 6000;
parameters.precision = 4;
parameters.opsetrange = [1 3];
parameters.formal = 0;
parameters.end_character = '';
parameters.maxdepth = 15;
parameters.maxdepthfirst = 8;
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
parameters.simplify = 1;
parameters.evaluation_method = 'multithread_function';
parameters.evaluation_function = 'evaluator_linZ5';
parameters.indfile = 'ind.dat';
parameters.Jfile = 'J.dat';
parameters.exchangedir = 'G:\My Drive\ziv\SCE\Project proposals\October 2021\פיתוח אלגוריתם בקרה מבוסס מכונה לומדת לדיכוי רעידות במערכת דרגת חופש אחת\Matlab\MLC\ziv\New Folder\evaluator0';
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
parameters.problem_variables = 1;
parameters.savedir = 'G:\My Drive\ziv\SCE\Project proposals\October 2021\פיתוח אלגוריתם בקרה מבוסס מכונה לומדת לדיכוי רעידות במערכת דרגת חופש אחת\Matlab\MLC\ziv\New Folder\save_GP\20211227-1351';
