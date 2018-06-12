%% Load and track single video file

[file path] = uigetfile('*.avi'); %manually pick file to track;

inVid = VideoReader([path file]);

%% Track each frame individually

nframes = inVid.NumberOfFrames;

%for i = 1:nframes
%Alt:
for i = 1:50
    %%
    im = read(inVid,i);
    F = locateCodes(im, 'threshMode', 1, 'bradleyFilterSize', [12  12], 'bradleyThreshold', 0.1,'vis', 1);
    
end

%% track tags across entire video file using parallel processing
%NB there must be a "taglist.csv" file in the same working directory as the
% video file being anayzed (specified above)
cd(path);
ls = dir('*taglist.csv');
taglist = csvread(ls(1).name);
trackingData = trackBEEtagVideoP(inVid, [12 12], 0.5, taglist); %Play around with these parameters to assess tracking performance

%% Get some useful summary, for all tagged bees (draws on full taglist)
isTracked = ~isnan(trackingData(:,:,1));
figure(1);
imagesc(isTracked); colorbar;

percentageTracked = mean(mean(isTracked))

figure(2);
im = read(inVid, 1);
imshow(im);
hold on
plot(trackingData(:,:,1), trackingData(:,:,2), '-o');
plot(trackingData(:,:,3), trackingData(:,:,4), 'ro');
hold off


format shortG
indTP = mean(isTracked);
[taglist'; indTP]
format short

%% Get summary data for a select subset of tagged workers
[targetList path] = uigetfile('*.csv', 'specify interesting taglist');
targetList = csvread([path targetList]);
sublist = ismember(taglist, targetList);
subtags = taglist(sublist); %subset original taglist based on which members are in targetList

trackingDataTarget = trackingData(:,sublist,:);
isTrackedTarget = isTracked(:,sublist);
figure(1);
imagesc(isTrackedTarget); colorbar;
percentageTrackedTarget = mean(mean(isTrackedTarget))

figure(2);
im = read(inVid, 1);
imshow(im);
hold on
plot(trackingDataTarget(:,:,1), trackingDataTarget(:,:,2), '-o');
plot(trackingDataTarget(:,:,3), trackingDataTarget(:,:,4), 'ro');
hold off


format shortG
indTP = mean(isTrackedTarget);
[subtags'; indTP]
format short




