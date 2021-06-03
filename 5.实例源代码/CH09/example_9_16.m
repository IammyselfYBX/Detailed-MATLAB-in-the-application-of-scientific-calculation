q=5;
lambda = 15;  % 未知参数猜测值
x=linspace(0,pi,10);  % 需要计算的点
yinit=@(x)[cos(4*x);-4*sin(4*x)];  % 使用函数估计目标值
solinit = bvpinit(x,yinit,lambda);  % 生成计算网格
odefun=@(x,y,lambda)[y(2);-(lambda - 2*q*cos(2*x))*y(1)];  % 边值微分方程
bcfun=@(ya,yb,lamdba)[ya(2);yb(2);ya(1)-1];  % 边界条件
opts=bvpset('AbsTol',0.5,'RelTol',0.38,'Stats','on');  % 设置bvpset属性'AbsTol'、'RelTol'和'Stats'的属性值分别为0.5、0.38和'on'
sol = bvp4c(odefun,bcfun,solinit,opts);  % 利用bvp4c函数求解边值问题
lambda1 = sol.parameters  % 显示参数值lambda1
opts.AbsTol=1e-6;opts.RelTol=1e-3;  % 修改bvpset属性AbsTol、RelTol的属性值分别为1e-6和1e-3
sol1= bvp4c(odefun,bcfun,sol,opts);  % 再次调用bvp4c函数求解边值问题
lambda2 = sol1.parameters  % 显示参数值lambda2
plot(solinit.x,solinit.y(1,:),'ks--',sol.x,sol.y(1,:),'bo:',...
    sol1.x,sol1.y(1,:),'r*-')  % 绘制求解结果图形
h=legend('猜测解','第一近似解','第二近似解',0);  % 添加图例
set(h,'fontname','隶书','fontsize',12)  % 设置图例字体和字号
axis([0,pi,-1,1.2]),xlabel('x'),ylabel('solution y')  % 设置坐标轴范围和添加x、y轴标注
