f=@(t,x)[x(2);-2*x(1)-3*x(2)+exp(-5*t);x(4);...
    2*x(1)-3*x(3)-4*x(2)-4*x(4)-sin(t)];  % ����΢�ַ�����
[t,x]=Classical_RK4s(f,[0,10],[1;2;3;4],0.05);  % ���þ����Ľ�Runge-Kutta���
h=plot(t,x(:,[1,3]));  % ������ֵ��ͼ��
set(h(2),'LineStyle','-.','LineWidth',2)  % �������ͺ��߿�
H=legend('{\itx}({\itt})','{\ity}({\itt})');  % ���ͼ��
set(H,'fontname','times new roman','fontsize',12)  % ���þ����������ͼ����������ֺ�
figure;plot(x(:,1),x(:,3))  % ������ͼ
