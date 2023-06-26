% KASRA HASSANI   9923107

%clearing and closing everything
clc; clear; close all;
%-------------------------------------

%----------------Part 1---------------
%setting up signal variables
f=50;
omega=2*pi*f;
t=0:0.001:0.1;

%making the signal
y=sin(omega*t);

%plotting the signal
figure('WindowState','maximized');
subplot(2,2,1);
plot(t,y);
title("Part 2: Sampling with 200Hz");
xlabel("t");
ylabel("y(t)");
hold on;
%-------------------------------------

%----------------Part 2---------------
SR1=200; %sampling rate
dt1=1/SR1;  %sampling interval
t1=0:dt1:0.1;
omega=2*pi*f;
y1=sin(omega*t1);
plot(t1,y1,'ko')
%-------------------------------------

%----------------Part 3---------------
px1 = pwelch(y1);
subplot(2,2,2);
pwelch(y1)
%-------------------------------------

%----------------Part 4---------------
%setting up signal variables
f=50;
omega=2*pi*f;
t=0:0.001:0.1;

%making the signal
y=sin(omega*t);

%plotting the signal
subplot(2,2,3);
plot(t,y);
title("Part 4: Sampling with 40Hz");
xlabel("t");
ylabel("y(t)");
hold on;

%sampling
SR2=40; %sampling rate
dt2=1/SR2;  %sampling interval
t2=0:dt2:0.1;
omega=2*pi*f;
y2=sin(omega*t2);
plot(t2,y2,'ko')
%-------------------------------------

%----------------Part 5---------------
%entering zeros between our samples
l=length(y2);
y2_cpy=zeros(1,2*l-1);

for i=1:l
    y2_cpy(1,(2*i)-1)= y2(1,i);
end

%showing power of signal
px2 = pwelch(y2_cpy);
subplot(2,2,4);
pwelch(y2_cpy)
%--------------------------------------




