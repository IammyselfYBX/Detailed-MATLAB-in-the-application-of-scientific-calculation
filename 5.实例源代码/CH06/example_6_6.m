x=-1:0.01:1;
xdata=-1:0.2:1;
ydata=1./(1+25*xdata.^2);
yi=spline(xdata,ydata,x);  % 三次样条插值
% yi=interp1(xdata,ydata,x,'spline');  % interp1()函数'spline'选项实现三次样条插值
% pp=spline(xdata,ydata);  % 三次样条插值
% yi=ppval(pp,x);
% pp=csape(xdata,ydata);  % csape()函数实现三次样条插值
% yi=ppval(pp,x);  % 等价于：yi=ppual(pp,x);
subplot(2,1,1)  % 图形分割
plot(x,1./(1+25*x.^2),'k',x,yi,'k:',xdata,ydata,'ko')  % 绘制图形
legend('解析曲线','三次样条插值')  % 添加图例
text(-0.9,0.8,'三次样条插值','fontname','隶书','fontsize',16)  % 添加标注
subplot(2,1,2)  % 图形分割
plot(x,yi-1./(1+25*x.^2),'k')  % 绘制图形
legend('三次样条插值误差曲线')  % 添加图例
