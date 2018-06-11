%% Useful commands
imaqtool; %Will bring up a useful GUI to look at your options for cameras
%Pro tip: use FlyCap2 to figure out camera setting that work well, record
%them, and input them using imaqtool function. Then save the output code
%from that, and use it to always set up your cameras in the same way!

%ctrl+c - quite command line

%% Camera scratchpad
vid = videoinput('pointgrey', 1, 'F7_Mono16_4240x2824_Mode0');
src = getselectedsource(vid);

%% Establish camera settings
vid.FramesPerTrigger = 1;

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

preview(vid);

%%  






