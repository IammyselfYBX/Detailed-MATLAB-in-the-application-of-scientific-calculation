x=-1:0.01:1;  % �������ݵ�
xdata=-1:0.2:1;  % ��֪���ݵ�
ydata=1./(1+25*xdata.^2);  % ��֪���ݵ�
y=Lagrange_interp(xdata,ydata,x);  % Lagrange��ֵ
plot(xdata,ydata,'ko',x,y,'k',x,1./(1+25*x.^2))  % ����ͼ��
