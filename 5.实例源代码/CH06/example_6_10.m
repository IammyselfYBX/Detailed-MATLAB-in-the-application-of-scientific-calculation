x=1:4;
y=1:4;
rand('state',0);  % �趨�����״̬
z=rand(4);  % ����4�����������
xi=1:0.05:4;  % �������ݵ�
yi=xi;
[X,Y]=meshgrid(xi,yi);  % ������������
zi1=interp2(x,y,z,X,Y,'spline');  % ����interp2����������ֵ
pp=csape({x,y},z);  % ����csape()������������������ֵ
zi2=ppual(pp,{xi,yi});  % �����������㴦�ĺ���ֵ
h(1)=subplot(2,2,1);  % ͼ�ηָ�
mesh(xi,yi,zi1);title('interp2������ֵ')  % ����ͼ�β���ӱ���
h(2)=subplot(2,2,2);  % ͼ�ηָ�
mesh(xi,yi,zi2);title('csape������ֵ')  % ����ͼ�β���ӱ���
h(3)=subplot(2,2,[3 4]);  % h(3)=subplot(2,1,2);
mesh(xi,yi,zi1-zi2);title('���ֲ�ֵ���������ͼ')
axis(h,'tight')
