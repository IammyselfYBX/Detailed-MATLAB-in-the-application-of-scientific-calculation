mu=3;sigma=0.5;  % 正态分布参数设定
x=mu+sigma*[-3:-1,1:3];
yf=normcdf(x,mu,sigma);  % 计算累积分布函数值
yh=normpdf(x,mu,sigma);  % 计算概率密度值
P=[yf(4)-yf(3),yf(5)-yf(2),yf(6)-yf(1)]; 
xd=1:0.1:5;yd=normpdf(xd,mu,sigma);  % 计算概率密度值
plot(xd,yd,'b')  % 绘制图形
hold on
plot([x(1),x(1)],[0,yh(1)],[x(6),x(6)],[0,yh(6)],...
      [x(1),2.7],[yh(1),yh(1)],'k:',[3.15,x(6)],[yh(1),yh(1)],'k:')
plot([x(2),x(2)],[0,yh(2)],[x(5),x(5)],[0,yh(5)],...
      [x(2),2.7],[yh(2),yh(2)],'k:',[3.15,x(5)],[yh(2),yh(2)],'k:')
plot([x(3),x(3)],[0,yh(3)],[x(4),x(4)],[0,yh(4)],...
      [x(3),2.7],[yh(3),yh(3)],'k:',[3.15,x(4)],[yh(3),yh(3)],'k:')
text(mu-0.5*sigma,yh(3),num2str(P(1)))
text(mu-0.5*sigma,yh(5),num2str(P(2)))
text(mu-0.5*sigma,yh(1),num2str(P(3)))
set(gca,'xticklabel',[],'yticklabel',[])
x=[x(1)-0.1,x(2)-0.1,x(3)-0.1,mu,x(4)-0.1,x(5)-0.1,x(6)-0.1];
y=-0.02*ones(1,7);
text(x,y,{'\mu-3\sigma','\mu-2\sigma','\mu-\sigma','\mu',...
            '\mu+\sigma','\mu+2\sigma','\mu+3\sigma'})
title('3\sigma准则图形表示')
