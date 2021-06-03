x1=0:7;x2=0:8;
y1=(56-9*x1)/7;
y2=(70-7*x1)/20;
h1=plot(x1,y1,x1,y2);
hold on
plot(xlim,[0,0],'k',[0,0],ylim,'k')
xlim([-1 7])
[X,Y]=meshgrid(x1,x2)
Y1=repmat(y1,length(x2),1);
Y2=repmat(y2,length(x2),1);
k=find(Y1<Y|Y2<Y);
Y(k)=NaN;
plot(X,Y,'k.','MarkerSize',14)
plot(x1(1:3),-4/9*x1(1:3),'k--','LineWidth',2)
h2=plot(x1(4:6),-4/9*x1(4:6)+34/9,'k--','LineWidth',2);
legend([h1',h2],{'$${y_1}=\frac{{56-9{x_1}}}{7}$$',...
    '$${y_2}=\frac{{70-7{x_1}}}{{20}}$$','$$y=-\frac{4}{9}x+C$$'},...
    'interpreter','latex','fontsize',12)
title('\fontname{隶书}\fontsize{16}线性整数规划图形表示')
set(gcf,'Color','w')