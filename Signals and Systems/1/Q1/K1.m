%Q1 Kasra Hassani 9923107

%----------------------------------------
%clearing and closing everything
clc; clear; close all;
%----------------------------------------

                  %Part A
%----------------------------------------
%setting up variables
A=1;
omega=2;
t=0:0.05:40;
s=(t.^2)/4;
%----------------------------------------
%making the signal
y=A.*cos(omega.*t+s);
%----------------------------------------
%ploting the signal
figure('WindowState','maximized');
subplot(2,2,1);
plot(t,y);
title("Part A: y(t) = 1cos(2t+(t^2)/4)");
xlabel("t");
ylabel("y(t)");
%----------------------------------------

                   %Part B
%----------------------------------------
%setting up variables
A=1;
omega=2;
t=0:0.05:40;
s=(-2).*sin(t);
%----------------------------------------
%making the signal
y=A.*cos(omega.*t+s);
%----------------------------------------
%ploting the signal
subplot(2,2,2);
plot(t,y);
title("Part B: y(t) = 1cos(2t+(-2)sin(t))");
xlabel("t");
ylabel("y(t)");
%----------------------------------------


                %Part C
%----------------------------------------

%Part A Instantaneous Frequency
%----------------------------------------
%setting up variables
A=1;
omega=2;
t=0:0.05:40;
s=(t.^2)/4;
%----------------------------------------
%making the signal
y=A.*cos(omega.*t+s);
%----------------------------------------
%Plotting Instantaneous Frequency A
subplot(2,2,3);
instfreq(y,t)
%----------------------------------------


%Part B Instantaneous Frequency
%----------------------------------------
%setting up variables
A=1;
omega=2;
t=0:0.05:40;
s=(-2).*sin(t);
%----------------------------------------
%making the signal
y=A.*cos(omega.*t+s);
%----------------------------------------
%Plotting Instantaneous Frequency B
subplot(2,2,4);
instfreq(y,t)
%----------------------------------------
