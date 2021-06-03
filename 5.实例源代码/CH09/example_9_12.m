f=@(t,x,dx)[dx(1)-x(2);
    dx(2)*sin(x(4))+dx(4)^2+2*x(1)*x(3)*exp(-x(2))-x(1)*dx(2)*x(4);
    dx(3)-x(4);
    x(1)*dx(2)*dx(4)+cos(dx(4))-3*x(3)*x(2)*exp(-x(1))];  % 定义隐式微分方程组
t0=0;  % 自变量初值
x0=[1 0 0 1]';  % 状态变量初值
fix_x0=ones(4,1);  % 保留x0
dx0=[0;1;1;-1];  % 状态变量一阶导数值
fix_dx0=[];  % 等价于fix_dx0=zeros(4,1);
[x0,dx0]=decic(f,t0,x0,fix_x0,dx0,fix_dx0);   % 由x0确定dx0
[t,y]=ode15i(f,[0,3],x0,dx0);  % 利用ode15i函数求解隐式微分方程组
plot(t,y)  % 绘制数值解图形
h=legend('\itx','\itx''','\ity','\ity''',2);  % 添加图例
set(h,'fontname','times','fontsize',12)  % 设置字体和字号
