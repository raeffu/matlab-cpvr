%##########################################################################
% File:       HoughCircle.m
% Purpose:    Demo for local operators and image convolution
% Author:     Marcus Hudritsch
% Date:       15-FEB-09
% Copyright:  Marcus Hudritsch, Kirchrain 18, 2572 Sutz
%             THIS SOFTWARE IS PROVIDED FOR EDUCATIONAL PURPOSE ONLY AND
%             WITHOUT ANY WARRANTIES WHETHER EXPRESSED OR IMPLIED.
%##########################################################################
clear all; close all; clc; %clear matrices, close figures & clear cmd wnd.

X = imread('../images/euros.png'); %Load image into matrix X
I = im2double(X);                  %Convert to doubles [0-1]
imshow(I); title('Original');

I = im2double(im2bw(I, 0.9));
figure; imshow(I); title('After im2bw');







