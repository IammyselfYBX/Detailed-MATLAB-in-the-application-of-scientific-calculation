odefun=@(t,x)[0.04*(1-x(1))-(1-x(2))*x(1)+0.0001*(1-x(2))^2;
    -1e4*x(1)+3000*(1-x(2))^2];  % 定义刚性微分方程组
x0=[0;1];  % 初值
tspan=[0 100];  % 求解区间
% 使用ode45函数计算
tic;[t1,y1]=ode45(odefun,tspan,x0);T1=toc;
% 使用ode15s函数计算
tic,[t2,y2]=ode15s(odefun,tspan,x0);T2=toc;
subplot(221);plot(t1,y1)  % 绘制ode45函数求解结果
xlabel('(a)ode45函数求解结果')  % 添加x轴标注
subplot(222);plot(t2,y2)  % 绘制ode15s函数绘制结果
xlabel('(b)ode15s函数求解结果')  % 添加x轴标注
subplot(223);plot(t1(1:end-1),diff(t1))  % 绘制ode45函数求解过程中的步长
xlabel('(c)ode45函数求解过程的步长')  % 添加x轴标注
subplot(224);plot(t2(1:end-1),diff(t2))  % 绘制ode15s函数求解过程中的步长
xlabel('(d)ode15s函数求解过程的步长')  % 添加x轴标注
% 以下部分作表
T=[T1,T2];N=[length(t1),length(t2)];
fun={'ode45函数','ode15s函数'};
type={'计算时间','计算点数'};
figure
axes('Position',[0.125 0.33 0.775 0.3])  % 设置坐标轴的位置
plot((0:3)'*[1,1],[0,3],[0,3],(0:3)'*[1,1],'Color','k')  % 绘制表格
title('\fontname{隶书}\fontsize{14}刚性方程组求解')  % 添加标题
axis off  % 取消坐标轴
for k=1:2
    h1(k)=text(0.5,1.5-(k-1),['\bf',char(fun(k))]);  % 标注求解函数类型
    h2(k)=text(1.5,1.5-(k-1),[num2str(T(k)),'s']);  % 标注求解时间
    h3(k)=text(2.5,1.5-(k-1),[num2str(N(k)),'s']);  % 标注求解点数
    h4(k)=text(1.5+(k-1),2.5,['\bf',char(type(k))]);  % 标注计算时间和计算点数
end
set([h1,h2,h3,h4],'HorizontalAlignment','center')  % 设置标注为居中显示
set(gcf,'Color','w')  % 设置窗口颜色为白色
