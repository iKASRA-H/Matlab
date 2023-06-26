%Q1 Kasra Hassani 9923107

%-------------------------------------------
%clearing and closing everythig from before
clc; clear; close all;
%-------------------------------------------

%-----------------x1[n] = 1-----------------
%setting up variables of x1[n]
n1 = -5 : 0.01 : 5 ;
x1 = n1./n1;
%-------------------------------------------
%plotting the x1[n]
figure('WindowState','maximized');
subplot(3,3,1);
stem(n1,x1);
title("x1[n] = 1");
xlabel("n1");
ylabel("x1[n]");
%-------------------------------------------

%--------------x2[n] = sin(5n)--------------
%setting up variables of x2[n]
n2 = -5 : 0.01 : 5 ;
omega = 5;
x2 = sin(omega.*n2);
%-------------------------------------------
%plotting the x2[n]
subplot(3,3,2);
stem(n2,x2);
title("x2[n] = sin(5n)");
xlabel("n2");
ylabel("x2[n]");
%-------------------------------------------

%--------------x3[n] = sin(3n)--------------
%setting up variables of x3[n]
n3 = -5 : 0.01 : 5 ;
omega = 3;
x3 = sin(omega.*n3);
%-------------------------------------------
%plotting the x3[n]
subplot(3,3,3);
stem(n3,x3);
title("x3[n] = sin(3n)");
xlabel("n3");
ylabel("x3[n]");
%-------------------------------------------

%----------------fft(x1[n])-----------------
y1 = fft(x1);
subplot(3,3,4);
stem(n1,real(y1));
stem(n1,imag(y1));
title("y1[n] = fft(1)");
xlabel("f1");
ylabel("y1[n]");
%--------------------------------------------


%----------------fft(x2[n])-----------------
y2 = fft(x2);
subplot(3,3,5);
stem(n2,real(y2));
stem(n2,imag(y2));
title("y2[n] = fft(sin(5n))");
xlabel("f2");
ylabel("y2[n]");
%--------------------------------------------

%----------------fft(x3[n])------------------
y3 = fft(x3);
subplot(3,3,6);
stem(n3,real(y3));
stem(n3,imag(y3));
title("y3[n] = fft(sin(3n))");
xlabel("f3");
ylabel("y3[n]");
%--------------------------------------------
