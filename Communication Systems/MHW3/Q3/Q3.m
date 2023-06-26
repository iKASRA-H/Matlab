%Q1-3   Kasra Hassani

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
subplot(3,2,1);
plot(x);
title("x Time Domain");
xlabel("t");
ylabel("x(t)");
%-------------------------------------------

%------------------AWGN 20-------------------
snr = 20;
xn1 = awgn(x,snr);
y1 = abs(xn1);

%lowpass filter for time and frequency domain
fs = 1e3;
tp = 0:1/fs:1;
y1p = lowpass(y1,20,fs);

%Saving
audiowrite("SNR20.wav",y1p,Fs);

%Plotting
subplot(3,2,2);
plot(y1p);
title("SNR=20");
xlabel("t");
ylabel("y1'(t)");
%--------------------------------------------

%------------------AWGN 10-------------------
snr = 10;
xn2 = awgn(x,snr);
y2 = abs(xn2);

%lowpass filter for time and frequency domain
fs = 1e3;
tp = 0:1/fs:1;
y2p = lowpass(y2,20,fs);

%Saving
audiowrite("SNR10.wav",y2p,Fs);


%Plotting
subplot(3,2,3);
plot(y2p);
title("SNR=10");
xlabel("t");
ylabel("y2'(t)");
%--------------------------------------------

%-------------------AWGN 5-------------------
snr = 5;
xn3 = awgn(x,snr);
y3 = abs(xn3);

%lowpass filter for time and frequency domain
fs = 1e3;
tp = 0:1/fs:1;
y3p = lowpass(y3,20,fs);

%Saving
audiowrite("SNR5.wav",y3p,Fs);

%Plotting
subplot(3,2,4);
plot(y3p);
title("SNR=5");
xlabel("t");
ylabel("y3'(t)");
%--------------------------------------------

%------------------AWGN 20-------------------
snr = 20;
xn1 = awgn(x,snr);
y1 = abs(xn1);

%lowpass filter for time and frequency domain
fs = 1e3;
tp = 0:1/fs:1;
y1p = lowpass(y1,20,fs);

%Plotting Time
subplot(3,2,5);
plot(y1p);
title("Time");
xlabel("t");
ylabel("y1'(t)");

%Plotting frequency
subplot(3,2,6);
plot(1./y1p);
title("Frequency");
xlabel("f");
ylabel("y1'(f)");

%--------------------------------------------
