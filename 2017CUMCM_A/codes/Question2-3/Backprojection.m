%����2��3������ͼ���ؽ�/��ͶӰ ��δ�����˲���
%��������Ĳ���Ϊsinogram�����ǽ�����Ϣ�������������Ϣ�������ȳ����ȣ�
%���һ������Ϊtheta(thetaΪ�Ƕ��ƣ�Ϊ��һ������)

function jiezhi = Backprojection(sinogram,theta)

theta = (pi/180)*theta;       %���Ƕ���ת��Ϊ������

%�趨CT�ؽ�ͼ��Ĵ�С��ע������512��512����Ϊ��̽�����ĸ����Լ�������Ϣ������ͬ
%ͬʱ��Ҫע�ⳤ�ȵ�λ��ת���������512Ӧ��ָ̽�ⵥԪ��ļ��,����������
CT = zeros(512,512);   

zhongxindian = 257;     %��ͼ������ĵ���Ϊ��ת���ģ�ͼ���ؽ����ٽ�������任���õ�����λ��
[x,y] = meshgrid(-256:255);     %������������

%��ʼART�������
for i=1:180
    %ȷ����ת�����е����������С�����������䲻������Χ
    xuanzhuan = round(zhongxindian + x*sin(theta(i))+y*cos(theta(i)));
    xianzhi = find((xuanzhuan>0)&(xuanzhuan<=512));
    quanxin = xuanzhuan(xianzhi);
    
    CT(xianzhi) = CT(xianzhi) + sinogram(quanxin,i)./180;
    
end

%��ͼƬ��ʱ����ת90�ȵ��ؽ�ͼ��MATLAB��ͼ�����е�����ϵ��ϰ������ϵ������
%ע���ͼ��ֻ�ܷ�ӳ���ʵ���״��С�����ܷ�ӳ�����λ��
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
%��ʾCT�ؽ��ĻҶ�ͼ��
    
    