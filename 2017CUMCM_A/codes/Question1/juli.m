%问题1求解未覆盖圆情况下的旋转角度theta
clear
clc

A=xlsread('fujian_2.xls');

%找出所有数据的两个或四个端点值，并存入数组M中
M=zeros(4,180);  %建立空矩阵存放符合要求的数据
for j=1:180
    b=0;
    for i=2:511
        if (A(i,j)>0&A(i-1,j)==0)|(A(i,j)>0&A(i+1,j)==0)
           b=b+1;
           M(b,j)=i;
        end
    end
end

%将符合要求的数据（即有四个端点值的数据）所对应的列存入数组N中
N=zeros(180,1);

b=0;
for j=1:180
    if M(1,j)>0&M(2,j)>0&M(3,j)>0&M(4,j)>0
       b=b+1;
       N(b)=j;
    end
end

%统计符合要求数据的个数
s=0;
for j=1:180;
    if N(j)>0
        s=s+1;
    end
end

%找出圆对应的接收单位个数最多的一组，将其求得的间距作为探测单元之间的距离
max=M(4,N(1))-M(3,N(1));
for i=1:s
    if M(2,N(i))-M(1,N(i))<M(4,N(i))-M(3,N(i))
        if max<M(2,N(i))-M(1,N(i))
            max=M(2,N(i))-M(1,N(i));
        end
    else
        if max<M(4,N(i))-M(3,N(i))
            max=M(4,N(i))-M(3,N(i));
        end
    end
end
D=8/(max+1)      %求出探测单元之间的距离(单位：mm)


D_zhongxin=45;       %椭圆中心和圆心的距离
jiaodu=zeros(s,1);
for i=1:s
    d(i)=abs((M(1,N(i))+M(2,N(i)))/2-(M(3,N(i))+M(4,N(i)))/2);
    jiaodu(i)=(d(i).*D./D_zhongxin);        %求出cos值
end

%从符合要求数据中选取三组进行求解
ss=[1 42 85];

real(jiaodu);
theta1=acos(jiaodu(ss(1)))
theta2=pi-acos(jiaodu(ss(2)))
theta3=pi+acos(jiaodu(ss(3)))

%确定椭圆中心对应的探测器上的位置
if M(2,N(ss(1)))-M(1,N(ss(1)))<M(4,N(ss(1)))-M(3,N(ss(1)))
   l1=(M(3,N(ss(1)))+M(4,N(ss(1))))/2
else
   l1=(M(1,N(ss(1)))+M(2,N(ss(1))))/2
end
   
if M(2,N(ss(2)))-M(1,N(ss(2)))<M(4,N(ss(2)))-M(3,N(ss(2)))
   l2=(M(3,N(ss(2)))+M(4,N(ss(2))))/2
else
   l2=(M(1,N(ss(2)))+M(2,N(ss(2))))/2
end
   
if M(2,N(ss(3)))-M(1,N(ss(3)))<M(4,N(ss(3)))-M(3,N(ss(3)))
   l3=(M(3,N(ss(3)))+M(4,N(ss(3))))/2
else
   l3=(M(1,N(ss(3)))+M(2,N(ss(3))))/2
end
    


    


        
        
    
   
        

        


      