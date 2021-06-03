x=-2:0.01:2;
f=@(x)x.^3-1;
g=@(x)(x+1).^(1/3);x0=3.5;
[x1,iter1]=fixpt(g,x0);            %�򵥵�������ѡȡ��������Ϊg
[x2,iter2]=steffensonfixpt(f,x0);  %˹�ٷ�ɭ���ٷ���ѡȡ��������Ϊf
[x3,iter3]=steffensonfixpt(g,x0);  %˹�ٷ�ɭ���ٷ���ѡȡ��������Ϊg
plot(x,f(x)-x,[-2,2],[0,0],'k:',x1,f(x1)-x1,'k*')  % ����ͼ��
text(-1,4,['�������{\itx}^*=',num2str(x1)],...
    'fontname','times new roman','fontsize',12)  % ��ӱ�ע
h(1)=text(-1,-3,'����ĵ���������');
h(2)=text(-1,-4,['�򵥵�������ѡȡ��������g��',num2str(iter1)]);
h(3)=text(-1,-5,['˹�ٷ�ɭ���ٷ���ѡȡ��������f��',num2str(iter2)]);
h(4)=text(-1,-6,['˹�ٷ�ɭ���ٷ���ѡȡ��������g��',num2str(iter3)]);
title('\fontname{����}\fontsize{16}���ֵ����������ʱȽ�');  % ��ӱ���
set(h,'fontname','����','fontsize',14)  % ���ñ�ע�����ֺ�
