%CTͼ���ؽ�������
clear
clc

sinogram=xlsread('fujian_2.xls');  %�������Ľ�����Ϣ��Ϊradon�仯��sinogramֵ/'fujian_3.xls'
%theta=xlsread('Angles.xlsx','B1:B180');  %��һ����õĽǶ�
theta=29:208;
theta=theta';        %������Ƕ��Ǿ��ȱ仯�ģ�CT�ؽ���Ч����ǳ��ã�


%�˲������µ�CT�ؽ�ͼ��
FilteredBackprojection(sinogram,theta)

