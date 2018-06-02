%问题2、3，进行图像重建/反投影 （滤波降噪）
%函数所需的参数为sinogram（用的是接收信息，即假设接收信息与物体厚度成正比）
%另个一个参数为theta(theta为角度制，为第一问所求)

function [finalct] = FilteredBackprojection(sinogram,theta);

theta = (pi/180)*theta;       %将角度制转化为弧度制

%设定CT重建图像的大小，注：像素512×512是因为与探测器的个数以及接收信息行数相同
%同时，要注意长度单位的转化。这里的512应该指探测单元间的间距,而不是像素
CT = zeros(512,512);   

zhongxindian = 257;     %将图像的中心点作为旋转中心，图像重建后再进行坐标变换，得到具体位置
[x,y] = meshgrid(-256:255);     %生成坐标网格

%选择合适的滤波器对CT图像进行滤波降噪（用爬坡滤波器'ramLak'或者'sheppLogan'）
%这里选择爬坡滤波器ramLak
halfFilterSize = 513;
filter = zeros(1,halfFilterSize);
filter(1:2:halfFilterSize) = -1./([1:2:halfFilterSize].^2 * pi^2);
filter = [fliplr(filter) 1/4 filter];

%开始迭代重建，包含滤波降噪的过程
for i=1:180
    %确定旋转过程中的坐标网格大小，并且限制其不超出范围
    xuanzhuan = round(zhongxindian + x*sin(theta(i))+y*cos(theta(i)));
    xianzhi = find((xuanzhuan>0)&(xuanzhuan<=512));
    quanxin = xuanzhuan(xianzhi);
    
    %滤波降噪（卷积）
    juanji = conv(sinogram(:,i),filter,'same');
    
    CT(xianzhi) = CT(xianzhi) + juanji(quanxin)./180;
end

%将图片逆时针旋转90度得重建图像（MATLAB中图像处理中的坐标系与习惯坐标系有区别）
%注意该图像只能反映介质的形状大小，不能反映具体的位置
ct = zeros(512,512);
for i = 1:512
    for j = 1:512
        m = -j+513;
        n = i;
        ct(m,n) = CT(i,j);
    end
end

%将图像进行平移，得到最终的图像位置
x0=ceil(-33.4365);
y0=ceil(22.2896);
finalct=zeros(512,512);

for j=1:512
    if j<512+x0
        finalct(:,j)=ct(:,j-x0);
    else
        finalct(:,j)=0;
    end
end


for i=1:512
    if i<512-y0
        finalct(i,:)=finalct(i+y0,:);
    else
        finalct(i,:)=0;
    end
end


%显示CT重建的灰度图像
subplot(1,3,1)
imshow(ct,[])
xlabel('X')
ylabel('Y')
title('滤波降噪后的CT重建图像')

%显示平移后的最终图像（形状、大小，不能反映相对位置）
subplot(1,3,2)
imshow(finalct,[])
xlabel('X')
ylabel('Y')
title('平移后的最终图像')

%画出不同灰度值的直方图，为下面的吸收率分级做铺垫
subplot(1,3,3)
hist(finalct)           
xlabel('灰度值')
ylabel('个数')
title('灰度值直方图')

            
            
            
            
    