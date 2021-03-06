%##########################################################################
% File:       Fourier2DDeNoise.m
% Purpose:    Adding structural noise to the Lena image
% Author:     Marcus Hudritsch
% Date:       15-FEB-09
% Copyright:  Marcus Hudritsch, Kirchrain 18, 2572 Sutz
%             THIS SOFTWARE IS PROVIDED FOR EDUCATIONAL PURPOSE ONLY AND
%             WITHOUT ANY WARRANTIES WHETHER EXPRESSED OR IMPLIED.
%##########################################################################
clear all; close all; clc; %clear matrices, close figures & clear cmd wnd.

X = imread('../images/Lena128.png');    %Load image into matrix X
I = im2double(X);                       %Convert to doubles [0-1]
s = size(I,1);                          %Get the size if I

subplot(1,2,1), imshow(I);
pause;

%Create noise image with a sine wave
Noise = zeros(s);
for v=1:s
   for u=1:s
      Noise(v,u) = 0.2 * sin(2*pi/s*(16*u + 24*v));
   end
end

subplot(1,2,1), imshow(Noise);
pause;

I2 = I + Noise;
subplot(1,2,1), imshow(I2);
imwrite(I2,'../images/LenaWithNoise.png','png')
