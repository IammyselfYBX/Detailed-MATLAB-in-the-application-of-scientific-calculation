ezplot('y^2*sin(2*y) + x^2*cos(2*x) -1',[-2,2]);  % 绘制第一个方程曲线
h=get(gca,'Children');  % 获取句柄信息
set(h,'Color','r','LineStyle',':');  % 改变曲线颜色和线型
hold on;
ezplot('x^3 + y^3 - 6*cos(2*x*y) + 1',[-2,2]);  % 绘制第一个方程曲线
str=get(get(gca,'Title'),'String');  % 获取当前title中的字符串
title(['x^2cos(2x)+y^2sin(2y)-1=0, ',str]);  % 更换字符串
axis equal;  % 设置单位长度一致
