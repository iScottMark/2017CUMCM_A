%�������ļ�juli.m��zhongxin.m
%����belta��ʹ�� abs(l(i)+X(1)*cos(belta)+X(2)*sin(belta)+X(3)-X(1)) �����ܵ�С
%���180���������ʱ��ԼΪ5mins

l=zeros(180,1);

for i=1:180
    if M(2,i)-M(1,i)<M(4,i)-M(3,i)
        l(i)=(M(4,i)+M(3,i))/2;
    else
        l(i)=(M(2,i)+M(1,i))/2;
    end
end
l=l;

theta_180=zeros(180,1);

min=zeros(180,1);
jiao=zeros(180,1);
%��belta���зֶ���⣬�����п��ƣ�ȥ���쳣ֵ����Ϊ��ʱ����ת��ǰ���belta�Ⱥ����beltaֵС


alpha=0;
for i=1:49
    min(i,1)=10000000;
     for belta=0:0.0000001:1.2*pi;  %1.2*pi�������һ���Ƕȵ�beltaֵȷ�������ٱ�������
         if abs(l(i)+X(1)*cos(belta)+X(2)*sin(belta)+X(3)-X(1))<min(i)&belta>alpha %����ʹ�ú�һ��belta>ǰһ��belta
             min(i)=abs(l(i)+X(1)*cos(belta)+X(2)*sin(belta)+X(3)-X(1));
             jiao(i)=belta;
             alpha=belta;
         end
    end
 end
 

alpha=0;

for i=49:51
   min(i,1)=10000000;
   for belta=0:0.000001:1.2*pi;
        if abs(l(i)+X(1)*cos(belta)+X(2)*sin(belta)+X(3)-X(1))<min(i)&belta>alpha&belta<3 %����i=1:49ʱ��beltaֵ������belta�Ĵ�С��ȥ���쳣ֵ
            min(i)=abs(l(i)+X(1)*cos(belta)+X(2)*sin(belta)+X(3)-X(1));
            jiao(i)=belta;
            alpha=belta;
        end
   end
end

alpha=0;

for i=49:51
   min(i,1)=10000000;
   for belta=0:0.000001:1.2*pi;
        if abs(l(i)+X(1)*cos(belta)+X(2)*sin(belta)+X(3)-X(1))<min(i)&belta>alpha&belta<3
            min(i)=abs(l(i)+X(1)*cos(belta)+X(2)*sin(belta)+X(3)-X(1));
            jiao(i)=belta;
            alpha=belta;
        end
   end
end


alpha=0;
for i=52:53
  min(i,1)=10000000;
  for belta=0:0.000001:1.2*pi;
       if abs(l(i)+X(1)*cos(belta)+X(2)*sin(belta)+X(3)-X(1))<min(i)&belta<3
           min(i)=abs(l(i)+X(1)*cos(belta)+X(2)*sin(belta)+X(3)-X(1));
           jiao(i)=belta;
          alpha=belta;
       end
  end
end



alpha=0;
for i=54:60
  min(i,1)=10000000;
  for belta=0:0.000001:1.2*pi;
       if abs(l(i)+X(1)*cos(belta)+X(2)*sin(belta)+X(3)-X(1))<min(i)&belta<3
           min(i)=abs(l(i)+X(1)*cos(belta)+X(2)*sin(belta)+X(3)-X(1));
           jiao(i)=belta;
          alpha=belta;
       end
  end
end


%54--60
alpha=0;
for i=61:87
  min(i,1)=10000000;
  for belta=0:0.000001:1.2*pi;
       if abs(l(i)+X(1)*cos(belta)+X(2)*sin(belta)+X(3)-X(1))<min(i)&belta<3
           min(i)=abs(l(i)+X(1)*cos(belta)+X(2)*sin(belta)+X(3)-X(1));
           jiao(i)=belta;
           alpha=belta;
       end
  end
end
%i=61:87


alpha=0;


for i=88:97
  min(i,1)=10000000;
  for belta=0:0.000001:1.2*pi;
       if abs(l(i)+X(1)*cos(belta)+X(2)*sin(belta)+X(3)-X(1))<min(i)&belta<2.2707&belta>alpha %��beltaֵ���п��ƣ���֤��һ��belta>ǰһ��belta
           min(i)=abs(l(i)+X(1)*cos(belta)+X(2)*sin(belta)+X(3)-X(1));
           jiao(i)=belta;
          alpha=belta;
       end
  end
end


alpha=0;

