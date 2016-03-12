%##########################################################################
% File:       PunktOperationen.m
% Purpose:    Demo for point operators and histogram functions
% Author:     Marcus Hudritsch
% Date:       15-FEB-09
% Copyright:  Marcus Hudritsch, Kirchrain 18, 2572 Sutz
%             THIS SOFTWARE IS PROVIDED FOR EDUCATIONAL PURPOSE ONLY AND
%             WITHOUT ANY WARRANTIES WHETHER EXPRESSED OR IMPLIED.
%##########################################################################
clear all; close all; clc; %clear matrices, close figures & clear cmd wnd.

X = imread('~/Dropbox/BFH/CPVR1-CP/Exercises/Images/alps.png'); %liesst BMP in Matrix X 
I = im2single(X);                   %Konvertierung in Mat. I mit floats (0-1)
imshow(I);                          %Bild anzeigen
title('Original');
pause;
 
% fprintf ('\n\nBerechne Statistiken ...');
% Imin = min(I(:));                   %Berechne Minimum
% Imax = max(I(:));                   %Berechne Maximum
% Imea = mean(I(:));                  %Berechen Durchschnitt
% Istd = std(I(:));                   %Berechen Standardabweichung
% Ivar = var(I(:));                   %Berechne Varianz
% fprintf ('\nMinimum   : %f', Imin);
% fprintf ('\nMaximum   : %f', Imax);
% fprintf ('\nMittelwert: %f', Imea);
% fprintf ('\nStd.abw   : %f', Istd);
% fprintf ('\nVarianz   : %f', Ivar);
 
G = rgb2gray(I);

imshow(G);
title('Graustufen Bild');
pause;

H = I + 0.5;
imshow(H);
title('Helligkeit linear');
pause;

fprintf ('\n\nHistogramm Bearbeitung ...');
[B,map] = gray2ind (I,256);         %Float Graustufen zu 256 Integer-Graustufen 
imhist(B, map);                          %Histogramm anzeigen
ti tle('Histogramm von Original');
pause;