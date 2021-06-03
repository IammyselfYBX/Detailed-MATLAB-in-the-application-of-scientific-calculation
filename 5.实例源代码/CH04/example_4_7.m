function example_4_7
x0=2;
x=0.5:0.1:3;
[x1,iter1,X1]=newton_reroot(@fun,x0);  % �ظ����ε����
[x2,iter2,X2]=newton(@fun,x0);  % ţ�ٷ����
plot(x,fun(x),'k',[0.5 3],[0 0],'k:',x1,fun(x1),'k*')  % ����ͼ��
h(1)=text(1.5,2,['���̵ĸ�{\fontname{times}\itx}^*=',num2str(x1)]);  % ��ӱ�ע
h(2)=text(0.8,-2,['ţ������������������',num2str(iter1)]);  % ��ӱ�ע
h(3)=text(0.8,-3,[blanks(4),'ţ�ٷ�����������',num2str(iter2)]);  % ��ӱ�ע
h(4)=title('ţ�ٷ���ţ���������Ƚ�')  % ��ӱ���
set(h,'fontname','����','fontsize',12)  % �����ֺ�������
% ���������ļ�
function [y,dy,d2y]=fun(x)
y=x.^4-(231*x.^3)/25 + (17901*x.^2)/625 -...
    (579501*x)/15625 + 6762366/390625;  % ���㺯��ֵ
yy=sym('x^4-(231*x^3)/25 + (17901*x^2)/625 -(579501*x)/15625 + 6762366/390625');
dy=diff(yy);dy=subs(dy,x);  % һ�׵���
d2y=diff(yy,2);d2y=subs(d2y,x);  % ���׵���
