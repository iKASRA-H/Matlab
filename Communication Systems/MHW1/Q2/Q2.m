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

%-----------plotting in time domain---------
figure(1);
subplot(2,1,1);
plot(y)
%-------------------------------------------
%------------positioning figure 1-----------
pos1 = get(gcf,'Position'); % get position of Figure(1) 
set(gcf,'Position', pos1 - [pos1(3)/2,0,0,0]) % Shift position of Figure(1) 
%-------------------------------------------

%--------plotting in frequency domain-------
subplot(2,1,2);
plot(1./y)
%-------------------------------------------

%-------------------------------------------
%lowpass filter for time and frequency domain
figure(2);
fs = 1e3;
t = 0:1/fs:1;
lowpass(y,50,fs);
%-------------------------------------------

%---positioning figures 1, 2 side by side---
set(gcf,'Position', get(gcf,'Position') + [0,0,150,0]); % When Figure(2) is not the same size as Figure(1)
pos2 = get(gcf,'Position');  % get position of Figure(2) 
set(gcf,'Position', pos2 + [pos1(3)/2,0,0,0]) % Shift position of Figure(2)
%-------------------------------------------
%-------Saving low pass filtered sound------
yn=lowpass(y,50,fs);
audiowrite("LPO.m4a",yn,Fs);
%-------------------------------------------
