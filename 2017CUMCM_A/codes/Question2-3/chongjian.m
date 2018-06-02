%CT图像重建主程序
clear
clc

sinogram=xlsread('fujian_2.xls');  %将附件的接收信息作为radon变化的sinogram值/'fujian_3.xls'
%theta=xlsread('Angles.xlsx','B1:B180');  %第一问求得的角度
theta=29:208;
theta=theta';        %若假设角度是均匀变化的（CT重建的效果会非常好）


%滤波降噪下的CT重建图像
FilteredBackprojection(sinogram,theta)

