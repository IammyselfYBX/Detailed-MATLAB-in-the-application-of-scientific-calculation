x=0:0.01:2;
fun=@(x)1./((x-.3).^2 +.01)+1./((x-.9).^2 +.04)-6;  % ���庯�����ʽ
[xx,fx,iter,X]=bisect(fun,0,2,1e-8);  % ���ַ��������Է���
plot(x,humps(x),[0,2],[0,0],'k:',xx,fx,'k*')  % ����ͼ��
text(1,40,['humps�������{\itx}^*=',num2str(xx)],...
    'fontname','times new roman','fontsize',12)  % ��ӱ�ע
title('\fontname{����}\fontsize{16}���ַ����')  % ��ӱ���
