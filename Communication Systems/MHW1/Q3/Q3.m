%Q3 Kasra Hassani 9923107

%-------------------------------------------
%clearing and closing everythig from before
clc; clear; close all;
%-------------------------------------------

RectConv(5,2,1);    % Calling Function for n=2 and T=5
RectConv(5,4,2);    % Calling Function for n=4 and T=5
RectConv(5,8,3);    % Calling Function for n=8 and T=5

function y = RectConv(T,n,p)
    t = -T:1:T;
    x = double(abs(t) < T);   % Convert logical to double
    y = conv(x,x,'same');     % Convolving two x(rectangular pulse)
    for i = 2:1:n
        y = conv(y,x,'same');       % Convolving n times
    end
    %----------Plotting them------------
    subplot(2,2,p);
    plot(y);
    %-----------------------------------
    %-----Naming Title of each one------
    if p==1
        title("n = 2");
    elseif p==2
        title("n = 4")
    else
        title("n = 8");
    end
    %-----------------------------------
    xlabel("t");
    ylabel("y");
end
