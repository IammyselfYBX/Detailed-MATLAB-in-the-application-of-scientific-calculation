x=-1:0.01:1;
xdata=-1:0.2:1;
ydata=1./(1+25*xdata.^2);
yi=spline(xdata,ydata,x);  % ����������ֵ
% yi=interp1(xdata,ydata,x,'spline');  % interp1()����'spline'ѡ��ʵ������������ֵ
% pp=spline(xdata,ydata);  % ����������ֵ
% yi=ppval(pp,x);
% pp=csape(xdata,ydata);  % csape()����ʵ������������ֵ
% yi=ppval(pp,x);  % �ȼ��ڣ�yi=ppual(pp,x);
subplot(2,1,1)  % ͼ�ηָ�
plot(x,1./(1+25*x.^2),'k',x,yi,'k:',xdata,ydata,'ko')  % ����ͼ��
legend('��������','����������ֵ')  % ���ͼ��
text(-0.9,0.8,'����������ֵ','fontname','����','fontsize',16)  % ��ӱ�ע
subplot(2,1,2)  % ͼ�ηָ�
plot(x,yi-1./(1+25*x.^2),'k')  % ����ͼ��
legend('����������ֵ�������')  % ���ͼ��
