figure('Color','w','Name','割线法几何意义','NumberTitle','off','MenuBar','none')
f=@(x)exp(x)-x-5;
x0=3.5;x1=3;
[xx,iter,X]=secant(f,x0,x1);
x2 = linspace(1,4);
plot(x2,f(x2),[1,4],[0 0],'k:',xx,f(xx),'k*');
XX=reshape([[x0;x1;X] [x0;x1;X]]',1,[]);
F=reshape([zeros(length(X)+2,1) f([x0;x1;X])]',1,[]);
hold on
plot(XX(3:7),F(3:7),'k',XX([1 2 4 6]),F([1 2 4 6]),'k')
text(XX(2:2:6)-0.1,F(2:2:6)+2,{'{\itf}_0','{\itf}_1','{\itf}_2'},'fontname','times','fontsize',12)
text(XX(1:2:7),F(1:2:7)-2,{'{\itx}_0','{\itx}_1','{\itx}_2','{\itx}_3'},'fontname','times','fontsize',12)
text(xx,f(xx)-2,'{\itx}^* \bf…','fontname','times','fontsize',12)
text(1.5,40,'割线法几何意义','fontname','隶书','fontsize',16)
text(1.5,30,'$${x_{k + 1}} = {x_k} - \frac{{{x_k} - {x_{k - 1}}}}{{f({x_k}) - f({x_{k - 1}})}}f({x_k})$$','interpreter','latex','fontsize',14)
text(3.35,38,'{\ity}={\itf}({\itx})\rightarrow','fontname','times','fontsize',16)