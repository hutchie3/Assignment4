clc;
clear all;
close all;

I = imread('envelopes/envelope2.jpg');
Imed = medfilt2(I,[100,100]);
Ifinal = Imed - I;
BW = Ifinal > 50;
% sizeBW = size(BW);
% Isub = BW(523:1046,1:744);
% 
imshow(BW)

[H, theta, rho] = hough(BW);

max(H(:))
min(H(:))
Hgray = mat2gray(H);
Hadj = imadjust(Hgray);
peaks = houghpeaks(H, 2)
lines = houghlines(BW, theta, rho, peaks)

figure(2)
imshow([lines.point1(1),lines.point2(1)],[lines.point1(2),lines.point2(2)]); 
axis normal;
% 
% figure(3)
% imshow(Hadj, 'InitialMagnification','fit','XData', theta, 'YData',rho); 
% axis normal;
% axis on;
% xlabel('\theta, degrees');
% ylabel('\rho');
% hold on;
% P = houghpeaks(H,5);
% x = theta(P(:,2));
% y = rho(P(:,1));
% plot(x,y,'g*')
