x=-0.5:0.01:1;
fun=@(x)sin(x)-x.^2+0.5;  % ���庯�����ʽ
[xx,iter,X]=fixpt(fun,1.5,1e-8);  % ������������
plot(x,sin(x)-x.^2-x+0.5,[-0.5,1],[0,0],'k:',...
    xx,fun(xx)-xx,'k*')  % ����ͼ��
text(0,-0.2,['�������{\itx}^*=',num2str(xx)],...
    'fontname','times new roman','fontsize',12)  % ��ӱ�ע
title('\fontname{����}\fontsize{16}�򵥵��������')  % ��ӱ���
