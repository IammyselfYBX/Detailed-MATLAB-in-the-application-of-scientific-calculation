clear all;clc;
set(gcf,'DoubleBuffer','on','Color','w');
x1=0:0.1:200;
x21=200-x1;
x22=(200-1.25*x1)/0.75;
plot(x1,x21,x1,x22,x1,[zeros(size(x1));150*ones(size(x1))])
k1=find(x21==150);
k2=find(x22==0);
k3=find(x21==x22);
hold on
fill([0,x1(k2),x1(k3),x1(k1),0],[0,0,x21(k3),150,150],'y')
plot([0,x1(k2),x1(k3),x1(k1),0],[0,0,x21(k3),150,150],'k.',...
    'MarkerSize',16)
x=x1(1:1000);
y=-4/5*x1(1:1000);
h=plot(x,y,':');
for k=1:500
    X=x1(k);Y=5/4*X;X1=x+X;Y1=y+4*Y;
    set(h,'XData',X1,'YData',Y1)
    pause(0.01)
end
for k=1:173
    XX=x1(k);YY=5/4*XX;X2=X1-XX;Y2=Y1-4*YY;
    set(h,'XData',X2,'YData',Y2)
    pause(0.01)
end
text([140,40],[60,200],{'$$\leftarrow{y_1}=200-x$$',...
    '$$\leftarrow{y_2}=\frac{{200-1.25x}}{{0.75}}$$'},...
    'interpreter','latex','fontsize',12)
annotation('textarrow',[0.29 0.32],[0.5 0.6],'TextEdgeColor','none',...
    'String',{['最优点：(',num2str(x1(k1)),',',num2str(150),')']},...
    'fontname','隶书','fontsize',14);
xlabel('{\fontname{times}\itP}_1产品生产量/件','fontname','隶书','fontsize',14)
ylabel('{\fontname{times}\itP}_2产品生产量/件','fontname','隶书','fontsize',14)
title('线性规划几何意义','fontname','隶书','fontsize',16)