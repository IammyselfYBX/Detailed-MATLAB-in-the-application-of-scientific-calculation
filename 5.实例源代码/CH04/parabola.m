function [x,iter,X]=parabola(fun,x0,x1,x2,eps,maxiter)
% 抛物线法求解非线性方程的根
% 输入参数：
%      ---fun：迭代函数
%      ---x0,x1,x2：初始迭代点
%      ---eps：精度要求，默认值为1e-6
%      ---maxiter：最大迭代次数，默认值为1e4
% 输出参数：
%      ---x：非线性方程的近似根
%      ---iter：迭代次数
%      ---X：每一步迭代的结果
if nargin<4,error('输入参数至少需要4个！'),end
if nargin<5|isempty(eps),eps=1e-6;end
if nargin<6|isempty(maxiter),maxiter=1e4;end
k=0;err=1;
while err>eps
    k=k+1;
    f0 = feval(fun,x0);    % 计算x0处函数值
    f1 = feval(fun,x1);    % 计算x1处函数值
    f2 = feval(fun,x2);    % 计算x2处函数值
    w=(f2-f1)/(x2-x1)+((f2-f1)/(x2-x1)-...
        (f1-f0)/(x1-x0))/(x2-x0)*(x2-x1);
    x3 = x2-2*f2/[w+sign(w)*sqrt(w^2-4*f2*((f2-f1)/(x2-x1)-...
        (f1-f0)/(x1-x0))/(x2-x0))];  % 抛物线法迭代公式
    err=abs(x3-x2);
    x0 = x1; % 更新x0的值
    x1 = x2; % 更新x1的值
    x2 = x3;
    X(k)=x3;
end
if k>=maxiter
    error('迭代次数超限，迭代失败！')
end
x=x3;iter=k;X=X';
