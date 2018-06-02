%��ÿ��ͼ�����������
%��ct.xlsx����'ct3.xlsx'�ļ���chongjian.m���õĻҶ�ͼ��ct�ľ���
%��ֵ�Ļ��ִ�chonjian.m�ĻҶ�ֱֵ��ͼ�ó�
clear
clc

%��ԭ���ؽ�ͼ��Ĵ�С����״���Լ��������е����λ��
D=0.2759;

finalct=xlsread('finalct_3.xlsx');     %����3��'ct3.xlsx'

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
s=zeros(6,1);               %�Ҷ�ֵ���
num=zeros(6,1);             %ͳ�Ƹ���
ave=zeros(6,1);
fenji=zeros(256,256);
for i=1:256
    for j=1:256
        if ct(i,j)>0.3&ct(i,j)<0.5
            s(1)=s(1)+ct(i,j);
            num(1)=num(1)+1;
            fenji(i,j)=1;
        elseif ct(i,j)>=0.5&ct(i,j)<0.7
             s(2)=s(2)+ct(i,j);
             num(2)=num(2)+1;
             fenji(i,j)=2;
        elseif ct(i,j)>=0.7&ct(i,j)<0.8
             s(3)=s(3)+ct(i,j);
             num(3)=num(3)+1;
             fenji(i,j)=3;
        elseif ct(i,j)>=0.8&ct(i,j)<1
             s(4)=s(4)+ct(i,j);
             num(4)=num(4)+1;
             fenji(i,j)=4;
        elseif ct(i,j)>=1&ct(i,j)<1.1
             s(5)=s(5)+ct(i,j);
             num(5)=num(5)+1;
             fenji(i,j)=5;
        elseif ct(i,j)>1.1
             s(6)=s(6)+ct(i,j);
             num(6)=num(6)+1;
             fenji(i,j)=6;
        end
    end
end

for i=1:6
    ave(i)=s(i)/num(i);
end

zong=(s(1)+s(2)+s(3)+s(4)+s(5)+s(6))/(num(1)+num(2)+num(3)+num(4)+num(5)+num(6));

xishoulv=zeros(6,1);
for i=1:6
    xishoulv(i)=ave(i)/zong;
end
xishoulv

%ȷ��256*256������������
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
        elseif fenji(i,j)==5
            fenji(i,j)=xishoulv(5);
        elseif fenji(i,j)==6
            fenji(i,j)=xishoulv(6);
        end
    end
end
