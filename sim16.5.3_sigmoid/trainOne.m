% just testing, a short cut for running the model
function record = trainOne(epoch, seed)
if nargin == 0
    epoch = 100;
    seed = randi(99);
end

%% run the simulation
record = trainAgent(epoch, seed);

%% save the simulation .
saveDirName = getSaveDir();
save([saveDirName '/' 'record'],'record');
save('record','record');

%% eval the performance
quiz();
checkLearning();
print([pwd '/' saveDirName '/' 'learningCurve'],'-dpng')
beep % notice me that the program was ended
end
