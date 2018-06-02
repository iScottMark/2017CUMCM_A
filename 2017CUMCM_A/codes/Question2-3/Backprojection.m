%问题2、3，进行图像重建/反投影 （未进行滤波）
%函数所需的参数为sinogram（用是接收信息，即假设接收信息与物体厚度成正比）
%另个一个参数为theta(theta为角度制，为第一问所求)

function jiezhi = Backprojection(sinogram,theta)

theta = (pi/180)*theta;       %将角度制转化为弧度制

%设定CT重建图像的大小，注：像素512×512是因为与探测器的个数以及接收信息行数相同
%同时，要注意长度单位的转化。这里的512应该指探测单元间的间距,而不是像素
CT = zeros(512,512);   

zhongxindian = 257;     %将图像的中心点作为旋转中心，图像重建后再进行坐标变换，得到具体位置
[x,y] = meshgrid(-256:255);     %生成坐标网格

%开始ART重组迭代
for i=1:180
    %确定旋转过程中的坐标网格大小，并且限制其不超出范围
    xuanzhuan = round(zhongxindian + x*sin(theta(i))+y*cos(theta(i)));
    xianzhi = find((xuanzhuan>0)&(xuanzhuan<=512));
    quanxin = xuanzhuan(xianzhi);
    
    CT(xianzhi) = CT(xianzhi) + sinogram(quanxin,i)./180;
    
end

%将图片逆时针旋转90度得重建图像（MATLAB中图像处理中的坐标系与习惯坐标系有区别）
%注意该图像只能反映介质的形状大小，不能反映具体的位置
ct = zeros(512,512);
for i=1:512
    for j = 1:512
        m = -j+513;
        n = i;
        ct(m,n) = CT(i,j);
    end
end
hist(ct)
%imshow(ct,[])
%显示CT重建的灰度图像
    
    