for i=98
  min(i,1)=10000000;
  for belta=0:0.000001:1.2*pi;
       if abs(l(i)+X(1)*cos(belta)+X(2)*sin(belta)+X(3)-X(1))<min(i)&belta<3
           min(i)=abs(l(i)+X(1)*cos(belta)+X(2)*sin(belta)+X(3)-X(1));
           jiao(i)=belta;
          alpha=belta;
       end
  end
end


alpha=0;

for i=99
  min(i,1)=10000000;
  for belta=0:0.000001:1.2*pi;
      if abs(l(i)+X(1)*cos(belta)+X(2)*sin(belta)+X(3)-X(1))<min(i)&belta>alpha
           min(i)=abs(l(i)+X(1)*cos(belta)+X(2)*sin(belta)+X(3)-X(1));
           jiao(i)=belta;
          alpha=belta;
       end
 end
end
%i=99

alpha=0;
for i=100:112
min(i,1)=10000000;
for belta=0:0.000001:1.2*pi;
     if abs(l(i)+X(1)*cos(belta)+X(2)*sin(belta)+X(3)-X(1))<min(i)&belta>alpha
         min(i)=abs(l(i)+X(1)*cos(belta)+X(2)*sin(belta)+X(3)-X(1));
        jiao(i)=belta;
        alpha=belta;
     end
end
end
%100:112


alpha=0;
for i=113:116
min(i,1)=10000000;
for belta=0:0.000001:1.2*pi;
      if abs(l(i)+X(1)*cos(belta)+X(2)*sin(belta)+X(3)-X(1))<min(i)&belta>alpha&belta<2.56%��beltaֵ���п��ƣ���֤��һ��belta>ǰһ��belta
          min(i)=abs(l(i)+X(1)*cos(belta)+X(2)*sin(belta)+X(3)-X(1));
         jiao(i)=belta;
         alpha=belta;
      end
 end
end
%113:116

i=117;
jiao(i)=1/2*(jiao(i-1)+jiao(i+1));  %i=117ʱ��ֵ�쳣����118��119��ֵ��ƽ��������i=117ʱ��belta

alpha=0;
for i=118:119
min(i,1)=10000000;
 for belta=0:0.000001:1.2*pi;
      if abs(l(i)+X(1)*cos(belta)+X(2)*sin(belta)+X(3)-X(1))<min(i)&belta>alpha&belta<2.60&belta>2.55
          min(i)=abs(l(i)+X(1)*cos(belta)+X(2)*sin(belta)+X(3)-X(1));
         jiao(i)=belta;
          alpha=belta;
      end
 end
end


%118:119



alpha=0;
for i=120:125
 min(i,1)=10000000;
 for belta=0:0.000001:1.2*pi;
      if abs(l(i)+X(1)*cos(belta)+X(2)*sin(belta)+X(3)-X(1))<min(i)&belta>alpha
          min(i)=abs(l(i)+X(1)*cos(belta)+X(2)*sin(belta)+X(3)-X(1));
         jiao(i)=belta;
          alpha=belta;
      end
 end
end


%120:125
alpha=0;
for i=126:180
    min(i,1)=10000000;
    for belta=0:0.000001:1.2*pi;
        if abs(l(i)+X(1)*cos(belta)+X(2)*sin(belta)+X(3)-X(1))<min(i)&belta>alpha
            min(i)=abs(l(i)+X(1)*cos(belta)+X(2)*sin(belta)+X(3)-X(1));
            jiao(i)=belta;
            alpha=belta;
        end
   end
end

%147-180

alpha=0;

for i=126:146
  min(i,1)=10000000;
  for belta=0:0.000001:1.2*pi;
       if abs(l(i)+X(1)*cos(belta)+X(2)*sin(belta)+X(3)-X(1))<min(i)&belta>alpha
           min(i)=abs(l(i)+X(1)*cos(belta)+X(2)*sin(belta)+X(3)-X(1));
          jiao(i)=belta;
           alpha=belta;
       end
  end
end
min;

%126:146������֮ǰ����i=126:147ʱ������õ��쳣beltaֵ





%E=zeros(90,3);
%for i=91:180
 %    fa=0.0001;
 %   for belta=0:0.000001:pi;
 %       if abs(l(i)+X(1)*cos(belta)+X(2)*sin(belta)+X(3)-X(1))<fa&belta>2.1
 %       if E(i-89,1)>0
 %           if E(i-89,2)>0
 %               E(i-89,3)=belta;
 %           else
 %               E(i-89,2)=belta;
 %           end
 %       else
 %           E(i-89,1)=belta;
 %       end
 %       end
 %   end
%end
     
            
            





