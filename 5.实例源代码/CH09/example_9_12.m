f=@(t,x,dx)[dx(1)-x(2);
    dx(2)*sin(x(4))+dx(4)^2+2*x(1)*x(3)*exp(-x(2))-x(1)*dx(2)*x(4);
    dx(3)-x(4);
    x(1)*dx(2)*dx(4)+cos(dx(4))-3*x(3)*x(2)*exp(-x(1))];  % ������ʽ΢�ַ�����
t0=0;  % �Ա�����ֵ
x0=[1 0 0 1]';  % ״̬������ֵ
fix_x0=ones(4,1);  % ����x0
dx0=[0;1;1;-1];  % ״̬����һ�׵���ֵ
fix_dx0=[];  % �ȼ���fix_dx0=zeros(4,1);
[x0,dx0]=decic(f,t0,x0,fix_x0,dx0,fix_dx0);   % ��x0ȷ��dx0
[t,y]=ode15i(f,[0,3],x0,dx0);  % ����ode15i���������ʽ΢�ַ�����
plot(t,y)  % ������ֵ��ͼ��
h=legend('\itx','\itx''','\ity','\ity''',2);  % ���ͼ��
set(h,'fontname','times','fontsize',12)  % ����������ֺ�
