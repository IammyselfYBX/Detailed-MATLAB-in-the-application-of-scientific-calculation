f=@(t,y)[1.2*y(1)-0.6*y(1)*y(2);
    -0.8*y(2)+0.3*y(1)*y(2)];  % 定义微分方程组
[t,y]=Classical_RK4s(f,[0,20],[2,1],0.005);  % 利用经典四阶Runge-Kutta求解微分方程组
h=plot(t,y,'LineWidth',2);  % 绘制数值解
set(h(2),'LineStyle','-.')  % 设置线型
figure  % 打开一个图形窗口
plot(y(:,1),y(:,2))  % 绘制相平面图
