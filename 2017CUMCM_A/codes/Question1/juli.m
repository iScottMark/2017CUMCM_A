%����1���δ����Բ����µ���ת�Ƕ�theta
clear
clc

A=xlsread('fujian_2.xls');

%�ҳ��������ݵ��������ĸ��˵�ֵ������������M��
M=zeros(4,180);  %�����վ����ŷ���Ҫ�������
for j=1:180
    b=0;
    for i=2:511
        if (A(i,j)>0&A(i-1,j)==0)|(A(i,j)>0&A(i+1,j)==0)
           b=b+1;
           M(b,j)=i;
        end
    end
end

%������Ҫ������ݣ������ĸ��˵�ֵ�����ݣ�����Ӧ���д�������N��
N=zeros(180,1);

b=0;
for j=1:180
    if M(1,j)>0&M(2,j)>0&M(3,j)>0&M(4,j)>0
       b=b+1;
       N(b)=j;
    end
end

%ͳ�Ʒ���Ҫ�����ݵĸ���
s=0;
for j=1:180;
    if N(j)>0
        s=s+1;
    end
end

%�ҳ�Բ��Ӧ�Ľ��յ�λ��������һ�飬������õļ����Ϊ̽�ⵥԪ֮��ľ���
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
D=8/(max+1)      %���̽�ⵥԪ֮��ľ���(��λ��mm)


D_zhongxin=45;       %��Բ���ĺ�Բ�ĵľ���
jiaodu=zeros(s,1);
for i=1:s
    d(i)=abs((M(1,N(i))+M(2,N(i)))/2-(M(3,N(i))+M(4,N(i)))/2);
    jiaodu(i)=(d(i).*D./D_zhongxin);        %���cosֵ
end

%�ӷ���Ҫ��������ѡȡ����������
ss=[1 42 85];

real(jiaodu);
theta1=acos(jiaodu(ss(1)))
theta2=pi-acos(jiaodu(ss(2)))
theta3=pi+acos(jiaodu(ss(3)))

%ȷ����Բ���Ķ�Ӧ��̽�����ϵ�λ��
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
    


    


        
        
    
   
        

        


      