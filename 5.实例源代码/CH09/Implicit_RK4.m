function [x,y]=Implicit_RK4(odefun,xspan,y0,h,varargin)
% 四阶隐式Runge-Kutta公式求解常微分方程
% 输入参数：
%      ---odefun：微分方程的函数描述
%      ---xspan：求解区间[x0,xn]
%      ---y0：初始条件
%      ---h：迭代步长
%      ---p1,p2,…：odefun函数的附加参数
% 输出参数：
%      ---x：返回的节点，即x=xspan(1):h:xspan(2)
%      ---y：微分方程的数值解
x=xspan(1):h:xspan(2);
y(1)=y0;
for k=1:length(x)-1
    z0=feval(odefun,x(k),y(k),varargin{:});
    z1=feval(odefun,x(k)+h,y(k)+h*z0,varargin{:});
    z2=inf;
    while abs(z2-(y(k)+h/2*(z0+z1)))>1e-4
        K1=feval(odefun,x(k)+(3-sqrt(3))/6*h,y(k)+...
            1/4*z0*h+(3-2*sqrt(3))/12*z1*h,varargin{:});
        K2=feval(odefun,x(k)+(3+sqrt(3))/6*h,y(k)+...
            1/4*z1*h+(3+2*sqrt(3))/12*z0*h,varargin{:});
        z2=y(k)+h/2*(K1+K2);
        z0=K1;z1=K2;
    end
    y(k+1)=z2;
end
x=x';y=y';
