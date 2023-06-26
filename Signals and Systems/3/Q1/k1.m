% KASRA HASSANI   9923107

%clearing and closing everything
clc; clear; close all;
%-------------------------------------

%------Load mtlb with Fs=7418Hz-------
load mtlb
[P,Q] = rat(7418/Fs);

%---------------Part 1----------------
%------Plotting the sound signal------
mtlb_new = resample(mtlb,P,Q);
%soundsc(mtlb_new);     % playing sample sound
figure('WindowState','maximized');
subplot(3,3,1);
plot((0:length(mtlb_new)-1)/(P/Q*Fs),mtlb_new)
title("Part 1: Sound Signal");
%-------------------------------------

%---------------Part 2----------------
y = fft(mtlb_new);         % DTFT of mtlb_new
m = abs(y);                % Magnitude
y(m<1e-6) = 0;
p = unwrap(angle(y));      % Phase
f = (0:length(y)-1)*100/length(y);   % Frequency vector

subplot(3,3,2);
spectrogram(f,m)
title('Part 2: Magnitude')

subplot(3,3,3);
spectrogram(f,p*180/pi)
title('Part 2: Phase')


%------------------------------------

%--------------Part 3----------------
r= rand(4001,1);
mtlb_new=r+mtlb_new;
subplot(3,3,4)
plot((0:length(mtlb_new)-1)/(P/Q*Fs),mtlb_new)
title("Part 3: Sound Signal With Noise");
%------------------------------------

%--------------Part 4----------------
y = fft(mtlb_new);         % Compute DFT of mtlb_new
m = abs(y);                % Magnitude
y(m<1e-6) = 0;
p = unwrap(angle(y));      % Phase
f = (0:length(y)-1)*100/length(y);   % Frequency vector

subplot(3,3,5);
spectrogram(f,m)
title('Part 3: Magnitude')

subplot(3,3,6);
spectrogram(f,p*180/pi)
title('Part 3: Phase')
%-------------------------------------
noise=mtlb_new-mtlb;
subplot(3,3,7)
plot((0:length(noise)-1)/(P/Q*Fs),noise)
title("Part 4: Noise");

y = fft(noise);         % Compute DFT of mtlb_new
m = abs(y);                % Magnitude
y(m<1e-6) = 0;
p = unwrap(angle(y));      % Phase
f = (0:length(y)-1)*100/length(y);   % Frequency vector

subplot(3,3,8);
spectrogram(f,m)
title('Part 4: Magnitude')

subplot(3,3,9);
spectrogram(f,p*180/pi)
title('Part 4: Phase')
