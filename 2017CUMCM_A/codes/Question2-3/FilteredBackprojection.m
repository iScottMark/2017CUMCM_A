%����2��3������ͼ���ؽ�/��ͶӰ ���˲����룩
%��������Ĳ���Ϊsinogram���õ��ǽ�����Ϣ�������������Ϣ�������ȳ����ȣ�
%���һ������Ϊtheta(thetaΪ�Ƕ��ƣ�Ϊ��һ������)

function [finalct] = FilteredBackprojection(sinogram,theta);

theta = (pi/180)*theta;       %���Ƕ���ת��Ϊ������

%�趨CT�ؽ�ͼ��Ĵ�С��ע������512��512����Ϊ��̽�����ĸ����Լ�������Ϣ������ͬ
%ͬʱ��Ҫע�ⳤ�ȵ�λ��ת���������512Ӧ��ָ̽�ⵥԪ��ļ��,����������
CT = zeros(512,512);   

zhongxindian = 257;     %��ͼ������ĵ���Ϊ��ת���ģ�ͼ���ؽ����ٽ�������任���õ�����λ��
[x,y] = meshgrid(-256:255);     %������������

%ѡ����ʵ��˲�����CTͼ������˲����루�������˲���'ramLak'����'sheppLogan'��
%����ѡ�������˲���ramLak
halfFilterSize = 513;
filter = zeros(1,halfFilterSize);
filter(1:2:halfFilterSize) = -1./([1:2:halfFilterSize].^2 * pi^2);
filter = [fliplr(filter) 1/4 filter];

%��ʼ�����ؽ��������˲�����Ĺ���
for i=1:180
    %ȷ����ת�����е����������С�����������䲻������Χ
    xuanzhuan = round(zhongxindian + x*sin(theta(i))+y*cos(theta(i)));
    xianzhi = find((xuanzhuan>0)&(xuanzhuan<=512));
    quanxin = xuanzhuan(xianzhi);
    
    %�˲����루�����
    juanji = conv(sinogram(:,i),filter,'same');
    
    CT(xianzhi) = CT(xianzhi) + juanji(quanxin)./180;
end

%��ͼƬ��ʱ����ת90�ȵ��ؽ�ͼ��MATLAB��ͼ�����е�����ϵ��ϰ������ϵ������
%ע���ͼ��ֻ�ܷ�ӳ���ʵ���״��С�����ܷ�ӳ�����λ��
ct = zeros(512,512);
for i = 1:512
    for j = 1:512
        m = -j+513;
        n = i;
        ct(m,n) = CT(i,j);
    end
end

%��ͼ�����ƽ�ƣ��õ����յ�ͼ��λ��
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


%��ʾCT�ؽ��ĻҶ�ͼ��
subplot(1,3,1)
imshow(ct,[])
xlabel('X')
ylabel('Y')
title('�˲�������CT�ؽ�ͼ��')

%��ʾƽ�ƺ������ͼ����״����С�����ܷ�ӳ���λ�ã�
subplot(1,3,2)
imshow(finalct,[])
xlabel('X')
ylabel('Y')
title('ƽ�ƺ������ͼ��')

%������ͬ�Ҷ�ֵ��ֱ��ͼ��Ϊ����������ʷּ����̵�
subplot(1,3,3)
hist(finalct)           
xlabel('�Ҷ�ֵ')
ylabel('����')
title('�Ҷ�ֱֵ��ͼ')

            
            
            
            
    