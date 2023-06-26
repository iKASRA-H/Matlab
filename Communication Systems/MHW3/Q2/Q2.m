%Q1-2   Kasra Hassani

%-------------------------------------------
%clearing and closing everythig from before
clc; clear; close all;
%-------------------------------------------

%-----------Reading the audio file----------
load handel.mat
filename = 'Old_Mc.Donald.wav';
[m,Fs] = audioread(filename);
%-------------------------------------------

%---------------Creating X(t)---------------
len     = size(m, 1);
t       = (0:len - 1) / Fs;  % time in seconds
fc = 20000;
signal  = cos(2*pi*fc*t);
Ac = 1;
u = 0.7;
x  = Ac .* (1 + m.*u) .* signal.';
%-------------------------------------------

%----------------Plotting X(t)--------------
figure();
subplot(2,2,1);
plot(x);
title("x Time Domain");
xlabel("t");
ylabel("x(t)");
%-------------------------------------------

%-------------Plotting AWGN 10--------------
snr = 10;
xn1 = awgn(x,snr);
subplot(2,2,2);
plot(xn1);
title("SNR = 10");
xlabel("t");
ylabel("xn1(t)");
%--------------------------------------------

%-------------Plotting AWGN 20--------------
snr = 20;
xn2 = awgn(x,snr);
subplot(2,2,3);
plot(xn2);
title("SNR = 20");
xlabel("t");
ylabel("xn2(t)");
%--------------------------------------------

%-------------Plotting AWGN 30--------------
snr = 30;
xn3 = awgn(x,snr);
subplot(2,2,4);
plot(xn3);
title("SNR = 30");
xlabel("t");
ylabel("xn3(t)");
%--------------------------------------------
