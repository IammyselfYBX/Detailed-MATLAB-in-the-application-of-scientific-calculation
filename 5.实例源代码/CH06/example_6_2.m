xdata=0:0.125:0.5;  % ʱ������
ydata=[0 6.24 7.75 4.85 0];  % �����еĵ���ֵ
xi=0:0.01:0.5;  % ����ʱ������
[yi,D]=newton_interp(xdata,ydata,xi);  % Newton��ֵ
plot(xdata,ydata,'ko')  % ������֪���ݵ�
hold on  % ͼ�α���
plot(xi,yi,'k')  % ���Ʋ�ֵ���ͼ��
disp('���̱�D��')  % ��ʾ���̱�D
disp(D)
title('\fontname{����}\fontsize{16}ţ�ٲ�ֵ')  % ��ӱ���
legend('�����Ľڵ�����','��ֵ����')  % ���ͼ��
