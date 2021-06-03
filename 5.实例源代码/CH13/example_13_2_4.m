a=90;b=450;d=30;theta=0.3*pi;T=0.1;
dd=0.5;    % 设定导弹击中敌舰的距离条件
dt=0.002;      % 设定时间步长
t=0;
err=inf;k=1;
x(1)=0;y(1)=0;
xx(1)=d;yy(1)=0;
while err>dd
    D=sqrt((d+a*t*cos(theta)-x(k))^2+(a*t*sin(theta)-y(k))^2);
    x(k+1)=x(k)+b*dt*(d+a*t*cos(theta)-x(k))/D;  % 导弹的横坐标
    y(k+1)=y(k)+b*dt*(a*t*sin(theta)-y(k))/D;  % 导弹的纵坐标
    xx(k+1)=d+a*(t+dt)*cos(theta);  % 敌舰的横坐标
    yy(k+1)=a*(t+dt)*sin(theta);  % 敌舰的纵坐标
    err=sqrt((x(k+1)-xx(k+1))^2+(y(k+1)-yy(k+1))^2);
    t=t+dt;k=k+1;
    plot(x,y,'r.',xx,yy,'o')  % 绘制图形
    axis([0 40 0 7])
    if t>T  % 判断t和T的大小关系
        flag=1;break;  % 若t>T则跳出循环
    end
    pause(0.5);
end
hold on
plot(x(end),y(end),'rh','MarkerSize',18)
legend('导弹运动轨迹','敌舰运动轨迹',2)
if flag==1
    text(27,5.5,'不能击中!!!','fontname','隶书','fontsize',14)
    title(['导弹在时间',num2str(T),'h内不能击中敌舰'])
else
    text(27,5.5,'击中!!!','fontname','隶书','fontsize',14)
    title(['导弹在时间',num2str(t),'h击中敌舰'])
end
