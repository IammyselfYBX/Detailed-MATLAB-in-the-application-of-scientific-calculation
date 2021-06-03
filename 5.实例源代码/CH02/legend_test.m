x=0:0.01:pi;
y1=sin(2*x);y2=cos(2*x);
subplot 121
plot(x,y1,x,y2,':')
axis tight  % 限定坐标刻度等于数据范围
h1=legend('sin(2{\itx})','cos(2{\itx})',3);  % 添加图例标注
set(h1,'fontname','times','fontsize',12,'Color','none')  % 设置图例的字体和颜色
subplot 122
plot(x,sin(9*x)./x)
h2=legend({'$$\frac{{\sin (9x)}}{x}$$'},'interpreter','latex');  % 添加图例
set(h2,'Color','y')  % 设置图例颜色为黄色
