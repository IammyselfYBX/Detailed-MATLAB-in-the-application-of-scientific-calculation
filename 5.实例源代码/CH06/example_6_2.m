xdata=0:0.125:0.5;  % 时间向量
ydata=[0 6.24 7.75 4.85 0];  % 导体中的电流值
xi=0:0.01:0.5;  % 加密时间向量
[yi,D]=newton_interp(xdata,ydata,xi);  % Newton插值
plot(xdata,ydata,'ko')  % 绘制已知数据点
hold on  % 图形保持
plot(xi,yi,'k')  % 绘制插值后的图形
disp('差商表D：')  % 显示差商表D
disp(D)
title('\fontname{隶书}\fontsize{16}牛顿插值')  % 添加标题
legend('给定的节点数据','插值曲线')  % 添加图例
