function Newton_demo
figure('Color','w','Name','ţ�ٷ���������','NumberTitle','off','MenuBar','none')
x0=3.5;
[xx,iter,X]=newton(@f,x0);
x1 = linspace(1,4);
plot(x1,f(x1),[1,4],[0 0],'k:',xx,f(xx),'k*');
hold on
XX=reshape([[x0;X] [x0;X]]',1,[]);
F=reshape([zeros(length(X)+1,1) f([x0;X])]',1,[]);
plot(XX(1:7),F(1:7),'k')
[y,k]=f(XX([2,4]));
a1 = linspace(0,atan(k(1))*0.6); % ��ǽǶ�
plot(XX(3)+0.15*cos(a1),4*sin(a1),'k'); % ��ǽǶȵĻ���
a2 = linspace(0,atan(k(2))*0.35);
plot(XX(5)+0.15*cos(a2),4*sin(a2),'k');
text(XX([3 5])+0.17,[2.5 1],{'{\it\alpha}_1','{\it\alpha}_2'},'fontname','times','fontsize',16)
text(XX(1:2:7),-2*ones(1,4),{'{\itx}_0','{\itx}_1','{\itx}_2','\bf\cdot\cdot\cdot'},'fontname','times','fontsize',16)
text(xx-0.1,f(xx)+2,'{\itx}^*','fontname','times','fontsize',16)
text(3.2,32,'{\ity}={\itf}({\itx})\rightarrow','fontname','times','fontsize',16)
text(1.5,40,'ţ�ٷ���������','fontname','����','fontsize',16)
text(1.5,30,'$${x_{k+1}}={x_k}-\frac{{f({x_k})}}{{f''({x_k})}}$$','interpreter','latex','fontsize',14)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [y,dy] = f(x);
y = exp(x)-x-5;  % ���㺯��ֵ
ff = sym('exp(x)-x-5');  % ������ź���
dy = diff(ff);  % ��1�׵���
dy = subs(dy,x);  % ��ֵ