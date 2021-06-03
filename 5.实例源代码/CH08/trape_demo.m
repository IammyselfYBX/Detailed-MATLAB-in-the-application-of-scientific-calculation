h=axes;
x=-1:0.1:5;
y=@(x)exp(-x).*sin(x)+cos(x)+2;
h1=plot(x,y(x));
hold all
plot([0 3.5],y([0 3.5]),'k:')
xn=linspace(0,3.5);
fill([xn,fliplr(xn)],[zeros(1,length(xn)),fliplr(linspace(y(0),y(3.5)))],[0.9,0.9,0.9])
plot([0,3.5],y([0,3.5]),'k.','MarkerSize',20)
copyobj(h1,h)
text(2,3,'\fontname{隶书}\fontsize{16}梯形公式几何意义')
text(-0.85,y(0),'$$(a,f(a))$$','interpreter','latex','fontsize',12)
text(3.6,y(3.5),'$$(b,f(b))$$','interpreter','latex','fontsize',12)
text(1.2,y(1),'$$y = f(x)$$','interpreter','latex','fontsize',12)
set(gcf,'Color','w')