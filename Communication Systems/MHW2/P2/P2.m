%Q2 Kasra Hassani 9923107

%-------------------------------------------
%clearing and closing everythig from before
clc; clear; close all;
%-------------------------------------------

%-----------Reading the audio file----------
load handel.mat
filename = 'Recording.mp3';
[y,Fs] = audioread(filename);
%-------------------------------------------

%---------------FM Modulation---------------
Fc=Fs/2;
Beta=2;
freqdev=Beta*Fs;    %Beta=freqdev/fs
fm = fmmod(y,Fc,Fs,freqdev);
%-------------------------------------------

%--------------Plotting Time----------------
% Orginal
figure('WindowState','maximized');
subplot(2,4,1);
plot(y);
title("ORG Time");
xlabel("t");
ylabel("y(t)");
%-------------------------------------------
% FM Modulation
subplot(2,4,3);
plot(fm);
title("FM Time");
xlabel("t");
ylabel("fm(t)");
%-------------------------------------------

%---------------Plotting Freq---------------
% Orginal
subplot(2,4,2);
plot(1./y);
title("ORG Frequency");
xlabel("f");
ylabel("y(f)");
%--------------------------------------------
% FM Modulation
subplot(2,4,4);
plot(1./fm);
title("FM Frequency");
xlabel("f");
ylabel("fm(f)");
%-------------------------------------------

%---------------Saving FM Mod---------------
audiowrite("FM.m4a",fm,Fs);
%-------------------------------------------

%--------------Demodulation FM--------------
defm = fmdemod(fm,Fc,Fs,freqdev);
%-------------------------------------------

%------------Time Demodulation-------------
% FM Demodulation
subplot(2,4,6);
plot(defm);
title("DeFM Time");
xlabel("t");
ylabel("defm(t)");
%-------------------------------------------

%---------------Plotting Freq---------------
% FM Demodulation
subplot(2,4,7);
plot(1./defm);
title("DeFM Frequency");
xlabel("f");
ylabel("defm(f)");
%-------------------------------------------

%--------------Saving FM Demod--------------
audiowrite("DeMod.m4a",defm,Fs);
%-------------------------------------------
