function example_13_2_2
a=90;b=450;d=50;theta=pi/2;T=0.1;
[t,y]=ode45(@fun,[0,T],[0 0],[],a,b,d,theta);  % 求微分方程的数值解
x=[d+a*t*cos(theta),a*t*sin(theta)];  % 敌舰运动轨迹的坐标点
n=length(t);j=n;
for i=1:n
    plot(x(i,1),x(i,2),'o',y(i,1),y(i,2),'r.')
    axis([0 max(x(:,1)) 0 max(x(:,2))])
    hold on
    m(i)=getframe;
    if y(i,1)>=x(i,1)
        j=i;break;
    end
end
hold off
movie(m)  % 播放动画
if j<n
    hold on
    plot(y(j,1),y(j,2),'rh','Markersize',18)
    hold off
    title(['导弹在',num2str(t(j)),'小时内击中敌舰'])
else
    title(['导弹在',num2str(T),'小时内不能击中敌舰'])
end
legend('敌舰运动轨迹','导弹运动轨迹',2)
text(5,6,['{\itd}= ',num2str(d),'km'],'fontname','times','fontsize',12)
text(5,5.5,'{\it\theta} ={\it\pi}/2','fontname','times','fontsize',12)
text(40,6,'不能击中!!!','fontname','隶书','fontsize',14,'Rotation',45)
delta=y(end,1)-(d+a*t(end)*cos(theta))
set(gcf,'Color','w')
%--------------------微分方程描述函数---------------------%
function dy=fun(t,y,a,b,d,theta)
dydx=(a*t*sin(theta)-y(2))./(abs(d+a*t*cos(theta)-y(1)));
dy(1)=b/(1+dydx^2)^0.5;
dy(2)=b/(1+dydx^(-2))^0.5;
dy=dy(:);
