clear all;clc;close all;
h(1)=figure;
x=0:0.01:0.8;
fun=@(x)x.^3+0.1;
x0=0.7;
[xx,iter,X]=fixpt(fun,x0);
plot(x,[x;fun(x)],'k',xx,xx,'k*')
hold on
X=[x0;X];
XX=reshape([X X]',1,[]);
F=reshape([X fun(X)]',1,[]);
plot(XX(1:6),F(1:6),'k')
text(XX(2:2:6)-0.015,fun(XX(2:2:6))+0.02,{'\downarrow','\downarrow','\downarrow'},'fontsize',20)
text(XX([3 5]),XX([3 5])+0.007,{'\leftarrow','\leftarrow'},'fontsize',20)
text(0.2,0.7,'单调模式','fontname','华文行楷','fontsize',20)
text(XX(2:2:6),fun(XX(2:2:6))-0.03,{'({\itx}_0,{\itg}({\itx}_0))','({\itx}_1,{\itg}({\itx}_1))','({\itx}_2,{\itg}({\itx}_2))'},'fontname','times','fontsize',12)
text(xx,xx-0.03,'{\itx}^* \bf…','fontname','times','fontsize',12)
text(0.2,0.6,'$$\left\{\begin{array}{l}y=g(x)\\y=x\\ \end{array}\right.$$','interpreter','latex','fontsize',16)
h(2)=figure;
x=0.2:0.01:1;
fun=@(x)exp(-x);
x0=0.9;
[xx,iter,X]=fixpt(fun,x0);
plot(x,[x;fun(x)],'k',xx,xx,'k*')
hold on
X=[x0;X];
XX=reshape([X X]',1,[]);
F=reshape([X fun(X)]',1,[]);
plot(XX(1:9),F(1:9),'k')
text(XX([2 6])-0.015,fun(XX([2 6]))+0.022,{'\downarrow','\downarrow'},'fontsize',20)
text(XX([3 7]),XX([3 7])+0.007,{'\leftarrow','\leftarrow'},'fontsize',20)
text(XX([4 8])-0.013,fun(XX([4 8]))-0.035,{'\uparrow','\uparrow'},'fontsize',20)
text(XX([5 9])-0.045,XX([5 9])+0.007,{'\rightarrow','\rightarrow'},'fontsize',20)
text(0.4,0.9,'螺旋模式','fontname','华文行楷','fontsize',20)
text(XX(2:2:8),fun(XX(2:2:8))+0.025,{'({\itx}_0,{\itg}({\itx}_0))','({\itx}_1,{\itg}({\itx}_1))','({\itx}_2,{\itg}({\itx}_2))','({\itx}_3,{\itg}({\itx}_3))'},'fontname','times','fontsize',12)
text(xx,fun(xx)-0.02,'{\itx}^*','fontname','times','fontsize',12)
text(0.4,0.8,'$$\left\{\begin{array}{l}y=g(x)\\y=x\\ \end{array}\right.$$','interpreter','latex','fontsize',16)
set(h,'Color','w')