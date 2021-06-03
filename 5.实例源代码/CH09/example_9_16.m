q=5;
lambda = 15;  % δ֪�����²�ֵ
x=linspace(0,pi,10);  % ��Ҫ����ĵ�
yinit=@(x)[cos(4*x);-4*sin(4*x)];  % ʹ�ú�������Ŀ��ֵ
solinit = bvpinit(x,yinit,lambda);  % ���ɼ�������
odefun=@(x,y,lambda)[y(2);-(lambda - 2*q*cos(2*x))*y(1)];  % ��ֵ΢�ַ���
bcfun=@(ya,yb,lamdba)[ya(2);yb(2);ya(1)-1];  % �߽�����
opts=bvpset('AbsTol',0.5,'RelTol',0.38,'Stats','on');  % ����bvpset����'AbsTol'��'RelTol'��'Stats'������ֵ�ֱ�Ϊ0.5��0.38��'on'
sol = bvp4c(odefun,bcfun,solinit,opts);  % ����bvp4c��������ֵ����
lambda1 = sol.parameters  % ��ʾ����ֵlambda1
opts.AbsTol=1e-6;opts.RelTol=1e-3;  % �޸�bvpset����AbsTol��RelTol������ֵ�ֱ�Ϊ1e-6��1e-3
sol1= bvp4c(odefun,bcfun,sol,opts);  % �ٴε���bvp4c��������ֵ����
lambda2 = sol1.parameters  % ��ʾ����ֵlambda2
plot(solinit.x,solinit.y(1,:),'ks--',sol.x,sol.y(1,:),'bo:',...
    sol1.x,sol1.y(1,:),'r*-')  % ���������ͼ��
h=legend('�²��','��һ���ƽ�','�ڶ����ƽ�',0);  % ���ͼ��
set(h,'fontname','����','fontsize',12)  % ����ͼ��������ֺ�
axis([0,pi,-1,1.2]),xlabel('x'),ylabel('solution y')  % ���������᷶Χ�����x��y���ע
