%��ÿ��ͼ�����������
%��ct.xlsx����'ct3.xlsx'�ļ���chongjian.m���õĻҶ�ͼ��ct�ľ���
%��ֵ�Ļ��ִ�chonjian.m�ĻҶ�ֱֵ��ͼ�ó�
clear
clc

%��ԭ���ؽ�ͼ��Ĵ�С����״���Լ��������е����λ��
D=0.2759;

finalct=xlsread('finalct2.xlsx');     %����3��'ct3.xlsx'

x0=ceil((512-100/D)/2);
y0=ceil(((512-100/D)/2));
zuizhong=zeros(512,512);

for j=1:512
    if j<512-x0
        zuizhong(:,j)=finalct(:,j+x0);
    else
        zuizhong(:,j)=0;
    end
end


for i=1:512
    if i>y0
        zuizhong(513-i+y0,:)=zuizhong(513-i,:);
    else
        zuizhong(513-i,:)=0;
    end
end


ct=zeros(ceil(100/D),ceil(100/D));
for i=1:ceil(100/D)
    for j=1:ceil(100/D)
        ct(ceil(100/D)+1-i,j)=zuizhong(513-i,j);
    end
end
ct=imresize(ct,[256,256]);
imshow(ct,[])

%�����ʷּ�
s=zeros(4,1);               %�Ҷ�ֵ���
num=zeros(4,1);             %ͳ�Ƹ���
ave=zeros(4,1);
fenji=zeros(256,256);
for i=1:256
    for j=1:256
        if ct(i,j)>0.125&ct(i,j)<0.15
            s(1)=s(1)+ct(i,j);
            num(1)=num(1)+1;
            fenji(i,j)=1;
        elseif ct(i,j)>=0.15&ct(i,j)<0.2
             s(2)=s(2)+ct(i,j);
             num(2)=num(2)+1;
             fenji(i,j)=2;
        elseif ct(i,j)>=0.2&ct(i,j)<0.225
             s(3)=s(3)+ct(i,j);
             num(3)=num(3)+1;
             fenji(i,j)=3;
        elseif ct(i,j)>=0.225
             s(4)=s(4)+ct(i,j);
             num(4)=num(4)+1;
             fenji(i,j)=4;
        end
    end
end

for i=1:4
    ave(i)=s(i)/num(i);
end
zong=(s(1)+s(2)+s(3)+s(4))/(num(1)+num(2)+num(3)+num(4));

xishoulv=zeros(4,1);
for i=1:4
    xishoulv(i)=ave(i)/zong;
end
xishoulv

for i=1:256
    for j=1:256
        if fenji(i,j)==1
            fenji(i,j)=xishoulv(1);
        elseif fenji(i,j)==2
            fenji(i,j)=xishoulv(2);
        elseif fenji(i,j)==3
            fenji(i,j)=xishoulv(3);
        elseif fenji(i,j)==4
            fenji(i,j)=xishoulv(4);
        end
    end
end





