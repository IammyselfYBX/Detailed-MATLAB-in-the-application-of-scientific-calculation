R=1;r=0.7*R;
f=@(x)-2*cos(0.2*x)+2;  % 定义函数f(x)
df=@(x)0.4*sin(0.2*x);  % 定义函数df(x)/dx
x0=eps:0.1:25;
set(gcf,'DoubleBuffer','on');  % 设置图形窗口的渲染效果
h=ezplot('-2*cos(0.2*x)+2',[-4,30]);
axis equal
ylim([-10,15])
hold on
t=linspace(0,2*pi,length(x0));
h1=plot(R*(exp(i*t)+i));
phi=atan(df(x0(1)));  % 计算phi
theta=1/R*quadl(@(x)sqrt(1+df(x).^2),0,x0(1));  % 计算theta
x=x0(1)-R*df(x0(1))/sqrt(1+df(x0(1))^2)-r*sin(theta-phi);
y=f(x0(1))+R/sqrt(1+df(x0(1))^2)-r*cos(theta-phi);
X=x0(1)-R*df(x0(1))/sqrt(1+df(x0(1))^2);
Y=f(x0(1))+R/sqrt(1+df(x0(1))^2);
h2=plot(X,Y,'g.');
h3=plot(x,y,'r*');
h4=plot(x,y,'r','LineWidth',2);
Z1=[x];Z2=[y];
for k=2:length(x0)  % 制作动画
    phi1=atan(df(x0(k)));theta1=1/R*quadl(@(x)sqrt(1+df(x).^2),0,x0(k));
    C1=x0(k)-R*df(x0(k))/sqrt(1+df(x0(k))^2)-r*sin(theta1-phi1);
    C2=f(x0(k))+R/sqrt(1+df(x0(k))^2)-r*cos(theta1-phi1);
    X=x0(k)-R*df(x0(k))/sqrt(1+df(x0(k))^2);
    Y=f(x0(k))+R/sqrt(1+df(x0(k))^2);
    % 更新车轮的坐标
    set(h1,'Xdata',real(R*(exp(i*t)+i))+x0(k)-R*sin(phi1),'Ydata',imag(R*(exp(i*t)+i))+f(x0(k)))
    set(h2,'Xdata',X,'Ydata',Y)  % 更新O’点的坐标
    Z1=[Z1,C1];Z2=[Z2,C2];
    set(h3,'Xdata',[x,C1],'Ydata',[y,C2])  % 更新P点的坐标
    set(h4,'Xdata',Z1,'Ydata',Z2)
    pause(0.1)  % 暂停0.1秒
end
