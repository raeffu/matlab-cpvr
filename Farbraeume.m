%##########################################################################
%# File:       Farbraeume.m
%# Author:     Marcus Hudritsch
%# Date:       15-FEB-09
%# Copyright:  Marcus Hudritsch, Kirchrain 18, 2572 Sutz
%#             THIS SOFTWARE IS PROVIDED FOR EDUCATIONAL PURPOSE ONLY AND
%#             WITHOUT ANY WARRANTIES WHETHER EXPRESSED OR IMPLIED.
%##########################################################################
clear all; close all; clc; %clear matrices, close figures & clear cmd wnd.
RGB = imread('../Images/peppers.png'); %Load color image into 3d-mat. one for R,G & B

%create 3 colormaps for R, G & B
rMap = gray(256);                           %create rMap from graymap
for i=1:256, rMap(i,2)=0; rMap(i,3)=0; end; %set g & b column to 0
gMap = gray(256);                           %create gMap from graymap
for i=1:256, gMap(i,1)=0; gMap(i,3)=0; end; %set r & b column to 0
bMap = gray(256);                           %create bMap from graymap
for i=1:256, bMap(i,1)=0; bMap(i,2)=0; end; %set r & g column to 0
    
sprintf('\n\nRed channel …');
figure(1); imshow(RGB);	
sprintf('\n\nRed channel …');
figure; imshow(RGB(:,:,1), rMap);
sprintf('\n\nGreen channel …');
figure; imshow(RGB(:,:,2), gMap); 
sprintf('\n\nBlue channel …');
figure; imshow(RGB(:,:,3), bMap);
