figure;  % �����µ�ͼ�δ���
rand('state',0)  % ���������״̬
[X,Y] = meshgrid(-2:.2:2, -2:.2:2);  % ���������������
Z = X .* exp(-X.^2 - Y.^2);  % �����Ԫ����z(x,y)����ɢ��ֵ
subplot(131);
mesh(X,Y,Z);  % ������״ͼ
subplot(132);
mesh(X,Y,Z,rand(size(Z)));  % ���������ɫ��״ͼ
subplot(133);
m=mesh(X,Y,Z,2*ones(size(Z)),'EdgeColor','k');  % ���Ƶ�ɫ��״ͼ
