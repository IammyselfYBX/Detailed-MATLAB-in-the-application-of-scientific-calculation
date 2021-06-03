x=-1:0.01:1;
xdata=-1:0.2:1;
ydata=1./(1+25*xdata.^2);
yi=pchip(xdata,ydata,x);  % �ֶ�����Hermite��ֵ
% yi=interp1(xdata,ydata,x,'pchip');  % ���ú���interp1()��'pchip'ѡ����зֶ�����Hermite��ֵ
% yi=interp1(x,y,xi,'cubic');  % ������ֵ
% pp=pchip(xdata,ydata);  % �ֶ�����Hermite��ֵ
% yi=ppval(pp,x);  % ��x���ķֶ�����Hermite��ֵ����ʽ�ĺ���ֵ
subplot(2,1,1)  % ͼ�ηָ�
plot(x,1./(1+25*x.^2),'k',x,yi,'k:',xdata,ydata,'ko')  % ����ͼ��
legend('��������','�ֶ�����hermite��ֵ')  % ���ͼ��
text(-0.9,0.8,{'�ֶ�����','�������ز�ֵ'},...
    'fontname','����','fontsize',16)  % ��ӱ�ע
subplot(2,1,2)  % ͼ�ηָ�
plot(x,yi-1./(1+25*x.^2),'k')  % ����ͼ��
legend(char('\fontsize{8}�ֶ�����hermite','��ֵ�������'),2);  % ���ͼ��
legend('boxoff')  % ����ͼ���߿�Ϊ��
