function example_4_9
x0 = [-5; -5];
[x,iter,X]=newtong(@f,x0)  % ţ�ٷ����
ezplot('2*x-y-exp(-x)')  % ���Ƶ�һ�����̵�����ͼ
hold on  % ͼ�α���
h=ezplot('-x+2*y-exp(-y)');  % ����ͼ��
set(h,'Color','k','LineWidth',2)  % ����ͼ�ε��߿�
plot(x(1),x(2),'k*','MarkerSize',12)  % �������
text(1,-1,strjust(char('���̵ĸ�{\fontname{times}\itx}^*��',num2str(x)),'center'),'fontsize',12)
text(-5,4,'$$\left\{\begin{array}{l}2{x_1}-{x_2}={e^{-{x_1}}}\\-{x_1}+2{x_2}={e^{-{x_2}}}\\\end{array}\right.$$','interpreter','latex','fontsize',14)  % ��ӱ�ע
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% �����ļ����������غ���ֵ��jacobi����
function [y,J]=f(x)
y=[2*x(1) - x(2) - exp(-x(1));
    -x(1) + 2*x(2) - exp(-x(2))];  % ���㺯��ֵ
% ��Jacobi����
syms xx yy;  % �������ű���
J=jacobian([2*xx-yy-exp(-xx);-xx+2*yy-exp(-yy)],[xx yy]);  % �����jacobi����
J=subs(J,xx,x(1));  % �滻
J=subs(J,yy,x(2));  % �滻
