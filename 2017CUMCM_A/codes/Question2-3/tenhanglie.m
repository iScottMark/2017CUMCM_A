%������wenti2.m����wenti3.m
%���ʮ�������Ӧ���к���
D=0.2759;

tenCoords=xlsread('fujian_4.xls');
tenRowColumn=zeros(10,2);

for i=1:10
    tenRowColumn(i,1)=ceil(257-tenCoords(i,2)/(100/256));
    tenRowColumn(i,2)=ceil(tenCoords(i,1)/(100/256)+1);
end

tenRowColumn

tenxishoulv=zeros(10,1);
for i=1:10
    tenxishoulv(i)=fenji(tenRowColumn(i,1),tenRowColumn(i,2));
end

tenxishoulv

