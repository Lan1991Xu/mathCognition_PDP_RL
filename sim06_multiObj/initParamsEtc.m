% written by professor Jay McClelland
function [] = initParamsEtc( )
% This program initialize and preallocate the parameters needed for the
% model. This should be executed before the simulations. 
global p d a

%% modeling parameters 
p.wf = .2;          % noise magnitude
p.learner = 1;      % learnign mode flag
p.lrate = .1;       % learning rate
p.runs = 1024;      % training upper lim 
p.gamma = .8;       % discount factor 
p.smirate = .001;   % ???

%% counting specific
% size of the state space and percetual span
p.spRad = 50;
p.spRange = p.spRad * 2 + 1;
% the max unit that the model can move
p.mvRad = 10;       
p.mvRange = p.mvRad * 2 + 1;
% number of items in the environment
p.nItems = 5;
% p.nItems = randi(x);

% initialize with small small random values 
a.wts = randsmall(p.mvRange,101);
a.bias = 1;     % bias toward not moving (action 0)
a.smgain = 1;

%% set up the figure
d.fh = figure();
d.fh.WindowStyle = 'docked';
d.rax = subplot(3,1,1);
d.hax = subplot(3,1,2);
d.wax = subplot(3,1,3);
d.dtimes = 2.^(10:10);
end

