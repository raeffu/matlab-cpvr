%##########################################################################
% File:       HoughLine1.m
% Purpose:    Demo for hough transform
% Author:     From Matlab documentation
% Date:       15-FEB-09
% Copyright:  THIS SOFTWARE IS PROVIDED FOR EDUCATIONAL PURPOSE ONLY AND
%             WITHOUT ANY WARRANTIES WHETHER EXPRESSED OR IMPLIED.
%##########################################################################
clear all; close all; clc; %clear matrices, close figures & clear cmd wnd.

I  = imread('../images/circuit.png');    % Load image
rotI = imrotate(I,33,'crop');  % Rotate image 33 degrees
BW = edge(rotI,'canny');       % Edge detection with Canny algorithm
imshow(BW);                    % Show edge image

% Transform into hough space H with all thetas T and rhos R (=radius)
[H,T,R] = hough(BW, 'ThetaResolution',0.5, 'RhoResolution', 1); 

% Show the hough space with T & R as axis scales
figure, imshow(H,[],'XData',T,'YData',R,'InitialMagnification','fit');
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;
colormap(jet);

% Get the thetas & rhos of the 5 brightest peaks
P = houghpeaks(H,5);
x = T(P(:,2)); y = R(P(:,1));  % Get the x & y coords out of T & P
plot(x,y,'s','color','white');

% Find lines and plot them
lines = houghlines(BW,T,R,P,'FillGap',5,'MinLength',7);
figure, imshow(rotI), hold on
max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

   % Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');

   % Determine the endpoints of the longest line segment
   len = norm(lines(k).point1 - lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   end
end

% highlight the longest line segment
plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','cyan');
