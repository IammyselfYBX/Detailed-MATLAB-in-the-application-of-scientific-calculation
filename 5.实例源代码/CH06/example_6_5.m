x=-1:0.01:1;
xdata=-1:0.2:1;
ydata=1./(1+25*xdata.^2);
yi=pchip(xdata,ydata,x);  % 分段三次Hermite插值
% yi=interp1(xdata,ydata,x,'pchip');  % 调用函数interp1()的'pchip'选项进行分段三次Hermite插值
% yi=interp1(x,y,xi,'cubic');  % 立方插值
% pp=pchip(xdata,ydata);  % 分段三次Hermite插值
% yi=ppval(pp,x);  % 求x处的分段三次Hermite插值多项式的函数值
subplot(2,1,1)  % 图形分割
plot(x,1./(1+25*x.^2),'k',x,yi,'k:',xdata,ydata,'ko')  % 绘制图形
legend('解析曲线','分段三次hermite插值')  % 添加图例
text(-0.9,0.8,{'分段三次','埃尔米特插值'},...
    'fontname','隶书','fontsize',16)  % 添加标注
subplot(2,1,2)  % 图形分割
plot(x,yi-1./(1+25*x.^2),'k')  % 绘制图形
legend(char('\fontsize{8}分段三次hermite','插值误差曲线'),2);  % 添加图例
legend('boxoff')  % 设置图例边框为无
