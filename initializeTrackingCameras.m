function vid = initializeTrackingCameras()
%%
vid = videoinput('pointgrey', 1, 'F7_Mono8_4240x2824_Mode0');%Don't change this line
src = getselectedsource(vid);

vid.FramesPerTrigger = 1; %Don't change this line
triggerconfig(vid, 'manual'); %Don;t change this line


%Stuff below here you can change - things that affect image quality
src.ExposureMode = 'Manual';

src.FrameRateMode = 'Manual';
src.ExposureMode = 'Manual';
src.Exposure = 1;
src.GainMode = 'Manual';

src.Gain = 5;
src.Sharpness = 1215;
src.SharpnessMode = 'Manual';
src.ShutterMode = 'Manual';
src.Shutter = 10;
