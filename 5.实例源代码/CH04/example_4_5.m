function example_4_5
x=0:0.01:2;
[xx,iter,X]=newton_down(@f,1,[],100)  % ţ����ɽ�����
plot(x,f(x),[0,2],[0,0],'k:',xx,f(xx),'k*')  % ����ͼ��
text(1,40,['humps�������{\itx}^*=',num2str(xx)],...
    'fontname','times new roman','fontsize',12)  % ��ӱ�ע
title('\fontname{����}\fontsize{16}ţ����ɽ�����')  % ��ӱ���
% ���������ļ�
function [y,dy] = f(x)
y = 1./((x-.3).^2 +.01)+1./((x-.9).^2 +.04)-6;  % ���㺯��ֵ
ff = sym('1/((x-.3)^2 +.01)+1/((x-.9)^2 +.04)-6');  % ������ź���
dy = diff(ff);  % ��1�׵���
dy = subs(dy,x);  % �滻
