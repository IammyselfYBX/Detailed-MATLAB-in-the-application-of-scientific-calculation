f=@(t,x)[x(2);-2*x(1)-3*x(2)+exp(-5*t);x(4);...
    2*x(1)-3*x(3)-4*x(2)-4*x(4)-sin(t)];  % 定义微分方程组
[t,x]=Classical_RK4s(f,[0,10],[1;2;3;4],0.05);  % 利用经典四阶Runge-Kutta求解
h=plot(t,x(:,[1,3]));  % 绘制数值解图形
set(h(2),'LineStyle','-.','LineWidth',2)  % 设置线型和线宽
H=legend('{\itx}({\itt})','{\ity}({\itt})');  % 添加图例
set(H,'fontname','times new roman','fontsize',12)  % 利用句柄操作设置图例的字体和字号
figure;plot(x(:,1),x(:,3))  % 绘制相图
