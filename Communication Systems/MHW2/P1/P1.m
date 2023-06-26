%Q1 Kasra Hassani 9923107

%-------------------------------------------
%clearing and closing everythig from before
clc; clear; close all;
%-------------------------------------------

%-----------------Test 1----------------
%-------------AM modulation-------------
% modulating signal
fc = 250;

% Fs >= 2(Fc+2BW)   |
%                   |
% BW = w = 100      |
w = 100;
BW = w;

% Sampling Frequency
fs = 2*(fc+2*BW);
t = 0 : 1/fs : 0.4;
%-------------------

% Input Signal
A = 1.2;
m = sinc(100*t);
%-------------------

% carrier signal
ini_phase = 0;  % USSB
y = A*ssbmod(m,fc,fs,ini_phase,'upper');
%-------------------

%-------------Ploting-------------
figure('WindowState','maximized');
subplot(2,3,1);
plot(t,y);
title("Upper SSB(USSB)");
xlabel("t");
ylabel("y(t)");
%---------------------------------------

%-----------------Test 2----------------
%-------------FM Modulation-------------
fc=25;
fs=2*fc;    %fs>=2fc
t = 0: 1/fs : 1;
m = 3*cos(50*pi*t);
A=1;
Beta=3;
freqdev=Beta*fs;    %Beta=freqdev/fs
y = A*fmmod(m,fc,fs,freqdev);

%----------------Plotting---------------
subplot(2,3,2);
plot(t,y);
title("FM");
xlabel("t");
ylabel("y(t)");
%---------------------------------------

%----------------Test 3-----------------
%-------------PM Modulation-------------
fc=25;
Beta=5;
phi=pi/4;
fm=Beta/phi;
fs = 2*(fc+4*fm);
t=0:1/fs:1;
m=3*cos(50*pi*t);
y=pmmod(m,fc,fs,phi);
%----------------Plotting---------------
subplot(2,3,3);
plot(t,y);
title("PM B=5");
xlabel("t");
ylabel("y(t)");
%---------------------------------------

%---------------Test 4------------------
%-------------PM Modulation-------------
fc=25;
Beta=2;
phi=pi/4;
fm=Beta/phi;
fs = 2*(fc+4*fm);
t=0:1/fs:1;
m=3*cos(50*pi*t);
y=pmmod(m,fc,fs,phi);
%----------------Plotting---------------
subplot(2,3,6);
plot(t,y);
title("PM B=2");
xlabel("t");
ylabel("y(t)");
%---------------------------------------

%----------------Test 5-----------------
%--------------FM Modulation------------
fc=250;
fs=2*fc;    %fs>=2fc
t = 0: 1/fs : 1;
m = sinc(100*t);
A=1.2;
Beta=4;
freqdev=Beta*fs;    %Beta=freqdev/fs
y = A*fmmod(m,fc,fs,freqdev);

%----------------Plotting---------------
subplot(2,3,4);
plot(t,y);
title("FM B=4");
xlabel("t");
ylabel("y(t)");
%---------------------------------------
