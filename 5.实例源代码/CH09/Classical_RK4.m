function [x,y]=Classical_RK4(odefun,xspan,y0,h,varargin)
% 经典Runge-Kutta法求解常微分方程
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
    K1=feval(odefun,x(k),y(k),varargin{:});
    K2=feval(odefun,x(k)+h/2,y(k)+h/2*K1,varargin{:});
    K3=feval(odefun,x(k)+h/2,y(k)+h/2*K2,varargin{:});
    K4=feval(odefun,x(k)+h,y(k)+h*K3,varargin{:});
    y(k+1)=y(k)+h/6*(K1+2*K2+2*K3+K4);
end
x=x';y=y';
