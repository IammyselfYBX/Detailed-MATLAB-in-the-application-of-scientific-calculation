xdata=0:0.125:0.5;  % ʱ������
ydata=[0 6.24 7.75 4.85 0];  % �����еĵ���ֵ
xi=0:0.01:0.5;  % ����ʱ������
yi=lagrange_interp(xdata,ydata,xi);  % Lagrange��ֵ
plot(xdata,ydata,'ko')  % ����ʱ��-����ͼ��
hold on  % ͼ�α���
plot(xi,yi,'k')  % ���Ʋ�ֵ��Ľ��
title('\fontname{����}\fontsize{16}�������ղ�ֵ')  % ��ӱ���
legend('�����Ľڵ�����','��ֵ����')  % ���ͼ��
