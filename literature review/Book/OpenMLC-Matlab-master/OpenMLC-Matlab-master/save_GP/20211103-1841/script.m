% G:\.SHORTCUT-TARGETS-BY-ID\1_RIG9VP-7WNP5WJDBS9BW8YF09Y8UCIT\פיתוח אלגוריתם בקרה מבוסס מכונה לומדת לדיכוי רעידות במערכת דרגת חופש אחת\LITERATURE REVIEW\BOOK\OPENMLC-MATLAB-MASTER\OPENMLC-MATLAB-MASTER\SAVE_GP\20211103-1841\SCRIPT parameters scropt for MLC
% Type mlc=MLC('G:\.shortcut-targets-by-id\1_riG9vp-7WNp5wjdBS9bw8yf09Y8ucIT\פיתוח אלגוריתם בקרה מבוסס מכונה לומדת לדיכוי רעידות במערכת דרגת חופש אחת\literature review\Book\OpenMLC-Matlab-master\OpenMLC-Matlab-master\save_GP\20211103-1841\script') to create corresponding MLC object
parameters.size = 100;
parameters.sensors = 2;
parameters.sensor_spec = 0;
parameters.sensor_list = 0;
parameters.controls = 1;
parameters.sensor_prob = 0.2;
parameters.leaf_prob = 0.3;
parameters.range = 150;
parameters.precision = 8;
parameters.opsetrange = [1 2 3];
parameters.formal = 0;
parameters.end_character = '';
parameters.maxdepth = 9;
parameters.maxdepthfirst = 6;
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
parameters.simplify = 0;
parameters.evaluation_method = 'multithread_function';
parameters.evaluation_function = 'MLC_evaluator_LQR_daniel';
parameters.indfile = 'ind.dat';
parameters.Jfile = 'J.dat';
parameters.exchangedir = '/media/homes/thomas/00_Git_repos/OpenMLC-Matlab/evaluator0';
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
parameters.savedir = 'G:\.shortcut-targets-by-id\1_riG9vp-7WNp5wjdBS9bw8yf09Y8ucIT\פיתוח אלגוריתם בקרה מבוסס מכונה לומדת לדיכוי רעידות במערכת דרגת חופש אחת\literature review\Book\OpenMLC-Matlab-master\OpenMLC-Matlab-master\save_GP\20211103-1841';
