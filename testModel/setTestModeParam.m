function [] = setTestModeParam()
%SETTESTMODEPARAM Summary of this function goes here
%   Detailed explanation goes here
global a p;
% change parameters
a.smgain = 100;         
p.teacherForcingOn = false;   % stop teaching
p.teachingModeOn = false;
p.lrate = 0;            % stop learning 

p.experienceReply = false; 
end

