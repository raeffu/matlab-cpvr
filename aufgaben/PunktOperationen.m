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

fprintf ('\n\nHistogramm Bearbeitung ...');
[H1,map] = gray2ind (G,256);         %Float Graustufen zu 256 Integer-Graustufen 
imhist(H1);                          %Histogramm anzeigen
title('Histogramm Graustufen');
pause;

H = G + 0.5;
imshow(H);
title('Helligkeit linear');
pause;

fprintf ('\n\nHistogramm Bearbeitung ...');
[H2,map] = gray2ind (H,256);         %Float Graustufen zu 256 Integer-Graustufen 
imhist(H2);                          %Histogramm anzeigen
title('Histogramm aufgehellt');
pause;

GammaValue = 1.0/2.2;
GA = G.^ GammaValue;                %Gammakorrektur f?r Floats (0-1)
imshow(GA);
title('Nach Gammakorrektur mit Gamma 1/2.2');
pause;

[H2,map] = gray2ind(GA,256);
imhist(H2);
title('Histogrammausgleich nach Gammakorrektur');
pause;