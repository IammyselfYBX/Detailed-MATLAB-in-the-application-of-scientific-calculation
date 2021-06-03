l=1;   % 摆长
g=9.8;   % 重力加速度
f=@(t,x,g,l)[x(2);-g/l*sin(x(1))];   % 定义微分方程组
[t,x]=ode45(@(t,x)f(t,x,g,l),[0,10],[pi/4,0]);   % 微分方程组求解
%上面语句等价于：[t,x]=ode45(f,[0,10],[pi/4,0],[],g,l);
set(gcf,'DoubleBuffer','on'); % 设置图形窗口的渲染效果
axis([-l,l,-l*1.5,0.5],'square');hold on;
h=plot([0,0],[l*cos(x(1)-pi/2),l*sin(x(1)-pi/2)],'ro-',...
    'LineWidth',2,'Markersize',6);
box on  % 使坐标轴密封
% 以下部分制作动画
for k=2:size(x,1)
    C1=l*cos(x(k,1)-pi/2);C2=l*sin(x(k,1)-pi/2);  % 计算摆的端点坐标
    set(h,'Xdata',[0,C1],'Ydata',[0,C2]);  % 更新摆的位置坐标
    title(['单摆演示：{\it\bft} = ',num2str(t(k))],'fontname',...
        'times new roman','fontsize',14)  % 添加标题以显示时间
    pause(0.1);  % 暂停0.1秒
end
figure('Position',[100 100 560 180],'Color','w')  % 生成一个图形窗口并设置位置和颜色
subplot(131);plot(t,x(:,1));s(1)=title('\itt-\theta');  % 绘制摆的角位移随时间的变化
subplot(132);plot(t,x(:,2));s(2)=title('\itt-\omega');  % 绘制摆的角速度随时间的变化
subplot(133);plot(x(:,1),x(:,2));s(3)=title('\it\theta-\omega'); % 绘制摆的角速度随角位移的变化
set(s,'fontname','times new roman','fontsize',16)  % 设置标题的字体和字号
