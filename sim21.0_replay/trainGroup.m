function [] = trainGroup(nSubj, epoch)
% Run N models, to establish sample size
global p;
dataSaveDirName = 'groupData';
projDir = fullfile(pwd, dataSaveDirName);
simName = 'combinedMode';
param.saveDir = fullfile(projDir, simName);

%% set the parameter that you want to vary
if nargin == 0
    epoch = 500;
    nSubj = 20;
end

param.runningCondition = 'fix teaching mode, varying replay buffer parameter';
% param.val = [1 2 3 4];
% param.val = [1 2 16];
param.val = 0
for i = 1 : length(param)
%     p.teachingStyle = param.val(i); % varying parameter
%     p.replay_batchSize = param.val(i);
    
    %% create a new directory to save the results
    dirName = createDir(param.saveDir, dataSaveDirName);
    
    %% run the group analysis
    for n = 1:nSubj
        record = trainAgent(epoch, n);
        filename = sprintf('record%.2d', n);
        save([dirName '/'  filename],'record');
    end
        
end


%% write a parameter file 
filename = fullfile(param.saveDir,'paramRecord.txt');
fileID = fopen(filename,'w');
writeParam(fileID, param)
fclose(fileID);

beep
end

