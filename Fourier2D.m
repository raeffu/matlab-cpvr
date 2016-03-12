%##########################################################################
% File:       Fourier2D.m
% Purpose:    Demo skript for discrete 2D fourier transform
% Author:     Marcus Hudritsch
% Date:       15-FEB-09
% Copyright:  Marcus Hudritsch, Kirchrain 18, 2572 Sutz
%             THIS SOFTWARE IS PROVIDED FOR EDUCATIONAL PURPOSE ONLY AND
%             WITHOUT ANY WARRANTIES WHETHER EXPRESSED OR IMPLIED.
%##########################################################################
clear all; close all; clc; %clear matrices, close figures & clear cmd wnd.

X = imread('../images/Lena128.png'); %Load image into matrix X
I = im2double(X);                   %Convert to double matrix I
F = fftshift(fft2(I));              %FFT2 shifted
Amp = log(abs(F));                  %Amplitude abs(F)=sqrt(real(F)ˆ2+imag(F)ˆ2))
Pha = angle(F);                     %Phase angle(F)=atan2(imag(F),real(F))
subplot(1,3,1), imshow(I, 'InitialMagnification','fit');
subplot(1,3,2), imshow(Amp, []);    %[]=[min(min(Amp)) max(max(Amp))]
subplot(1,3,3), imshow(Pha, []);    %[]=[min(min(Pha)) max(max(Pha))]
pause;

%--------------------------------------------------------------------------
fprintf ('\nTransform  square ...');
size = 128;
I = zeros(size,size);
I(50:80,50:80) = 1;
F = fftshift(fft2(I, 128, 128));
subplot(1,3,1), imshow(I);
subplot(1,3,2), imshow(log(abs(F)),[]);
subplot(1,3,3), imshow(angle(F),[]);
pause;
%--------------------------------------------------------------------------
fprintf ('\nTransform  square translated ...');
I = zeros(size,size);
I(80:110,80:110) = 1;
F = fftshift(fft2(I, 128, 128));
subplot(1,3,1), imshow(I);
subplot(1,3,2), imshow(log(abs(F)),[]);
subplot(1,3,3), imshow(angle(F),[]);
pause;
%--------------------------------------------------------------------------
fprintf ('\nTransform  square rotated ...');
I = zeros(size,size);
I(80:110,80:110) = 1;
I2 = imrotate(I, 30, 'bicubic');
F = fftshift(fft2(I2, 128, 128));
subplot(1,3,1), imshow(I2);
subplot(1,3,2), imshow(log(abs(F)),[]);
subplot(1,3,3), imshow(angle(F),[]);
pause;
%--------------------------------------------------------------------------
fprintf ('\nTransform  I(v,u)=sin(2*pi/size*(1*u + 0*v))*0.5 + 0.5 ...');
size = 32;
I = zeros(size,size);
for v=1:size
   for u=1:size
      I(v,u) = 0.5 * cos(2*pi/size*(0.5*u + 0*v)) + 0.5;
   end
end
F = fftshift(fft2(I, size, size));
subplot(1,3,1), imshow(I);
subplot(1,3,2), imshow(log(abs(F)),[]);
subplot(1,3,3), imshow(angle(F),[]);
pause;

%--------------------------------------------------------------------------
fprintf ('\nTransform  I(v,u)=sin(2*pi/size*(4*u + 4*v))*0.5 + 0.5 ...');
for v=1:size
   for u=1:size
      I(v,u) = 0.5 * sin(2*pi/size*(4*u + 4*v)) + 0.5;
   end
end
F = fftshift(fft2(I, size, size));
subplot(1,3,1), imshow(I);
subplot(1,3,2), imshow(log(abs(F)),[]);
subplot(1,3,3), imshow(angle(F),[]);
pause;

%--------------------------------------------------------------------------
fprintf ('\nTransform  I(v,u)=(sin(2*pi/size*(0*u + 4*v)) * sin(2*pi/size*(4*u + 0*v))*0.5)+ 0.5 ...');
for v=1:size
   for u=1:size
      I(v,u)=(0.5 * sin(2*pi/size*(0*u + 4*v)) * sin(2*pi/size*(4*u + 0*v)))+ 0.5;
   end
end
F = fftshift(fft2(I, size, size));
subplot(1,3,1), imshow(I);
subplot(1,3,2), imshow(log(abs(F)),[]);
subplot(1,3,3), imshow(angle(F),[]);
pause;

%--------------------------------------------------------------------------
fprintf ('\nTransform  for i=1:2:7 I(v,u)= I(v,u) + 1/i*sin(2*pi/size*(i*u + i*v))*0.5 end ...');
for v=1:size
   for u=1:size
      I(v,u)=0;
      for i=1:2:7
         I(v,u)= I(v,u) + 1/i*sin(2*pi/size*(i*u + i*v))*0.5;
      end
      I(v,u)= I(v,u) + 0.5;
   end
end
F = fftshift(fft2(I, size, size));
subplot(1,3,1), imshow(I);
subplot(1,3,2), imshow(log(abs(F)),[]);
subplot(1,3,3), imshow(angle(F),[]);