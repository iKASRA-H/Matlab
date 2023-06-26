%Q1-1   Kasra Hassani

%-------------------------------------------
%clearing and closing everythig from before
clc; clear; close all;
%-------------------------------------------

%-----------Reading the audio file----------
load handel.mat
filename = 'Old_Mc.Donald.wav';
[m,Fs] = audioread(filename);
%-------------------------------------------

%-----------plotting in time domain---------
figure();
subplot(2,2,1);
plot(m);
title("m Time Domain");
xlabel("t");
ylabel("m(t)");
%-------------------------------------------

%--------plotting in frequency domain-------
subplot(2,2,2);
plot(1./m);
title("m Frequency Domain");
xlabel("f");
ylabel("m(f)");
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
subplot(2,2,3);
plot(x);
title("x Time Domain");
xlabel("t");
ylabel("x(t)");
%-------------------------------------------

%----------------Plotting X(f)--------------
subplot(2,2,4);
plot(1./x);
title("x Frequency Domain");
xlabel("f");
ylabel("x(f)");
%-------------------------------------------
