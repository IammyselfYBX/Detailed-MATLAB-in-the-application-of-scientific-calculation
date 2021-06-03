h=axes;
x=-1:0.1:5;
y=@(x)exp(-x).*sin(x)+cos(x)+2;
h1=plot(x,y(x));
hold all
x0=-0.7;x1=1.6;x2=4;
xx=three_point_parabola(x0,y(x0),x1,y(x1),x2,y(x2));
yy=@(x,xx)xx(1)*x.^2+xx(2)*x+xx(3);
plot(x,yy(x,xx))
xn=linspace(-0.7,4);
fill([xn,fliplr(xn)],[zeros(1,length(xn)),fliplr(yy(xn,xx))],[0.9,0.9,0.9])
plot([x0,x1,x2],y([x0,x1,x2]),'k.','MarkerSize',20)
copyobj(h1,h)
text(2,3,'\fontname{隶书}\fontsize{16}辛普森公式几何意义')
text(x0+0.1,y(x0),'$$(a,f(a))$$','interpreter','latex','fontsize',12)
text(x1,y(x1)+0.2,'$$(\frac{{a + b}}{2},f(\frac{{a + b}}{2}))$$',...
    'interpreter','latex','fontsize',12)
text(x2+0.1,y(x2),'$$(b,f(b))$$','interpreter','latex','fontsize',12)
text(1.2,y(1),'$$y = f(x)$$','interpreter','latex','fontsize',12)
set(gcf,'Color','w')
