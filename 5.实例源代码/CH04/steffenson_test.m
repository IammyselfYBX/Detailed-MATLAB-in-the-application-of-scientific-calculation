f=@(x)exp(x)-x-5;  % ���庯�����ʽ
x=1:0.01:4;
[xx,iter,X]=steffenson(f,1.8,1e-8)  % Steffenson�����
plot(x,f(x),[1,4],[0,0],'k:',xx,f(xx),'k*')  % ����ͼ��
text(2,30,['�������{\itx}^*=',num2str(xx)],...
    'fontname','times new roman','fontsize',12)  % ��ӱ�ע
title('\fontname{����}\fontsize{16}Steffenson�����')  % ��ӱ���
