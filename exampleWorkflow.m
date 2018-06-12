%% example workflow


% start up video
vid = initializeTrackingCameras; %Edit this file to change parameters
%%
start(vid);
% Navigate to appropriate folder
cd(uigetdir(pwd, 'Navigate to folder for video output'));

% Collect video
%times = collectVideoTrial(vid, 0.5); %

%%
trialLength = 1; %Trial length, in minutes

trialInterval = 5; %Time between trials in minutes

tic; %Start matlab timer

while 1 %infinite loop
    
    if mod(toc,trialInterval*60) < 2 %Are
        times = collectVideoTrial(vid, trialLength);
        plot(times);
        drawnow;
    end
    
end


