x=-2:0.2:2;y=x;
[X,Y]=meshgrid(x);  % ������������
Z=X.*exp(-X.^2-Y.^2);  % �õ��߶�ֵ
subplot 131
mesh(X,Y,Z)  % ������ά����ͼ
subplot 132 
meshc(X,Y,Z)  % ���ƾ��л����ȸ��ߵ���ά����ͼ
subplot 133
meshz(X,Y,Z)  % ���ƴ��л�׼ƽ�����ά����ͼ
