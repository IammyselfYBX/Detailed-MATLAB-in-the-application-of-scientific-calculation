function [x,iter,X]=fixpt(g,x0,eps,maxiter)
% 简单迭代法求非线性方程的根
% 输入参数：
%      ---g：迭代函数
%      ---x0：初始迭代点
%      ---eps：精度要求，默认值为1e-6
%      ---maxiter：最大迭代次数，默认值为1e4
% 输出参数：
%      ---x：非线性方程的近似根
%      ---iter：迭代次数
%      ---X：每一步迭代的结果
if nargin<2,error('输入参数至少需要3个！'),end
if nargin<3|isempty(eps),eps=1e-6;end
if nargin<4|isempty(maxiter),maxiter=1e4;end
err=1;k=0;
while err>eps
    k=k+1;
    x1=feval(g,x0);  % 迭代
    err=abs(x1-x0);  % 相邻两次的误差
    x0=x1;  % 更新
    X(k)=x1;
end
if k==maxiter
    error('迭代次数超限，迭代失败！')
end
x=x1;iter=k;X=X';
