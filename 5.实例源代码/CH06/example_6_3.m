xdata=0:0.125:0.5;  % 时间向量
ydata=[0 6.24 7.75 4.85 0];  % 电流值
xi=0:0.01:0.5;  % 加密时间向量
rand('state',0)  % 设定随机数状态
yi=hermite_interp(xdata,ydata,rand(1,5)-0.5,xi);  % Hermite插值
plot(xdata,ydata,'ko')  % 绘制已知数据点
hold on  % 图形保持
plot(xi,yi,'k')  % 绘制插值后的图形
title('\fontname{隶书}\fontsize{16}埃尔米特插值')  % 添加标题
legend('给定的节点数据','插值曲线')  % 添加图例
