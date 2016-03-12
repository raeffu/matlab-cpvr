%##########################################################################
% File:       LokaleOperationen.m
% Purpose:    Demo for local operators and image convolution
% Author:     Marcus Hudritsch
% Date:       15-FEB-09
% Copyright:  Marcus Hudritsch, Kirchrain 18, 2572 Sutz
%             THIS SOFTWARE IS PROVIDED FOR EDUCATIONAL PURPOSE ONLY AND
%             WITHOUT ANY WARRANTIES WHETHER EXPRESSED OR IMPLIED.
%##########################################################################
clear all; close all; clc; %clear matrices, close figures & clear cmd wnd.

X = imread('../images/Blood2.bmp'); %Load image into matrix X 
I = im2single(X);                   %Convert to single floats [0-1]
imshow(I); title('Original');       %Show image
pause;
 
Imin = min(I(:));                   %Calculate min of matrix I
Imax = max(I(:));                   %Calculate max of matrix I

I2 = imadjust(I,[Imin Imax],[0 1]);
imshow(I2); title('After contrast spread');
pause;

I3 = imnoise(I2,'salt & pepper',0.1);
imshow(I3); title('With salt & pepper');
pause;

I4 = medfilt2(I3); 
imshow(I4); title('After median filter');
pause;

h = [1 1 1 1 1; 
     1 1 1 1 1; 
     1 1 1 1 1;
     1 1 1 1 1;
     1 1 1 1 1] / 25;
h

I4 = conv2(I3,h); 
imshow(I4); title('After average box filter');
pause;

imshow(I2); title('Original');
pause;
h = [1  4  6  4 1; 
     4 16 24 16 4; 
     6 24 32 24 4;
     4 16 24 16 4;
     1  4  6  4 1] / 256;
h
I3 = conv2(I2,h); 
imshow(I3); title('After gaussian filter');
pause;

imshow(I2); title('Original');
pause;
h = fspecial ('log');
h
I3 = conv2(I2,h);  
imshow (I3); title('After LoG-Filter');

%%%%%%%%%%%%%%%%%%
% Exercise Sobel %
%%%%%%%%%%%%%%%%%%

imshow(I2); title('Original');
pause;

% Step 1: Create horizontal Sobel filter matrix hx

% Step 2: Convolve image I2 with hx and show the result

% Step 3: Create vertical Sobel filter matrix hy by transposing the horizontal one

% Step 4: Convolve image I2 with hy and show the result

% Step 5: Combine the the horizontal & vertical sobel to one image and show it
