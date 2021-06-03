function [t,y] = lineshoot(f1,f2,tspan,x0f,varargin)
% 线性打靶法求解程序
% 输入参数：
%       ---f1：原微分方程的函数描述
%       ---f2：齐次微分方程的函数描述
%       ---tspan：求解区间
%       ---x0f：给定的边值条件
%       ---p1,p2,...：函数f1和f2的附加参数
% 输出参数：
%       ---t：变量离散数据
%       ---y：函数分量的离散数据
[t,y1] = ode45(f2,tspan,[1;0],varargin);  % 计算函数y_1(t)
[t,y2] = ode45(f2,tspan,[0;1],varargin);  % 计算函数y_2(t)
[t,yp] = ode45(f1,tspan,[0;0],varargin);  % 计算函数y_p(t)
m = [x0f(2)-x0f(1)*y1(end,1)-yp(end,1)]/y2(end,1);  % 求参数m
[t,y] = ode45(f1,tspan,[x0f(1);m],varargin);  % 求出原微分方程的解
