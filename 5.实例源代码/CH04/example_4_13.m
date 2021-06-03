F=@(x)[sin(2*x(2))*exp(x(1))-2*x(2)^2-1;cos(2*x(1))+x(2)*sin(x(1))];  % 定义方程组
ezplot('sin(2*y)*exp(x)-2*y^2-1',[0,7,-6,6])  % 绘制第一个方程的曲线图
hold on  % 图形保持
h=ezplot('cos(2*x)+y*sin(x)');  % 绘制第二个方程的曲线图
set(h,'Color','r')  % 设置第二条曲线的颜色
title(char('sin(2*y)*exp(x)-2*y^2-1','cos(2*x)+y*sin(x)'))  % 添加标题
[xx,yy]=ginput  % 鼠标取点
X=[];
for k=1:length(xx)
    x=fsolve(F,[xx(k),yy(k)]);  % fsolve函数求方程组的根
    X=[X;x];  % 将根依次存入矩阵X中
end
X
plot(X(:,1),X(:,2),'k*','MarkerSize',14)  % 绘制方程组的根