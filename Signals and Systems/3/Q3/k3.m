% KASRA HASSANI   9923107

%clearing and closing everything
clc; clear; close all;
%-------------------------------------

%-----------Original Image------------
I = imread('Image.jpg');    % Reading image

figure('WindowState','maximized');
subplot(2,4,1)
imshow(I)
title("Original Image");
%-------------------------------------

%-----------Image With Noise----------
mean=0;    %mean
var_gauss=0.04;    %var gauss
J = imnoise(I,'gaussian',mean,var_gauss);

subplot(2,4,2)
imshow(J)
title("Image With Noise");
%-------------------------------------

%-------------MeanFilt 3x3-------------
J = meanfilt(I,3);
subplot(2,4,3)
imshow(J)
title("Image With MeanFilt[3 3]");
%-------------------------------------

%------------MeanFilt 5x5-------------
J = meanfilt(I,5);
subplot(2,4,4)
imshow(J)
title("Image With MeanFilt[5 5]");
%-------------------------------------

%-----------Salt and Pepper-----------
J = imnoise(I,'salt & pepper',0.1);
subplot(2,4,5)
imshow(J)
title("Salt and Pepper 10%");
%-------------------------------------

%-------MeanFilt Salt and Pepper------
output=meanfilt(J,3);
subplot(2,4,6)
imshow(output)
title("MeanFilt Salt and Pepper");
%-------------------------------------

%-------MedFilt Salt and Pepper-------
J = imnoise(I,'salt & pepper',0.1);
output=medianfilt(J,3,3);
subplot(2,4,7)
imshow(output)
title("MedFilt Salt and Pepper");
%-------------------------------------


%-----------MeanFilt Function----------
function output = meanfilt(I, x)
    H = fspecial('average', [x x]);
    output = imfilter(I,H);
end

%-----------MedFilt Function----------
function output = medianfilt(I,x,y)
   if ~rem(x,2)==0 && ~rem(y,2)==0
    for c = 1 : 3
        output(:, :, c) = medfilt2(I(:, :, c), [x, y]);
    end
   else
       disp("Input numbers for Median Filter should be odd")
   end
end 
%--------------------------------------

