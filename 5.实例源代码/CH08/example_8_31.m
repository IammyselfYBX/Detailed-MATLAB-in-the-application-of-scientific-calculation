[X,Y] = meshgrid(-2:0.25:2,-1:0.2:1);
Z = X.* exp(-X.^2 - Y.^2);
[U,V,W] = surfnorm(X,Y,Z);  % ���㷨ʸ��
quiver3(X,Y,Z,U,V,W,0.5,'r');  % ���Ƽ�ͷͼ��
hold on
surf(X,Y,Z)
axis([-2 3 -2 2 -1 1])
% ������Ƶķ�ʸ��ͼ�������ͼ��Ч���ǲ���
figure
surfnorm(X,Y,Z)  % ���Ʒ�ʸ��ͼ
