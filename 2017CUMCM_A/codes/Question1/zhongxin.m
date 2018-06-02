%先运行文件juli.m
%问题1CT系统旋转中心的求解
%设旋转中心为(x0,y0),接收器的左端点为(x1,y1) ，y1在列方程中消去
%设椭圆的中心为原点，即（x2,y2）=(0,0)

x2=0;
y2=0;

A=[l1,l2,l3]';
B=[1-cos(theta1) -sin(theta1) -1;
   1-cos(theta2) -sin(theta2) -1;
   1-cos(theta3) -sin(theta3) -1];

X=B\A
