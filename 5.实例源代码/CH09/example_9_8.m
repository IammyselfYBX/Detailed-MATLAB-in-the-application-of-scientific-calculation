f=@(t,y)[1.2*y(1)-0.6*y(1)*y(2);
    -0.8*y(2)+0.3*y(1)*y(2)];  % 定义微分方程组表达式
[t,y]=ode45(f,[0,20],[2,1]);  % 利用ode45()函数求解微分方程组
subplot 121  % 图形分割
h=plot(t,y);  % 绘制数值解图形
set(h(2),'LineStyle','-','Marker','o','MarkerSize',4,...
    'MarkerEdgeColor','k','MarkerFaceColor','w')  % 设置线型、线宽和标记符号
subplot 122  % 图形分割
plot(y(:,1),y(:,2))  % 绘制相图
%
options=odeset('RelTol',1e-4);  % 设置优化参数'RelTol'为1e-4
[t,y]=ode45(f,[0,20],[2,1],options);  % 求解微分方程组
subplot 121  % 图形分割
h=plot(t,y);  % 绘制数值解图形
set(h(2),'LineStyle','-','Marker','o','MarkerSize',4,...
    'MarkerEdgeColor','k','MarkerFaceColor','w')  % 设置线型、线宽和标记符号
subplot 122  % 图形分割
plot(y(:,1),y(:,2))  % 绘制相图
