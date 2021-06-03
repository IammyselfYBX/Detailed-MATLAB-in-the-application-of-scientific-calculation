function [t,y] = nlshoot(f1,fv,tspan,x0f,tol,varargin)
% 非线性打靶法求解微分方程
% 输入参数：
%       ---f1：原微分方程组的函数描述
%       ---fv：用来描述式（9-34）类型的函数
%       ---tspan：求解区间
%       ---x0f：给定的边值条件
%       ---tol：用于控制参数m的误差
%       ---p1,p2,...：函数f1和fv的附加参数
% 输出参数：
%       ---t：变量离散数据
%       ---y：函数分量的离散数据
m0=1;  % m的初值
err=1;
while abs(err)>tol;
    [t,v] = ode45(fv,tspan,[x0f(1);m0;0;1],varargin);  % 计算迭代式
    m=m0-[v(end,1)-x0f(2)]/v(end,3);  % 更新m的数值
    err=m-m0;
    m0=m;
end
[t,y] = ode45(f1,tspan,[x0f(1);m],varargin);  % 利用得到的初值求解方程
