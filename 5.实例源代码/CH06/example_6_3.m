xdata=0:0.125:0.5;  % ʱ������
ydata=[0 6.24 7.75 4.85 0];  % ����ֵ
xi=0:0.01:0.5;  % ����ʱ������
rand('state',0)  % �趨�����״̬
yi=hermite_interp(xdata,ydata,rand(1,5)-0.5,xi);  % Hermite��ֵ
plot(xdata,ydata,'ko')  % ������֪���ݵ�
hold on  % ͼ�α���
plot(xi,yi,'k')  % ���Ʋ�ֵ���ͼ��
title('\fontname{����}\fontsize{16}�������ز�ֵ')  % ��ӱ���
legend('�����Ľڵ�����','��ֵ����')  % ���ͼ��
