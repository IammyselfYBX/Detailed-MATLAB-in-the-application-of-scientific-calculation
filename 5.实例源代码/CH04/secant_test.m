x=0:0.01:2;
[xx,iter,X]=secant(@humps,1.5,1,1e-8)  % ���߷����
plot(x,humps(x),[0,2],[0,0],'k:',xx,humps(xx),'k*')  % ����ͼ��
text(1,40,['humps�������{\itx}^*=',num2str(xx)],...
    'fontname','times new roman','fontsize',12)  % ��ӱ�ע
title('\fontname{����}\fontsize{16}���߷����')  % ��ӱ���
