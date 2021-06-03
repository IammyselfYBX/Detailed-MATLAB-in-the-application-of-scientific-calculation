figure('Color','w','Name','抛物线法几何意义','NumberTitle','off','MenuBar','none')
f=@(x)exp(x).*sin(x.^2)+1;
x0=0.8;x1=1;x2=1.6;
[xx,iter,X]=parabola(f,x0,x1,x2)
x=0.5:0.01:2.5;
plot(x,f(x),[0.5,2.5],[0,0],'k:',xx,f(xx),'k*')
XX=[x0;x1;x2;X];F=f(XX);
y1=three_point_parabola(XX(1),F(1),XX(2),F(2),XX(3),F(3));
y2=three_point_parabola(XX(2),F(2),XX(3),F(3),XX(4),F(4));
hold on
xx1=linspace(XX(1),XX(4));
plot(xx1,polyval(y1,xx1),'k',XX(1:3),F(1:3),'k.')
plot(xx1,polyval(y2,xx1),'k',XX(2:4),F(2:4),'k.')
plot([XX(1:4) XX(1:4)]',[zeros(4,1) F(1:4)]','k:')
text(xx,f(xx)-0.4,'{\itx}^* \bf…','fontname','times','fontsize',12)
text(XX(1:4),zeros(4,1)-0.4,{'{\itx}_0','{\itx}_1','{\itx}_2','{\itx}_3'},'fontname','times','fontsize',12)
text(1.6,5,'\fontname{隶书}\fontsize{16}抛物线法几何意义')
text(0.6,-3,'$${x_{k + 1}} = {x_k} - \frac{{2{f_k}}}{{\omega\pm\sqrt{{\omega^2}-4{f_k}{b_k}}}}$$','interpreter','latex','fontsize',14)
text(0.6,-5,'\fontname{隶书}\fontsize{16}其中')
text(0.85,-5,'$${b_k} = f[{x_k},{x_{k - 1}},{x_{k - 2}}]$$','interpreter','latex','fontsize',14)
text(0.85,-6.5,'$$\omega  = f[{x_k},{x_{k - 1}}] + {b_k}({x_k} - {x_{k - 1}})$$','interpreter','latex','fontsize',14)
