%example tracking

[file path] = uigetfile('*.avi'); %manually pick file to track;

inVid = VideoReader([path file]);

%%

nframes = inVid.NumberOfFrames;

for i = 1:nframes
   %%
   im = read(inVid,i);
   F = locateCodes(im, 'threshMode', 1, 'bradleyFilterSize', [10 10], 'bradleyThreshold', 1,'vis', 1);
    
end