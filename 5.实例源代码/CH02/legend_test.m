x=0:0.01:pi;
y1=sin(2*x);y2=cos(2*x);
subplot 121
plot(x,y1,x,y2,':')
axis tight  % �޶�����̶ȵ������ݷ�Χ
h1=legend('sin(2{\itx})','cos(2{\itx})',3);  % ���ͼ����ע
set(h1,'fontname','times','fontsize',12,'Color','none')  % ����ͼ�����������ɫ
subplot 122
plot(x,sin(9*x)./x)
h2=legend({'$$\frac{{\sin (9x)}}{x}$$'},'interpreter','latex');  % ���ͼ��
set(h2,'Color','y')  % ����ͼ����ɫΪ��ɫ
