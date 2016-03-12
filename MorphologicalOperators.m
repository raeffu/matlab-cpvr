%##########################################################################
% File:       MorphologicalOperators.m
% Purpose:    Demo for morphological operators
% Author:     Marcus Hudritsch
% Date:       3-MAY-13
% Copyright:  Marcus Hudritsch, Kirchrain 18, 2572 Sutz
%             THIS SOFTWARE IS PROVIDED FOR EDUCATIONAL PURPOSE ONLY AND
%             WITHOUT ANY WARRANTIES WHETHER EXPRESSED OR IMPLIED.
%##########################################################################
clear all; close all; clc; %clear matrices, close figures & clear cmd wnd.

I = imread('../images/circuit.png');    % Load image into matrix X 
J = imcomplement(I);                    % Invert image
BW1 = im2bw(J,0.8);                     % make black & white
SE1 = strel('rectangle',[30 20]);       % 40x30 rectangulare SE
BW2 = imerode(BW1,SE1);                 % erode w. 40x30 rectangular SE
BW3 = imdilate(BW2,SE1);                % dilate w. the same SE

imshow(I); title('Original');           % Show images
figure; imshow(BW2); title('After erosion');
figure; imshow(BW1); title('After binarisation');
figure; imshow(BW3); title('After dilation');

 