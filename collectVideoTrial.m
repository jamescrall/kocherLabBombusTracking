function [times] = collectVideoTrial(vid, trialLength)

%Inputs:
%   vid: VideoReader object for point grey camera
%
%   trialLength: trial time (in minutes)


%% Set up trial metadata
t = now;
dateVid = datestr(t, 'dd-mmm-yyyy_HH-MM-SS');
outVid = VideoWriter(strcat(dateVid, '.avi'));
open(outVid);
times = []; %Start empty matrix to record frame times

% Define trial length
trialTime = trialLength*60; %convert to seconds

%Start camera
%start(vid);

%begin timer for trial
tic; 

while toc < trialTime
    
    im = peekdata(vid, 1); %Collect single frames
   writeVideo(outVid, im); %Write that frame to memory
   times = [times now]; %collect timestamp
   flushdata(vid); %clear out camera's memory
   
end

close(outVid); %close output video
%stop(vid);