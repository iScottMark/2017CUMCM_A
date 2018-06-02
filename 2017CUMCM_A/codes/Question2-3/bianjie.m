%先运行chongjian.m以得到矩阵ct
%求CT重建图像的轮廓边界
yuzhi=？;        %给出阈值
A=zeros(512,512);
for i=1:512
    for j=1:512
        if ct(i,j)>yuzhi
            A(i,j)=1;
        else
            A(i,j)=0;
        end
    end
end
%figure(2)=imshow(B)

B=zeros(512,512);
for i=2:511
    for j=2:511
        if (A(i-1,j-1)+A(i-1,j)+A(i-1,j+1)+A(i,j-1)+A(i,j+1)+A(i+1,j-1) ...
                +A(i+1,j)+A(i+1,j+1)==8)|(A(i-1,j-1)+A(i-1,j) ...
                +A(i-1,j+1)+A(i,j-1)+A(i,j+1)+A(i+1,j-1) ...
                +A(i+1,j)+A(i+1,j+1)==0)
            B(i,j)=1;
        else
            B(i,j)=0;
        end
    end
end
imshow(B)